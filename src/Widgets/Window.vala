public class Window : Gtk.ApplicationWindow {
    public int[] repeat;
    
    public GLib.Settings settings;
    public Gtk.CssProvider css_provider;
    
    private Gtk.Box main;
    
    public Window (Ukara Translit){
        Object (
            application : Translit
        );
    }
    
    construct {
        get_style_context ().add_class ("rounded");
        settings = new GLib.Settings ("com.github.hrstwn.ukara");

        move (settings.get_int ("pos-x"), settings.get_int ("pos-y"));
        this.set_size_request (640, 500);
        this.set_resizable (true);
        this.set_type_hint (Gdk.WindowTypeHint.DIALOG);
        
        delete_event.connect (e =>{
            return before_destroy();
        });
        
        var headerbar = new HeaderBar ();
        var button_trans = new Gtk.Button.with_label ("Transliterate");
        var latin_input = new Gtk.TextView (){
            hexpand = true,
            vexpand = true,
            wrap_mode = Gtk.WrapMode.WORD_CHAR
        };
        var jv_placeholder = "Ukara";
        
        var javanese_out = new Gtk.TextView (){
            margin = 12,
            vexpand = true,
            wrap_mode = Gtk.WrapMode.WORD_CHAR,
            editable = false
        };
        button_trans.set_size_request (-1, 30);
        javanese_out.buffer.set_text("ꦲꦸꦏꦫ");
        latin_input.buffer.set_text("Type in Latin to Transliterate");
        
        var scrolljv = new Gtk.ScrolledWindow (null,null);
        scrolljv.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
        scrolljv.add (javanese_out);
        
        var scroll = new Gtk.ScrolledWindow (null,null);
        scroll.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
        scroll.add (latin_input);
        
        button_trans.clicked.connect (() => {
            var buffer = latin_input.get_buffer ();
			Gtk.TextIter start, end;
			buffer.get_start_iter (out start);
			buffer.get_end_iter (out end);
            javanese_out.buffer.set_text(latin_input.buffer.get_text(start,end,true));
        }
        );
        
        set_titlebar (headerbar);
        
        javanese_out.get_style_context ().add_class ("aksara");
        latin_input.get_style_context ().add_class ("latin");
        css_provider = new Gtk.CssProvider ();
        
        try {
            css_provider.load_from_data(""
                + ".main {margin:10px}"
                + ".aksara {font-size:36px;background:transparent;}"
                + ".latin {background:#fff;border:2px solid #000;}"
            );
        }
        
        catch (GLib.Error e) {
            error (e.message);
        }
        
        Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
        
        
        main = new Gtk.Box (Gtk.Orientation.VERTICAL, 10);
        main.get_style_context ().add_class ("main");
        
        main.add(scrolljv);
        main.add(scroll);
        main.add(button_trans);
        
        add(main);
        
        show_all ();
    }
    
    
    public bool before_destroy(){
      int width, height, x, y;

      get_size (out width, out height);
      get_position (out x, out y);

      settings.set_int ("pos-x", x);
      settings.set_int ("pos-y", y);
      settings.set_int ("window-width", width);
      settings.set_int ("window-height", height);

      return false;
    }
}
