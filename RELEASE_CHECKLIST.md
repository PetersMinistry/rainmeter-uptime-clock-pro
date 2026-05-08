# Release Checklist

Use this checklist before creating a public Uptime Clock Pro `.rmskin` package.

## Preflight

- Confirm the final `am` / `pm` typography and spacing in Cinematic, Weather, and Compact layouts.
- Confirm Weather, Compact, and Cinematic buttons show the current active layout.
- Confirm the setup panel has its own close option and can close the clock separately.
- Confirm the Refresh button updates the live weather values.
- Confirm latitude/longitude entry writes saved values and refreshes the resolved location.
- Confirm F/mph and C/kmh buttons update units, suffixes, and wind threshold.
- Confirm optional uptime words toggle loads and unloads cleanly.
- Confirm source `Skins\UptimeClockPro\@Resources\UserSettings.inc` uses neutral placeholder coordinates, not Peter's live Sayreville values.
- Confirm all loadable `.ini` files use `Author=PetersMinistry`, `License=MIT`, `Group=UptimeClockPro`, and the release version.
- Confirm GitHub language stats are corrected by `.gitattributes` so Rainmeter `.ini` / `.inc` files are not shown as BitBake.

## Package Metadata

Use the project-root `RMSKIN.ini` with:

```ini
[rmskin]
Name=Uptime Clock Pro
Author=PetersMinistry
Version=0.4.1
LoadType=Skin
Load=UptimeClockPro\Control\Launcher.ini
MinimumRainmeter=4.5.0
MinimumWindows=10.0
```

## Package Contents

Include:

- `Skins\UptimeClockPro\Clock\Anchor.ini`
- `Skins\UptimeClockPro\Control\Launcher.ini`
- `Skins\UptimeClockPro\Uptime\Words.ini`
- `Skins\UptimeClockPro\@Resources\Variables.inc`
- `Skins\UptimeClockPro\@Resources\Styles.inc`
- `Skins\UptimeClockPro\@Resources\UserSettings.inc`
- `Skins\UptimeClockPro\@Resources\Layouts\*.inc`
- `Skins\UptimeClockPro\@Resources\Images\weather-scene-*.png`
- `Skins\UptimeClockPro\@Resources\Fonts\*`
- `Skins\UptimeClockPro\README.md`

Exclude:

- Git metadata.
- `dist`, `packages`, `release`, cache, temp, or log files.
- `FUTURE_IMPROVEMENTS.md`.
- `design` source sheets.
- Loose or nested `.rmskin` / `.zip` files.
- Peter's live local coordinates.

## Validation

- Build from the committed project tree, not the live Rainmeter test folder.
- Build with `.\tools\package-rmskin.ps1`.
- Inspect the `.rmskin` as a ZIP and verify root `RMSKIN.ini` exists.
- Inspect the final package footer and verify the 16-byte Rainmeter footer: little-endian ZIP payload length, then the bytes that display as `NUL RMSKIN NUL`.
- Install into a clean Rainmeter `Skins` folder and load `UptimeClockPro\Control\Launcher.ini`.
- Load the clock, refresh weather, switch all layouts, toggle uptime words, and close the setup panel.
