public class Window : Gtk.ApplicationWindow {
    public int[] repeat;
    
    public GLib.Settings settings;
    public Gtk.CssProvider css_provider;
    
    private Gtk.Box main;
    
    public Window (Ukara Translit){
        Object (
            application : Translit
        );
    
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
        var button_trans = new Gtk.Button.with_label ("Transliterate"){
            margin = 12,
            halign = END,
            hexpand = true
        };
        var guide_link = new Gtk.LinkButton.with_label ("See Ukara transliteration ruleset","Guide"){
            margin = 12
        };
        var latin_input = new Gtk.Entry (){
            hexpand = true,
            vexpand = true,
            // wrap_mode = Gtk.WrapMode.WORD_CHAR
        };
        
        
        var javanese_out = new Gtk.TextView (){
            // margin = 12,
            vexpand = true,
            wrap_mode = Gtk.WrapMode.WORD_CHAR,
            editable = false
        };
        button_trans.set_size_request (-1, 30);
        javanese_out.buffer.set_text("ꦲꦸꦏꦫ");
        latin_input.set_text("Type in Latin to Transliterate");
        
        var scrolljv = new Gtk.ScrolledWindow (null,null);
        scrolljv.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
        scrolljv.add (javanese_out);
        
        var scroll = new Gtk.ScrolledWindow (null,null);
        scroll.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
        scroll.add (latin_input);
        
        // button_trans.clicked.connect(this.transliterate_text);
        
        button_trans.clicked.connect (() => {
            string input_text = latin_input.get_text ();
            string[] input_words = input_text.split (" ");
            string output_text = "";
            foreach (string input_word in input_words) {
                string[] syllables = split_into_syllables (input_word);
                foreach (string syllable in syllables) {
                    string javanese_syllable = transliterate_syllable (syllable);
                    output_text += javanese_syllable;
                }
            }
            javanese_out.buffer.set_text (output_text);
        });
        
        // button_trans.clicked.connect (() => {
   //          var buffer = latin_input.get_buffer ();
			// Gtk.TextIter start, end;
			// buffer.get_start_iter (out start);
			// buffer.get_end_iter (out end);
			// 
			// 
			// string[] lat = {"A","B","C"};
			// string[] jv = {"G","H","I"};

   //          foreach (string i in lat){
   //              int y = int.parse(i);
   //              var java = jv [y];
			//     var latin = lat [y];
			//     
			//     var str = latin_input.buffer.get_text(start, end, false);
   //              javanese_out.buffer.set_text(str.replace(latin,java));
   //          }
        // }
        // );
        
        set_titlebar (headerbar);
        
        javanese_out.get_style_context ().add_class ("aksara");
        latin_input.get_style_context ().add_class ("latin");
        button_trans.get_style_context ().add_class ("button_trans");
        guide_link.get_style_context ().add_class ("guide_link");
        css_provider = new Gtk.CssProvider ();
        
        try {
            css_provider.load_from_data(""
                + ".main {margin:0px}"
                + ".guide_link {color:#cd9055}"
                + ".aksara {font-size:36px;background:#f2d9b6;padding:12px;border-radius:0 0 10px 10px;color:#2b2419;}"
                + ".latin {background:transparent; padding:12px;border:0px transparent;box-shadow:none;}"
                + ".button_trans {padding:0 24px 0 24px;background:#f2d9b6;border-radius:8px;}"
            );
        }
        
        catch (GLib.Error e) {
            error (e.message);
        }
        
        Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
        
        
        main = new Gtk.Box (Gtk.Orientation.VERTICAL, 10);
        main.get_style_context ().add_class ("main");
        
        var bottom = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 10){
            hexpand = true
        };
        
        bottom.add(guide_link);
        bottom.add(button_trans);
        main.add(scrolljv);
        main.add(scroll);
        main.add(bottom);
        
        add(main);
        
        show_all ();
    }
    
    // function to split a word into syllables
    private string[] split_into_syllables (string word)
    {
        // simplistic algorithm that just splits into individual letters
        string[] letters = word.split ("");
        return letters;
    }
    
    private string transliterate_syllable(string syllable) {
    // Transliterate each syllable based on the rules
    if (syllable == "ha") return "ꦲ";
    if (syllable == "ho") return "ꦲꦺ";
    if (syllable == "he") return "ꦮ";
    if (syllable == "hi") return "ꦲꦶ";
    if (syllable == "hu") return "ꦲꦸ";
    if (syllable == "ka") return "ꦏ";
    if (syllable == "ko") return "ꦏꦺ";
    if (syllable == "ke") return "ꦏꦺꦴ";
    return syllable;
    }  
    
    // private List<string> split_vowel(string text) {
    //     // TODO: implement function to split text into syllables based on vowel positions

    //     // default return value is the input text as a single syllable
    //     return new List<string>();
    // }
    
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
