# Uptime Clock Pro

Stable beta Rainmeter clock/weather utility by PetersMinistry.

For normal Rainmeter installation, the root skin folder should be:

```text
%USERPROFILE%\Documents\Rainmeter\Skins\UptimeClockPro
```

## Pieces

- `Clock\Anchor.ini` - integrated time, date, weather visuals, temperature, and condition text.
- `Control\Launcher.ini` - compact control/settings block for loading, refreshing, closing, and weather setup.
- `Language\Picker.ini` - compact language selection popup.

## Load After Install

After copying or installing the skin into the normal Rainmeter `Skins` folder, refresh all skins and load:

```text
UptimeClockPro\Clock\Anchor.ini
```

Optional control panel:

```text
UptimeClockPro\Control\Launcher.ini
```

## Notes

- Custom Rainmeter clock/weather skin by PetersMinistry. Existing skins are reference only, not source material to copy.
- Suite group metadata should stay `Group=UptimeClockPro` for all loadable pieces.
- Current visual identity uses WindSong for the clock and Segoe UI Semilight for small UI text because Rainmeter rendered the downloaded variable fonts too chunky at panel sizes.
- Weather uses Open-Meteo JSON with no API key.
- Weather coordinates and units can be edited through the control/settings block, which shows saved values, a resolved city/state/country check, basic coordinate instructions, and a lookup link.
- Weather location and units are stored in `@Resources\UserSettings.inc`.
- Clock format can be switched between `12h` and `24h` from the control/settings block and is stored in `@Resources\UserSettings.inc`.
- Language selection supports English, Russian, Spanish, Italian, French, and German through `@Resources\Languages`, uses `Language\Picker.ini`, and is stored in `@Resources\UserSettings.inc`.
- Weather visuals use bundled custom raster scenes, not copied weather icon packs.
- It does not set Rainmeter layer/position options.
- Internal activation paths use `#ROOTCONFIG#` so the skin can install under any normal Rainmeter `Skins` folder.

## Version

Current build: `0.6.1`

Beta build history is maintained in the project root changelog.

## Credits

Created by [PetersMinistry](https://github.com/PetersMinistry).

Released under the MIT License.
