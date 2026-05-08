param(
    [string]$Version,
    [string]$OutputName
)

$ErrorActionPreference = 'Stop'

$projectRoot = Resolve-Path (Join-Path $PSScriptRoot '..')
$dist = Join-Path $projectRoot 'dist'
$rmskinIni = Join-Path $projectRoot 'RMSKIN.ini'
$userSettings = Join-Path $projectRoot 'Skins\UptimeClockPro\@Resources\UserSettings.inc'

if (!(Test-Path $rmskinIni)) {
    throw "Missing RMSKIN.ini at project root."
}

if (!(Test-Path $userSettings)) {
    throw "Missing source UserSettings.inc."
}

$rmskinText = Get-Content -LiteralPath $rmskinIni -Raw
if (!$Version) {
    $match = [regex]::Match($rmskinText, '(?m)^Version=(.+)$')
    if (!$match.Success) {
        throw "RMSKIN.ini does not contain Version=."
    }
    $Version = $match.Groups[1].Value.Trim()
}

if (!$OutputName) {
    $OutputName = "Uptime-Clock-Pro_$Version-beta-test.rmskin"
}

$settingsText = Get-Content -LiteralPath $userSettings -Raw
foreach ($privateValue in @('40.462345', '-74.327232', 'Sayreville')) {
    if ($settingsText.Contains($privateValue)) {
        throw "Source UserSettings.inc contains private test value: $privateValue"
    }
}

New-Item -ItemType Directory -Path $dist -Force | Out-Null

$zipPath = Join-Path $dist ([IO.Path]::ChangeExtension($OutputName, '.zip'))
$rmskinPath = Join-Path $dist $OutputName

Remove-Item -LiteralPath $zipPath -Force -ErrorAction SilentlyContinue
Remove-Item -LiteralPath $rmskinPath -Force -ErrorAction SilentlyContinue

Push-Location $projectRoot
try {
    git --git-dir=.git-meta --work-tree=. archive --format=zip --prefix='Skins/UptimeClockPro/' HEAD:Skins/UptimeClockPro -o $zipPath
}
finally {
    Pop-Location
}

Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::Open($zipPath, [System.IO.Compression.ZipArchiveMode]::Update)
try {
    foreach ($forbidden in @(
        'Skins/UptimeClockPro/.gitignore',
        'Skins/UptimeClockPro/.gitattributes'
    )) {
        $entry = $zip.GetEntry($forbidden)
        if ($entry) { $entry.Delete() }
    }

    $entry = $zip.CreateEntry('RMSKIN.ini')
    $writer = [System.IO.StreamWriter]::new($entry.Open(), [System.Text.Encoding]::ASCII)
    try {
        $writer.Write($rmskinText.Replace("`r`n", "`n").Replace("`n", "`r`n"))
    }
    finally {
        $writer.Dispose()
    }
}
finally {
    $zip.Dispose()
}

$zip = [System.IO.Compression.ZipFile]::OpenRead($zipPath)
try {
    $entries = @($zip.Entries | ForEach-Object { $_.FullName })
    foreach ($required in @(
        'RMSKIN.ini',
        'Skins/UptimeClockPro/Clock/Anchor.ini',
        'Skins/UptimeClockPro/Control/Launcher.ini',
        'Skins/UptimeClockPro/@Resources/UserSettings.inc',
        'Skins/UptimeClockPro/@Resources/Images/weather-scene-cloudy.png'
    )) {
        if ($entries -notcontains $required) {
            throw "Package ZIP is missing required entry: $required"
        }
    }

    foreach ($pattern in @('.git', '.git-meta', 'FUTURE_IMPROVEMENTS.md', 'design/', 'dist/', '.rmskin', '.zip')) {
        $bad = $entries | Where-Object { $_ -like "*$pattern*" }
        if ($bad) {
            throw "Package ZIP contains forbidden entry matching ${pattern}: $($bad -join ', ')"
        }
    }
}
finally {
    $zip.Dispose()
}

$zipBytes = [System.IO.File]::ReadAllBytes($zipPath)
$footer = New-Object byte[] 16
[BitConverter]::GetBytes([UInt64]$zipBytes.Length).CopyTo($footer, 0)
$signature = [byte[]]@(0,82,77,83,75,73,78,0)
$signature.CopyTo($footer, 8)

$out = New-Object byte[] ($zipBytes.Length + $footer.Length)
[Array]::Copy($zipBytes, 0, $out, 0, $zipBytes.Length)
[Array]::Copy($footer, 0, $out, $zipBytes.Length, $footer.Length)
[System.IO.File]::WriteAllBytes($rmskinPath, $out)
Remove-Item -LiteralPath $zipPath -Force

$footerAscii = -join ($out[($out.Length - 8)..($out.Length - 1)] | ForEach-Object {
    if ($_ -eq 0) { 'NUL ' } else { [char]$_ }
})

[PSCustomObject]@{
    Package = $rmskinPath
    ZipPayloadBytes = $zipBytes.Length
    FooterAscii = $footerAscii.Trim()
    Version = $Version
}
