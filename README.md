# Actions Launcher Demo

A demo [elementary OS](https://elementary.io/) app showcasing activation of application-level actions over D-Bus.

This app is put together to validate an update to elementary OS' developer docs proposed by Danielle in [Issue #180: Document actions handling for launchers](https://github.com/elementary/docs/issues/180).

References:
1. [Setting up an application for D-Bus Launching](https://wiki.gnome.org/HowDoI/DBusApplicationLaunching)
1. [Integrating with GNOME → D-Bus activation](https://developer.gnome.org/documentation/guidelines/maintainer/integrating.html#d-bus-activation)
1. [elementary Developer Docs](https://docs.elementary.io/develop/)

## Build and install

### Flatpak

I recommend building the app with Flatpak, since it depends on elementary SDK version 7 which is not publicly released as of this writing. To build the app first make install the SDK:

```shell
flatpak install --user io.elementary.Sdk//7
```

Then you can build and install the app itself:

```shell
flatpak-builder build com.github.antolius.demo.yml --user --install --force-clean
```

### Meson

If you are running elementary 7 you can build it with Meson, as long as you install these dependencies:

* meson
* valac
* gtk4

Build with:

```shell
meson build --prefix=/usr
cd build
ninja
```

and then install:

```shell
ninja install
```

## License

[GNU GPLv3](LICENSE)

Copyright © 2022 Josip Antoliš, josip.antolis@protonmail.com.
