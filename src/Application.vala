/*
* SPDX-License-Identifier: GPL-3.0-or-later
* SPDX-FIleCopyrightText: 2022 hrstwn <herusetiawan3@gmail.com>
*/

public class Ukara : Gtk.Application {
    public static GLib.Settings settings;
    
    public Ukara () {
        Object (
            application_id: "com.github.hrstwn.ukara",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    static construct {
        settings = new Settings ("com.github.hrstwn.ukara");
    }
    
    protected override void activate () {
        var window = new Window (this);
        
        add_window (window);
    }
    
}
