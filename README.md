# Uptime Clock Pro

Uptime Clock Pro is an original Rainmeter clock/weather utility by PetersMinistry. The project has been refocused around one strong desktop anchor: expressive time, date, and simplified weather with custom condition visuals.

This is early prototype work, but the source tree is shaped for Rainmeter distribution.

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

## Current Features

- Large expressive time and date anchor.
- Integrated current weather using Open-Meteo with no API key.
- Custom Rainmeter shape-based weather visuals for clear, cloudy, rain, snow, fog, and storm conditions.
- Temperature, condition text, and compact weather details worked into the clock composition.
- Small control panel for loading, refreshing, or closing the clock/weather anchor.
- Original PetersMinistry credit and visual direction.

## Notes

- Weather is experimental and currently uses latitude/longitude variables in `Clock\Anchor.ini`.
- Temperature and wind units are variable-driven in `Clock\Anchor.ini` as an early step toward a proper settings flow.
- The active font stack uses WindSong for the clock and Segoe UI Semilight for compact Rainmeter UI text.
- Bundled OFL fonts in `@Resources\Fonts` are included as visual alternates and for future design work.
- The skin intentionally does not force Rainmeter layer, position, or always-on-top settings.
- Older separate uptime, pulse, and standalone weather panels were removed from the core product direction because they made this feel like a dashboard instead of an evolved clock.

## Status

Prototype. Not ready for a formal release package yet.
