# Beta Build Changelog

This file tracks Uptime Clock Pro beta release progress.

## Unreleased Beta

Future beta work will continue here after `0.5.0`.

## 0.5.0 Stable Beta - 2026-05-08

First stable beta package for public prerelease testing.

Release asset:

- `Uptime-Clock-Pro_0.5.0-stable-beta.rmskin`

### Release Notes

- Promoted the project from prototype/test package to stable beta.
- Updated Rainmeter metadata version to `0.5.0`.
- Confirmed the skin runs well enough for beta distribution.
- Kept this as a GitHub prerelease so future polish and settings work can continue without implying a final 1.0.

### Included

- Integrated clock/date/weather anchor.
- Painterly weather scenes for the current Open-Meteo condition set.
- Three layout presets: Cinematic, Weather, and Compact.
- Control panel for loading, refreshing, closing, coordinate entry, unit selection, and resolved-location feedback.
- Optional uptime words module.
- Repeatable `.rmskin` packaging script with package-shape and private-coordinate checks.

### Still Planned

- Easier weather location setup with city/postal/ZIP lookup.
- More end-user instructions inside the settings flow.
- Continued layout, typography, and weather-scene polish as real-world testing exposes rough edges.

## 0.4.1-beta - 2026-05-08

### Added

- Refocused Uptime Clock Pro into one integrated clock/weather Rainmeter anchor.
- Added Open-Meteo current weather with no API key.
- Added reverse-looked-up resolved location feedback for saved coordinates.
- Added Fahrenheit/Celsius and mph/kmh settings through the control panel.
- Added custom painterly weather scene images for clear, clear-night, partly-cloudy, partly-cloudy-night, cloudy, cloudy-night, drizzle, rain, showers, heavy-rain, storm, hail, snow, fog, ice, and windy states.
- Added three layout presets: Cinematic, Weather, and Compact.
- Added optional text-only uptime words module that can be toggled separately.
- Added PetersMinistry metadata and MIT license alignment across loadable pieces.

### Changed

- Removed the earlier dashboard direction with machine pulse, separate uptime cards, and standalone weather panels.
- Moved weather from a separate card into the clock composition.
- Reduced weather text/readout scale after live testing showed the temperature section was too large.
- Changed optional uptime words to a readable text font instead of script.
- Split the meridiem into its own meter so `am` / `pm` can be positioned independently from the time numerals and date.
- Kept the source `UserSettings.inc` on neutral placeholder coordinates for publication hygiene while the live test skin can use Peter's local coordinates.

### Fixed

- Fixed weather values rendering as partial digits by using explicit numeric captures instead of ungreedy regex behavior.
- Fixed `#TemperatureSuffix#` / similar literal variable text by keeping user settings under `[Variables]`.
- Fixed weather refresh behavior by using one parent WebParser request and child weather-data measures.
- Fixed layout button feedback by storing both `LayoutMode` and `LayoutId`.
- Fixed duplicate/ghost clock rendering in the setup panel by keeping `Control\Launcher.ini` from including the full clock skin.
- Fixed topmost coordinate input behavior by making InputText less eager to dismiss focus.

### Known Issues At This Checkpoint

- This beta checkpoint was not packaged as a release yet.
- City/postal/ZIP lookup is still future work; users currently enter decimal coordinates.
- Weather setup copy still needs one final clarity pass before public packaging.
- Meridiem spacing is still being tuned, especially in the Cinematic layout.

