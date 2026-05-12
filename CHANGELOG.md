# Beta Build Changelog

This file tracks Uptime Clock Pro beta release progress.

## Unreleased Beta

Future beta work will continue here after `0.6.1`.

## 0.6.1 Stable Beta - 2026-05-12

Clock-format patch release with a user-selectable 12-hour / 24-hour mode.

Release asset:

- `Uptime-Clock-Pro_0.6.1-stable-beta.rmskin`

### Added

- Added a `Clock format` switch in the setup panel with `12h` and `24h` options.
- Added `ClockUse24Hour`, `ClockTimeFormat`, and `ClockMeridiemHidden` settings so the selected format persists in `@Resources\UserSettings.inc`.
- Added localized `Clock format` labels for the current language set.

### Changed

- The main time meter now keeps the same WindSong clock styling while reading the selected time format from settings.
- The lowercase `am` / `pm` marker is styled inline at the end of the time string so spacing stays consistent across layouts and display environments.
- The old separate `am` / `pm` meter is hidden; 24-hour mode removes the marker through the selected time format.

### Notes

- Live test sync preserved Peter's saved weather coordinates and language settings.

## 0.6.0 Stable Beta - 2026-05-10

Language selection beta with a dedicated picker popup and six initial translations.

Release asset:

- `Uptime-Clock-Pro_0.6.0-stable-beta.rmskin`

README preview:

- `docs/screenshots/uptime-clock-pro-language-picker.png`

### Added

- Added English, Russian, Spanish, Italian, French, and German language files for the clock weather labels, control panel, right-click context labels, and optional uptime words module.
- Added a compact language row in the control panel that opens `Language\Picker.ini`; switching language writes only `Language` and `LanguageId` to `@Resources\UserSettings.inc`.
- Saved non-ASCII translated language includes as UTF-16 LE so Rainmeter renders Cyrillic and accented characters correctly on default Windows installs.
- Added `docs\LOCALIZATION.md` so future language requests can use the same drop-in include pattern.

### Changed

- Language picker now stays open after selecting a language and closes only through its `X` button or context close.
- Setup panel and language picker use solid panel backgrounds for readability while testing longer translated strings.
- Removed an internal author-metadata guidance sentence from the packaged skin README.

## 0.5.1 Stable Beta - 2026-05-08

Small beta patch for clock typography spacing after live layout review.

Release asset:

- `Uptime-Clock-Pro_0.5.1-stable-beta.rmskin`

### Fixed

- Added a little more breathing room between the time numerals and lowercase `am` / `pm` marker in the Weather layout.
- Applied the same meridiem spacing adjustment to the Cinematic layout so wider time strings do not crowd the final digit.

### Notes

- No weather data, settings, artwork, or install behavior changed in this beta tick.

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
- Control panel for loading, refreshing, closing, coordinate entry, unit selection, coordinate instructions, and resolved-location feedback.
- Optional uptime words module.
- Validated `.rmskin` release asset for stable beta distribution.

### Still Planned

- Easier weather location setup with city/postal/ZIP lookup.
- More visual/interaction polish as real-world testing exposes rough edges.
- Additional layout and sizing controls for deeper user customization.
- More weather setup convenience beyond manual decimal coordinates.

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

- This `0.4.1-beta` checkpoint was superseded by the published `0.5.0` stable beta.
- City/postal/ZIP lookup was still future work at this checkpoint; users entered decimal coordinates.
- Weather setup copy and meridiem spacing were still being tuned at this checkpoint.

