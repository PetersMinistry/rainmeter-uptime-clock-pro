# Uptime Clock Pro

Prototype original Rainmeter suite inspired by Peter's current `Clock and uptime.ini`.

This is a Codex workspace prototype shaped like a distributable Rainmeter suite.
For real installation or packaging, the root skin folder should be:

```text
%USERPROFILE%\Documents\Rainmeter\Skins\UptimeClockPro
```

## Pieces

- `Clock\Anchor.ini` - large time/date/uptime anchor.
- `Uptime\Session.ini` - compact uptime/session module.
- `System\Pulse.ini` - small CPU/RAM pulse module.
- `Weather\Current.ini` - compact current weather module.
- `Control\Launcher.ini` - launcher for loading or closing pieces.

## Load After Install

After copying or installing the suite into the normal Rainmeter `Skins` folder, refresh all skins and load:

```text
UptimeClockPro\Control\Launcher.ini
```

Or load pieces individually:

```text
UptimeClockPro\Control\Launcher.ini
UptimeClockPro\Clock\Anchor.ini
UptimeClockPro\Uptime\Session.ini
UptimeClockPro\System\Pulse.ini
UptimeClockPro\Weather\Current.ini
```

## Notes

- Original custom suite for Peter/PetersMinistry. Existing skins are reference only, not source material to copy.
- Current visual identity uses WindSong for the clock and Segoe UI Semilight for small UI text because Rainmeter rendered the downloaded variable fonts too chunky at panel sizes. Manrope, Outfit, and Cormorant Garamond are bundled alternates, but not active.
- Install the `.ttf` files in `@Resources\Fonts`, then refresh or restart Rainmeter if Windows has not exposed the font families yet.
- Weather uses Open-Meteo JSON with no API key in the current experiment.
- It does not set Rainmeter layer/position options.
- It should be arranged manually on the desktop like a suite of working pieces.
- Internal activation paths use `#ROOTCONFIG#` so the suite can install under any normal Rainmeter `Skins` folder.
- Theme variables/styles are currently inlined in each `.ini` because shared includes did not resolve reliably during first live testing.
- Future public docs should point back to Peter's GitHub repository once created.
