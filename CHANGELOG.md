# Beta Build Changelog

This file tracks Uptime Clock Pro beta/prototype progress before a public `.rmskin` release. Formal releases should keep these notes, then add a clean release entry with the packaged version and asset name.

## Unreleased Beta

Current focus:

- Finish the `am` / `pm` typography and spacing pass across all three layout presets.
- Keep Cinematic as the main visual direction while Weather and Compact remain alternate layout options.
- Prepare release packaging only after the visual spacing is approved in Rainmeter.

Release blockers:

- Final approval of meridiem placement in Cinematic.
- Final pass on weather setup wording and coordinate-entry behavior.
- Package validation from the committed project tree, not the live Rainmeter test copy.

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

### Known Issues

- The current beta is not packaged as a release yet.
- City/postal/ZIP lookup is still future work; users currently enter decimal coordinates.
- Weather setup copy still needs one final clarity pass before public packaging.
- Meridiem spacing is still being tuned, especially in the Cinematic layout.

