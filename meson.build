project('com.github.hrstwn.ukara', 'vala', 'c')

subdir('src')

install_data(
    'data' / 'ukara.desktop',
    install_dir: get_option('datadir') / 'applications',
    rename:meson.project_name() + '.desktop'
)

install_data(
    'data' / 'ukara.metainfo.xml',
    install_dir: get_option('datadir') / 'metainfo',
    rename: meson.project_name() + '.metainfo.xml'
)

install_data(
    'data' / 'gschema.xml',
    install_dir: join_paths (get_option ('datadir'), 'glib-2.0', 'schemas'),
    rename:  meson.project_name() + '.gschema.xml'
)

meson.add_install_script('meson/post_install.py')
