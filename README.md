# Uptime Clock Pro

Uptime Clock Pro is an original Rainmeter clock/weather utility by PetersMinistry. The project has been refocused around one strong desktop anchor: expressive time, date, and simplified weather with custom condition visuals.

This is a stable beta Rainmeter release. The core clock/weather experience is ready for beta distribution, with future settings and polish passes still planned.

## Preview

### Cinematic

![Uptime Clock Pro cinematic layout](docs/screenshots/uptime-clock-pro-cinematic.png)

### Weather

![Uptime Clock Pro weather layout](docs/screenshots/uptime-clock-pro-weather.png)

### Compact

![Uptime Clock Pro compact layout](docs/screenshots/uptime-clock-pro-compact.png)

## Download

Get the current stable beta from the GitHub Releases page:

[Uptime Clock Pro 0.5.0 Stable Beta](https://github.com/PetersMinistry/rainmeter-uptime-clock-pro/releases/tag/v0.5.0-beta.1)

## Skin Layout

The Rainmeter skin lives in:

```text
Skins\UptimeClockPro
```

Load the control panel from:

```text
UptimeClockPro\Control\Launcher.ini
```

Load the main clock/weather anchor directly from:

```text
UptimeClockPro\Clock\Anchor.ini
```

Load the optional uptime words module from:

```text
UptimeClockPro\Uptime\Words.ini
```

## Current Features

- Large expressive time and date anchor.
- Integrated current weather using Open-Meteo with no API key.
- Custom painterly PNG weather scenes driven by Open-Meteo weather codes.
- Weather scene coverage for clear day/night, partly cloudy day/night, cloudy day/night, drizzle, rain, showers, heavy rain, storm, hail, snow, fog, ice/freezing, and windy basic-sky conditions.
- Temperature, condition text, and compact weather details worked into the clock composition.
- Integrated control/settings block for loading, refreshing, closing, adjusting weather coordinates/units, and showing the resolved location for saved coordinates.
- Three menu-selectable clock layout presets: Cinematic, Weather, and Compact.
- Optional text-only uptime words module that can be loaded and placed independently.
- Original PetersMinistry credit and visual direction.

## Notes

- Weather uses latitude/longitude variables stored in `Skins\UptimeClockPro\@Resources\UserSettings.inc`.
- Weather coordinates and Fahrenheit/Celsius units can be adjusted from `Control\Launcher.ini`. The settings block shows the current saved coordinates and reverse-looked-up location so a user can tell whether the input was accepted; city, postal, and ZIP lookup still belong in a future settings pass.
- The current weather art is raster-based, not shape-only, so package builds must include `@Resources\Images\weather-scene-*.png`.
- Layout presets are stored in `@Resources\Layouts` and selected through `LayoutMode` in `@Resources\UserSettings.inc`.
- The active font stack uses WindSong for the clock and Segoe UI Semilight for compact Rainmeter UI text.
- Bundled OFL fonts in `@Resources\Fonts` are included as visual alternates and for future design work.
- The skin intentionally does not force Rainmeter layer, position, or always-on-top settings.
- Older separate uptime, pulse, and standalone weather panels were removed from the core product direction because they made this feel like a dashboard instead of an evolved clock.

## Status

Stable beta. Packaged for beta distribution and continued real-world testing.

Beta build history is tracked in `CHANGELOG.md`.

## Version

Current build: `0.5.0`

## Credits

Created by [PetersMinistry](https://github.com/PetersMinistry).

Released under the MIT License (`LICENSE.md`). Bundled fonts are licensed separately under the SIL Open Font License and include their license files.

## Packaging Notes

For `.rmskin` release packaging, follow the same verified standard used by Codex Halo:

- Package from the committed Git tree, not the live Rainmeter test folder.
- The package builder writes `RMSKIN.ini` into the installer root.
- Use `Name=Uptime Clock Pro`, `Author=PetersMinistry`, `Version=0.5.0`, `LoadType=Skin`, and `Load=UptimeClockPro\Control\Launcher.ini`.
- Use `MinimumRainmeter=4.5.0` and `MinimumWindows=10.0`.
- Inspect the final package footer; a valid package should end with the 16-byte Rainmeter footer used by Codex Halo, displaying as `NUL RMSKIN NUL`.
- Do not include local-only coordinates, `FUTURE_IMPROVEMENTS.md`, design contact sheets, Git metadata, package outputs, or loose/nested `.rmskin` files.

Build a local test package with:

```powershell
.\tools\package-rmskin.ps1
```
