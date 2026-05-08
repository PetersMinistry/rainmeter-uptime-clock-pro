# Uptime Clock Pro

Prototype original Rainmeter clock/weather utility by PetersMinistry.

For real installation or packaging, the root skin folder should be:

```text
%USERPROFILE%\Documents\Rainmeter\Skins\UptimeClockPro
```

## Pieces

- `Clock\Anchor.ini` - integrated time, date, weather visuals, temperature, and condition text.
- `Control\Launcher.ini` - compact control panel for loading, refreshing, or closing the anchor.

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

- Original custom utility for Peter/PetersMinistry. Existing skins are reference only, not source material to copy.
- Current visual identity uses WindSong for the clock and Segoe UI Semilight for small UI text because Rainmeter rendered the downloaded variable fonts too chunky at panel sizes.
- Weather uses Open-Meteo JSON with no API key in the current experiment.
- Weather location and units are currently edited through variables in `Clock\Anchor.ini`.
- Weather visuals are built with Rainmeter shape meters, not copied weather icon packs.
- It does not set Rainmeter layer/position options.
- Internal activation paths use `#ROOTCONFIG#` so the skin can install under any normal Rainmeter `Skins` folder.
