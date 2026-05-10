# Uptime Clock Pro Localization

This project uses drop-in Rainmeter include files for user-visible language text.

Language files live in:

```text
Skins\UptimeClockPro\@Resources\Languages
```

Current languages:

- `en.inc` - English
- `ru.inc` - Russian
- `es.inc` - Spanish
- `it.inc` - Italian
- `fr.inc` - French
- `de.inc` - German

## How It Works

- `@Resources\UserSettings.inc` stores the active language:

```ini
Language=en
LanguageId=1
```

- `Clock\Anchor.ini`, `Control\Launcher.ini`, and `Uptime\Words.ini` include:

```ini
@IncludeLanguage=#@#Languages\#Language#.inc
```

- A future language can be added by copying `en.inc`, translating the values, and saving it as a new language code such as `es.inc`, `de.inc`, or `fr.inc`.
- Every language file must define the same variable keys as `en.inc`.
- The settings panel opens `Language\Picker.ini`. More languages should add a row to that popup rather than adding more controls to `Control\Launcher.ini`.
- Rainmeter local skin/include files with non-ASCII text must be saved as UTF-16 LE. Do not save translated `.ini` or `.inc` files as UTF-8, or Rainmeter may display mojibake.

## Covered UI

The current localization layer covers:

- Settings/control panel labels and buttons.
- Language picker labels.
- Weather setup instructions and saved-coordinate fallback text.
- Nominatim reverse-location `accept-language`.
- Clock date format.
- Weather condition labels from Open-Meteo weather codes.
- Weather readout labels such as feels-like temperature and humidity.
- Optional uptime words module format and caption.

Brand/product names, units, coordinates, numeric weather values, and Rainmeter metadata are intentionally not translated unless the product direction changes.

## Required Keys

Use `en.inc` as the source of truth. A language file must include every key below:

```text
DateFormat
LangClockContextOpenControl
LangClockContextRefreshWeather
LangClockContextOpenSettings
LangControlContextClose
LangUptimeContextClose
LangSubtitle
LangLoad
LangRefresh
LangClose
LangWeatherSetup
LangResolvedLocation
LangCoordinatesSaved
LangSettingsNote
LangLatitude
LangLongitude
LangClickToSet
LangFindCoordinates
LangLanguage
LangEnglish
LangRussian
LangCurrentLanguageName
LangChangeLanguage
LangLanguagePicker
LangEnglishName
LangRussianName
LangSpanishName
LangItalianName
LangFrenchName
LangGermanName
LangLayoutExtras
LangLayoutCinematic
LangLayoutWeather
LangLayoutCompact
LangToggleUptimeWords
LangCloseSetupPanel
LangWeatherDefault
LangWeatherClear
LangWeatherMainlyClear
LangWeatherPartlyCloudy
LangWeatherCloudy
LangWeatherFog
LangWeatherFreezingFog
LangWeatherLightDrizzle
LangWeatherDrizzle
LangWeatherHeavyDrizzle
LangWeatherFreezingDrizzle
LangWeatherLightRain
LangWeatherRain
LangWeatherHeavyRain
LangWeatherFreezingRain
LangWeatherLightSnow
LangWeatherSnow
LangWeatherHeavySnow
LangWeatherSnowGrains
LangWeatherRainShowers
LangWeatherShowers
LangWeatherHeavyShowers
LangWeatherSnowShowers
LangWeatherHeavySnowShowers
LangWeatherThunderstorm
LangWeatherStormHail
LangFeels
LangHumidityShort
LangUptimeFormat
LangUptimeCaption
```

## Quick Validation

Run from the project root:

```powershell
$refs = rg -o "#Lang[A-Z][A-Za-z0-9]+#|#DateFormat#" Skins\UptimeClockPro\Clock\Anchor.ini Skins\UptimeClockPro\Control\Launcher.ini Skins\UptimeClockPro\Language\Picker.ini Skins\UptimeClockPro\Uptime\Words.ini | ForEach-Object { if ($_ -match '#([^#]+)#') { $matches[1] } } | Sort-Object -Unique
foreach ($langFile in Get-ChildItem Skins\UptimeClockPro\@Resources\Languages\*.inc) {
  $text = Get-Content -LiteralPath $langFile.FullName -Raw
  $missing = @($refs | Where-Object { $text -notmatch "(?m)^$([regex]::Escape($_))=" })
  if ($missing.Count) {
    "$($langFile.Name) missing: $($missing -join ', ')"
  } else {
    "$($langFile.Name): all referenced language variables present"
  }
}
```

Before packaging, also check the skin visually in Rainmeter because translated text may be longer than English and can need spacing tweaks.
