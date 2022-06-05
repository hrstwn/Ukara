/*
* SPDX-License-Identifier: GPL-3.0-or-later
* SPDX-FIleCopyrightText: 2022 hrstwn <herusetiawan3@gmail.com>
*/

public class Ukara : Gtk.Application {
    public Gtk.CssProvider css_provider;
    public Ukara () {
        Object (
            application_id: "com.github.hrstwn.ukara",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var headerbar = new HeaderBar ();
        var button_enter = new Gtk.Button.with_label ("Transliterate"){
            margin = 12
        };
        
        var latin_in = new Gtk.Entry (){
            margin = 12,
            placeholder_text = "Type in Latin to transliterate",
            hexpand = true,
            vexpand = true
        };
        
        var javanese_out = new Gtk.Label ("ꦲꦸꦏꦫ"){
            margin = 12,
            width_chars = 33,
            xalign = 0,
            selectable = true
        };
        
        javanese_out.get_style_context ().add_class ("aksara");
        
        button_enter.clicked.connect (() => {
            // button_enter.sensitive = false;
            // javanese_out.label = latin_in.get_text();
        });
        var main_grid = new Gtk.Grid (){
            orientation = Gtk.Orientation.VERTICAL,
            row_spacing = 6,
            column_spacing = 6
        };
        main_grid.add (javanese_out);
        main_grid.add (latin_in);
        main_grid.add (button_enter);
        
        var main_window = new Gtk.ApplicationWindow (this) {
            default_height = 300,
            default_width = 300,
            title = "Hello World"
        };
        
        main_window.set_titlebar (headerbar);
        main_window.add (main_grid);
        main_window.show_all ();
        
        css_provider = new Gtk.CssProvider ();
        
        try {
            css_provider.load_from_data(""
                + ".aksara {font-size:100px;color:#fff;}"
            );
        }
        catch (GLib.Error e) {
            error (e.message);
        }
    }
}
