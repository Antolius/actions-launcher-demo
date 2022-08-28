# project name and language
project('com.github.antolius.demo', 'vala', 'c')

# Create a new executable, list the files we want to compile, list the dependencies we need, and install
executable(
    meson.project_name(),
    'src' / 'Application.vala',
    dependencies: [
        dependency('gtk4')
    ],
    install: true
)

# Install D-Bus service, so the Application can be started by D-Bus
service_config = configuration_data()
service_config.set('EXEC_NAME', get_option('prefix') / get_option('bindir') / meson.project_name())

configure_file(
    input: 'data' / 'demo.service.in',
    output: meson.project_name() + '.service',
    configuration: service_config,
    install: true,
    install_dir: get_option('datadir') / 'dbus-1' / 'services'
)

# Install our .desktop file so the Application Menu will see it
install_data(
    'data' / 'demo.desktop',
    install_dir: get_option('datadir') / 'applications',
    rename: meson.project_name() + '.desktop'
)

# Install our .metainfo.xml file so AppCenter will see it
install_data (
    'data' / 'demo.metainfo.xml',
    install_dir: get_option('datadir') / 'metainfo',
    rename: meson.project_name() + '.metainfo.xml'
)

# Install our icons in all the required sizes
icon_sizes = ['16', '24', '32', '48', '64', '128']

foreach i : icon_sizes
    install_data(
        'data' / i + '.svg',
        install_dir: get_option('datadir') / 'icons' / 'hicolor' / i + 'x' + i / 'apps',
        rename: meson.project_name() + '.svg'
    )
    install_data(
        'data' / i + '.svg',
        install_dir: get_option('datadir') / 'icons' / 'hicolor' / i + 'x' + i + '@2' / 'apps',
        rename: meson.project_name() + '.svg'
    )
endforeach
