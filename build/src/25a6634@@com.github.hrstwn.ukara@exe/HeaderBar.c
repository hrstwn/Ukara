/* HeaderBar.c generated by valac 0.48.24, the Vala compiler
 * generated from HeaderBar.vala, do not modify */

#include <gtk/gtk.h>
#include <glib-object.h>
#include <gdk/gdk.h>
#include <glib.h>

#define TYPE_HEADER_BAR (header_bar_get_type ())
#define HEADER_BAR(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), TYPE_HEADER_BAR, HeaderBar))
#define HEADER_BAR_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), TYPE_HEADER_BAR, HeaderBarClass))
#define IS_HEADER_BAR(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), TYPE_HEADER_BAR))
#define IS_HEADER_BAR_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), TYPE_HEADER_BAR))
#define HEADER_BAR_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), TYPE_HEADER_BAR, HeaderBarClass))

typedef struct _HeaderBar HeaderBar;
typedef struct _HeaderBarClass HeaderBarClass;
typedef struct _HeaderBarPrivate HeaderBarPrivate;
enum  {
	HEADER_BAR_0_PROPERTY,
	HEADER_BAR_NUM_PROPERTIES
};
static GParamSpec* header_bar_properties[HEADER_BAR_NUM_PROPERTIES];
#define _g_object_unref0(var) ((var == NULL) ? NULL : (var = (g_object_unref (var), NULL)))

struct _HeaderBar {
	GtkHeaderBar parent_instance;
	HeaderBarPrivate * priv;
	GtkCssProvider* css_header;
};

struct _HeaderBarClass {
	GtkHeaderBarClass parent_class;
};

static gpointer header_bar_parent_class = NULL;

GType header_bar_get_type (void) G_GNUC_CONST;
G_DEFINE_AUTOPTR_CLEANUP_FUNC (HeaderBar, g_object_unref)
HeaderBar* header_bar_new (void);
HeaderBar* header_bar_construct (GType object_type);
static GObject * header_bar_constructor (GType type,
                                  guint n_construct_properties,
                                  GObjectConstructParam * construct_properties);
static void header_bar_finalize (GObject * obj);
static GType header_bar_get_type_once (void);

HeaderBar*
header_bar_construct (GType object_type)
{
	HeaderBar * self = NULL;
#line 1 "../src/HeaderBar.vala"
	self = (HeaderBar*) g_object_new (object_type, NULL);
#line 1 "../src/HeaderBar.vala"
	return self;
#line 57 "HeaderBar.c"
}

HeaderBar*
header_bar_new (void)
{
#line 1 "../src/HeaderBar.vala"
	return header_bar_construct (TYPE_HEADER_BAR);
#line 65 "HeaderBar.c"
}

static gpointer
_g_object_ref0 (gpointer self)
{
#line 10 "../src/HeaderBar.vala"
	return self ? g_object_ref (self) : NULL;
#line 73 "HeaderBar.c"
}

static GObject *
header_bar_constructor (GType type,
                        guint n_construct_properties,
                        GObjectConstructParam * construct_properties)
{
	GObject * obj;
	GObjectClass * parent_class;
	HeaderBar * self;
	GtkCssProvider* _tmp0_;
	GtkStyleContext* headerbar_style_context = NULL;
	GtkStyleContext* _tmp1_;
	GtkStyleContext* _tmp2_;
	GtkStyleContext* _tmp3_;
	GtkStyleContext* _tmp4_;
	GdkScreen* _tmp5_;
	GtkCssProvider* _tmp6_;
#line 4 "../src/HeaderBar.vala"
	parent_class = G_OBJECT_CLASS (header_bar_parent_class);
#line 4 "../src/HeaderBar.vala"
	obj = parent_class->constructor (type, n_construct_properties, construct_properties);
#line 4 "../src/HeaderBar.vala"
	self = G_TYPE_CHECK_INSTANCE_CAST (obj, TYPE_HEADER_BAR, HeaderBar);
#line 5 "../src/HeaderBar.vala"
	gtk_header_bar_set_title ((GtkHeaderBar*) self, "Ukara");
#line 7 "../src/HeaderBar.vala"
	gtk_header_bar_set_show_close_button ((GtkHeaderBar*) self, TRUE);
#line 8 "../src/HeaderBar.vala"
	_tmp0_ = gtk_css_provider_new ();
#line 8 "../src/HeaderBar.vala"
	_g_object_unref0 (self->css_header);
#line 8 "../src/HeaderBar.vala"
	self->css_header = _tmp0_;
#line 10 "../src/HeaderBar.vala"
	_tmp1_ = gtk_widget_get_style_context ((GtkWidget*) self);
#line 10 "../src/HeaderBar.vala"
	_tmp2_ = _g_object_ref0 (_tmp1_);
#line 10 "../src/HeaderBar.vala"
	headerbar_style_context = _tmp2_;
#line 11 "../src/HeaderBar.vala"
	_tmp3_ = headerbar_style_context;
#line 11 "../src/HeaderBar.vala"
	gtk_style_context_add_class (_tmp3_, "default-decoration");
#line 12 "../src/HeaderBar.vala"
	_tmp4_ = headerbar_style_context;
#line 12 "../src/HeaderBar.vala"
	gtk_style_context_add_class (_tmp4_, GTK_STYLE_CLASS_FLAT);
#line 14 "../src/HeaderBar.vala"
	_tmp5_ = gdk_screen_get_default ();
#line 14 "../src/HeaderBar.vala"
	_tmp6_ = self->css_header;
#line 14 "../src/HeaderBar.vala"
	gtk_style_context_add_provider_for_screen (_tmp5_, (GtkStyleProvider*) _tmp6_, (guint) GTK_STYLE_PROVIDER_PRIORITY_USER);
#line 4 "../src/HeaderBar.vala"
	_g_object_unref0 (headerbar_style_context);
#line 4 "../src/HeaderBar.vala"
	return obj;
#line 132 "HeaderBar.c"
}

static void
header_bar_class_init (HeaderBarClass * klass,
                       gpointer klass_data)
{
#line 1 "../src/HeaderBar.vala"
	header_bar_parent_class = g_type_class_peek_parent (klass);
#line 1 "../src/HeaderBar.vala"
	G_OBJECT_CLASS (klass)->constructor = header_bar_constructor;
#line 1 "../src/HeaderBar.vala"
	G_OBJECT_CLASS (klass)->finalize = header_bar_finalize;
#line 145 "HeaderBar.c"
}

static void
header_bar_instance_init (HeaderBar * self,
                          gpointer klass)
{
}

static void
header_bar_finalize (GObject * obj)
{
	HeaderBar * self;
#line 1 "../src/HeaderBar.vala"
	self = G_TYPE_CHECK_INSTANCE_CAST (obj, TYPE_HEADER_BAR, HeaderBar);
#line 2 "../src/HeaderBar.vala"
	_g_object_unref0 (self->css_header);
#line 1 "../src/HeaderBar.vala"
	G_OBJECT_CLASS (header_bar_parent_class)->finalize (obj);
#line 164 "HeaderBar.c"
}

static GType
header_bar_get_type_once (void)
{
	static const GTypeInfo g_define_type_info = { sizeof (HeaderBarClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) header_bar_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (HeaderBar), 0, (GInstanceInitFunc) header_bar_instance_init, NULL };
	GType header_bar_type_id;
	header_bar_type_id = g_type_register_static (gtk_header_bar_get_type (), "HeaderBar", &g_define_type_info, 0);
	return header_bar_type_id;
}

GType
header_bar_get_type (void)
{
	static volatile gsize header_bar_type_id__volatile = 0;
	if (g_once_init_enter (&header_bar_type_id__volatile)) {
		GType header_bar_type_id;
		header_bar_type_id = header_bar_get_type_once ();
		g_once_init_leave (&header_bar_type_id__volatile, header_bar_type_id);
	}
	return header_bar_type_id__volatile;
}

