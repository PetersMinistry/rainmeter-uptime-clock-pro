# Uptime Clock Pro

Uptime Clock Pro is an original Rainmeter utility suite by PetersMinistry. It is designed as a set of small desktop pieces that work together: a clock anchor, uptime panel, system pulse panel, weather panel, and control launcher.

This project is early prototype work, but the source tree is already shaped for Rainmeter distribution.

## Skin Layout

The Rainmeter skin lives in:

```text
Skins\UptimeClockPro
```

Load the suite from:

```text
UptimeClockPro\Control\Launcher.ini
```

Individual pieces:

- `UptimeClockPro\Clock\Anchor.ini`
- `UptimeClockPro\Uptime\Session.ini`
- `UptimeClockPro\System\Pulse.ini`
- `UptimeClockPro\Weather\Current.ini`
- `UptimeClockPro\Control\Launcher.ini`

## Current Features

- Large time/date/uptime anchor.
- Compact system uptime panel.
- CPU/RAM pulse panel.
- Compact current-weather experiment using Open-Meteo with no API key.
- Launcher panel for loading or closing suite pieces.
- Original PetersMinistry credit and visual direction.

## Notes

- Weather is experimental and currently uses latitude/longitude variables in `Weather\Current.ini`.
- The active font stack uses WindSong for the clock and Segoe UI Semilight for compact Rainmeter UI text.
- Bundled OFL fonts in `@Resources\Fonts` are included as visual alternates and for future design work.
- The suite intentionally does not force Rainmeter layer, position, or always-on-top settings.

## Status

Prototype. Not ready for a formal release package yet.
