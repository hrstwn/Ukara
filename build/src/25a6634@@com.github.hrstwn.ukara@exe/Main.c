/* Main.c generated by valac 0.48.24, the Vala compiler
 * generated from Main.vala, do not modify */

#include <stdlib.h>
#include <string.h>
#include <glib.h>
#include <gtk/gtk.h>
#include <glib-object.h>
#include <gio/gio.h>

#define TYPE_UKARA (ukara_get_type ())
#define UKARA(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), TYPE_UKARA, Ukara))
#define UKARA_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), TYPE_UKARA, UkaraClass))
#define IS_UKARA(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), TYPE_UKARA))
#define IS_UKARA_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), TYPE_UKARA))
#define UKARA_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), TYPE_UKARA, UkaraClass))

typedef struct _Ukara Ukara;
typedef struct _UkaraClass UkaraClass;
#define _g_object_unref0(var) ((var == NULL) ? NULL : (var = (g_object_unref (var), NULL)))

static gint _vala_main (gchar** args,
                 gint args_length1);
Ukara* ukara_new (void);
Ukara* ukara_construct (GType object_type);
GType ukara_get_type (void) G_GNUC_CONST;
G_DEFINE_AUTOPTR_CLEANUP_FUNC (Ukara, g_object_unref)

static gint
_vala_main (gchar** args,
            gint args_length1)
{
	Ukara* _tmp0_;
	Ukara* _tmp1_;
	gint _tmp2_;
	gint result = 0;
#line 2 "../src/Main.vala"
	_tmp0_ = ukara_new ();
#line 2 "../src/Main.vala"
	_tmp1_ = _tmp0_;
#line 2 "../src/Main.vala"
	_tmp2_ = g_application_run ((GApplication*) _tmp1_, (gint) args_length1, args);
#line 2 "../src/Main.vala"
	_g_object_unref0 (_tmp1_);
#line 2 "../src/Main.vala"
	result = _tmp2_;
#line 2 "../src/Main.vala"
	return result;
#line 50 "Main.c"
}

int
main (int argc,
      char ** argv)
{
#line 1 "../src/Main.vala"
	return _vala_main (argv, argc);
#line 59 "Main.c"
}

