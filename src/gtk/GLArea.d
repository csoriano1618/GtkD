/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module gtk.GLArea;

private import gdk.GLContext;
private import glib.ConstructionException;
private import glib.ErrorG;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Widget;
public  import gtkc.gdktypes;
private import gtkc.gtk;
public  import gtkc.gtktypes;


/**
 * #GtkGLArea is a widget that allows drawing with OpenGL.
 * 
 * #GtkGLArea sets up its own #GdkGLContext for the window it creates, and
 * creates a custom GL framebuffer that the widget will do GL rendering onto.
 * It also ensures that this framebuffer is the default GL rendering target
 * when rendering.
 * 
 * In order to draw, you have to connect to the #GtkGLArea::render signal,
 * or subclass #GtkGLArea and override the @GtkGLAreaClass.render() virtual
 * function.
 * 
 * The #GtkGLArea widget ensures that the #GdkGLContext is associated with
 * the widget's drawing area, and it is kept updated when the size and
 * position of the drawing area changes.
 * 
 * ## Drawing with GtkGLArea ##
 * 
 * The simplest way to draw using OpenGL commands in a #GtkGLArea is to
 * create a widget instance and connect to the #GtkGLArea::render signal:
 * 
 * |[<!-- language="C" -->
 * // create a GtkGLArea instance
 * GtkWidget *gl_area = gtk_gl_area_new ();
 * 
 * // connect to the "render" signal
 * g_signal_connect (gl_area, "render", G_CALLBACK (render), NULL);
 * ]|
 * 
 * The `render()` function will be called when the #GtkGLArea is ready
 * for you to draw its content:
 * 
 * |[<!-- language="C" -->
 * static gboolean
 * render (GtkGLArea *area, GdkGLContext *context)
 * {
 * // inside this function it's safe to use GL; the given
 * // #GdkGLContext has been made current to the drawable
 * // surface used by the #GtkGLArea and the viewport has
 * // already been set to be the size of the allocation
 * 
 * // we can start by clearing the buffer
 * glClearColor (0, 0, 0, 0);
 * glClear (GL_COLOR_BUFFER_BIT);
 * 
 * // draw your object
 * draw_an_object ();
 * 
 * // we completed our drawing; the draw commands will be
 * // flushed at the end of the signal emission chain, and
 * // the buffers will be drawn on the window
 * return TRUE;
 * }
 * ]|
 * 
 * If you need to initialize OpenGL state, e.g. buffer objects or
 * shaders, you should use the #GtkWidget::realize signal; you
 * can use the #GtkWidget::unrealize signal to clean up. Since the
 * #GdkGLContext creation and initialization may fail, you will
 * need to check for errors, using gtk_gl_area_get_error(). An example
 * of how to safely initialize the GL state is:
 * 
 * |[<!-- language="C" -->
 * static void
 * on_realize (GtkGLarea *area)
 * {
 * // We need to make the context current if we want to
 * // call GL API
 * gtk_gl_area_make_current (area);
 * 
 * // If there were errors during the initialization or
 * // when trying to make the context current, this
 * // function will return a #GError for you to catch
 * if (gtk_gl_area_get_error (area) != NULL)
 * return;
 * 
 * // You can also use gtk_gl_area_set_error() in order
 * // to show eventual initialization errors on the
 * // GtkGLArea widget itself
 * GError *internal_error = NULL;
 * init_buffer_objects (&error);
 * if (error != NULL)
 * {
 * gtk_gl_area_set_error (area, error);
 * g_error_free (error);
 * return;
 * }
 * 
 * init_shaders (&error);
 * if (error != NULL)
 * {
 * gtk_gl_area_set_error (area, error);
 * g_error_free (error);
 * return;
 * }
 * }
 * ]|
 * 
 * If you need to change the options for creating the #GdkGLContext
 * you should use the #GtkGLArea::create-context signal.
 *
 * Since: 3.16
 */
public class GLArea : Widget
{
	/** the main Gtk struct */
	protected GtkGLArea* gtkGLArea;

	/** Get the main Gtk struct */
	public GtkGLArea* getGLAreaStruct()
	{
		return gtkGLArea;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkGLArea;
	}

	protected override void setStruct(GObject* obj)
	{
		gtkGLArea = cast(GtkGLArea*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkGLArea* gtkGLArea, bool ownedRef = false)
	{
		this.gtkGLArea = gtkGLArea;
		super(cast(GtkWidget*)gtkGLArea, ownedRef);
	}

	/**
	 */

	public static GType getType()
	{
		return gtk_gl_area_get_type();
	}

	/**
	 * Creates a new #GtkGLArea widget.
	 *
	 * Return: the newly created #GtkGLArea
	 *
	 * Since: 3.16
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = gtk_gl_area_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GtkGLArea*) p, true);
	}

	/**
	 * Ensures that the @area framebuffer object is made the current draw
	 * and read target, and that all the required buffers for the @area
	 * are created and bound to the frambuffer.
	 *
	 * This function is automatically called before emitting the
	 * #GtkGLArea::render signal, and doesn't normally need to be called
	 * by application code.
	 *
	 * Since: 3.16
	 */
	public void attachBuffers()
	{
		gtk_gl_area_attach_buffers(gtkGLArea);
	}

	/**
	 * Returns whether the area is in auto render mode or not.
	 *
	 * Return: %TRUE if the @area is auto rendering, %FALSE otherwise
	 *
	 * Since: 3.16
	 */
	public bool getAutoRender()
	{
		return gtk_gl_area_get_auto_render(gtkGLArea) != 0;
	}

	/**
	 * Retrieves the #GdkGLContext used by @area.
	 *
	 * Return: the #GdkGLContext
	 *
	 * Since: 3.16
	 */
	public GLContext getContext()
	{
		auto p = gtk_gl_area_get_context(gtkGLArea);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(GLContext)(cast(GdkGLContext*) p);
	}

	/**
	 * Gets the current error set on the @area.
	 *
	 * Return: the #GError or %NULL
	 *
	 * Since: 3.16
	 */
	public ErrorG getError()
	{
		auto p = gtk_gl_area_get_error(gtkGLArea);
		
		if(p is null)
		{
			return null;
		}
		
		return new ErrorG(cast(GError*) p);
	}

	/**
	 * Returns whether the area has an alpha component.
	 *
	 * Return: %TRUE if the @area has an alpha component, %FALSE otherwise
	 *
	 * Since: 3.16
	 */
	public bool getHasAlpha()
	{
		return gtk_gl_area_get_has_alpha(gtkGLArea) != 0;
	}

	/**
	 * Returns whether the area has a depth buffer.
	 *
	 * Return: %TRUE if the @area has a depth buffer, %FALSE otherwise
	 *
	 * Since: 3.16
	 */
	public bool getHasDepthBuffer()
	{
		return gtk_gl_area_get_has_depth_buffer(gtkGLArea) != 0;
	}

	/**
	 * Returns whether the area has a stencil buffer.
	 *
	 * Return: %TRUE if the @area has a stencil buffer, %FALSE otherwise
	 *
	 * Since: 3.16
	 */
	public bool getHasStencilBuffer()
	{
		return gtk_gl_area_get_has_stencil_buffer(gtkGLArea) != 0;
	}

	/**
	 * Retrieves the required version of OpenGL set
	 * using gtk_gl_area_set_required_version().
	 *
	 * Params:
	 *     major = return location for the required major version
	 *     minor = return location for the required minor version
	 *
	 * Since: 3.16
	 */
	public void getRequiredVersion(out int major, out int minor)
	{
		gtk_gl_area_get_required_version(gtkGLArea, &major, &minor);
	}

	/**
	 * Ensures that the #GdkGLContext used by @area is associated with
	 * the #GtkGLArea.
	 *
	 * This function is automatically called before emitting the
	 * #GtkGLArea::render signal, and doesn't normally need to be called
	 * by application code.
	 *
	 * Since: 3.16
	 */
	public void makeCurrent()
	{
		gtk_gl_area_make_current(gtkGLArea);
	}

	/**
	 * Marks the currently rendered data (if any) as invalid, and queues
	 * a redraw of the widget, ensuring that the #GtkGLArea::render signal
	 * is emitted during the draw.
	 *
	 * This is only needed when the gtk_gl_area_set_auto_render() has
	 * been called with a %FALSE value. The default behaviour is to
	 * emit #GtkGLArea::render on each draw.
	 *
	 * Since: 3.16
	 */
	public void queueRender()
	{
		gtk_gl_area_queue_render(gtkGLArea);
	}

	/**
	 * If @auto_render is %TRUE the #GtkGLArea::render signal will be
	 * emitted every time the widget draws. This is the default and is
	 * useful if drawing the widget is faster.
	 *
	 * If @auto_render is %FALSE the data from previous rendering is kept
	 * around and will be used for drawing the widget the next time,
	 * unless the window is resized. In order to force a rendering
	 * gtk_gl_area_queue_render() must be called. This mode is useful when
	 * the scene changes seldomly, but takes a long time to redraw.
	 *
	 * Params:
	 *     autoRender = a boolean
	 *
	 * Since: 3.16
	 */
	public void setAutoRender(bool autoRender)
	{
		gtk_gl_area_set_auto_render(gtkGLArea, autoRender);
	}

	/**
	 * Sets an error on the area which will be shown instead of the
	 * GL rendering. This is useful in the #GtkGLArea::create-context
	 * signal if GL context creation fails.
	 *
	 * Params:
	 *     error = a new #GError, or %NULL to unset the error
	 *
	 * Since: 3.16
	 */
	public void setError(ErrorG error)
	{
		gtk_gl_area_set_error(gtkGLArea, (error is null) ? null : error.getErrorGStruct());
	}

	/**
	 * If @has_alpha is %TRUE the buffer allocated by the widget will have
	 * an alpha channel component, and when rendering to the window the
	 * result will be composited over whatever is below the widget.
	 *
	 * If @has_alpha is %FALSE there will be no alpha channel, and the
	 * buffer will fully replace anything below the widget.
	 *
	 * Params:
	 *     hasAlpha = %TRUE to add an alpha component
	 *
	 * Since: 3.16
	 */
	public void setHasAlpha(bool hasAlpha)
	{
		gtk_gl_area_set_has_alpha(gtkGLArea, hasAlpha);
	}

	/**
	 * If @has_depth_buffer is %TRUE the widget will allocate and
	 * enable a depth buffer for the target framebuffer. Otherwise
	 * there will be none.
	 *
	 * Params:
	 *     hasDepthBuffer = %TRUE to add a depth buffer
	 *
	 * Since: 3.16
	 */
	public void setHasDepthBuffer(bool hasDepthBuffer)
	{
		gtk_gl_area_set_has_depth_buffer(gtkGLArea, hasDepthBuffer);
	}

	/**
	 * If @has_stencil_buffer is %TRUE the widget will allocate and
	 * enable a stencil buffer for the target framebuffer. Otherwise
	 * there will be none.
	 *
	 * Params:
	 *     hasStencilBuffer = %TRUE to add a stencil buffer
	 *
	 * Since: 3.16
	 */
	public void setHasStencilBuffer(bool hasStencilBuffer)
	{
		gtk_gl_area_set_has_stencil_buffer(gtkGLArea, hasStencilBuffer);
	}

	/**
	 * Sets the required version of OpenGL to be used when creating the context
	 * for the widget.
	 *
	 * This function must be called before the area has been realized.
	 *
	 * Params:
	 *     major = the major version
	 *     minor = the minor version
	 *
	 * Since: 3.16
	 */
	public void setRequiredVersion(int major, int minor)
	{
		gtk_gl_area_set_required_version(gtkGLArea, major, minor);
	}

	int[string] connectedSignals;

	GLContext delegate(GLArea)[] onCreateContextListeners;
	/**
	 * The ::create-context signal is emitted when the widget is being
	 * realized, and allows you to override how the GL context is
	 * created. This is useful when you want to reuse an existing GL
	 * context, or if you want to try creating different kinds of GL
	 * options.
	 *
	 * If context creation fails then the signal handler can use
	 * gtk_gl_area_set_error() to register a more detailed error
	 * of how the construction failed.
	 *
	 * Return: a newly created #GdkGLContext;
	 *     the #GtkGLArea widget will take ownership of the returned value.
	 *
	 * Since: 3.16
	 */
	void addOnCreateContext(GLContext delegate(GLArea) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "create-context" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"create-context",
				cast(GCallback)&callBackCreateContext,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["create-context"] = 1;
		}
		onCreateContextListeners ~= dlg;
	}
	extern(C) static GdkGLContext* callBackCreateContext(GtkGLArea* glareaStruct, GLArea _glarea)
	{
		foreach ( GLContext delegate(GLArea) dlg; _glarea.onCreateContextListeners )
		{
			if ( auto r = dlg(_glarea) )
				return r.getGLContextStruct();
		}
		
		return null;
	}

	bool delegate(GLContext, GLArea)[] onRenderListeners;
	/**
	 * The ::render signal is emitted every time the contents
	 * of the #GtkGLArea should be redrawn.
	 *
	 * The @context is bound to the @area prior to emitting this function,
	 * and the buffers are painted to the window once the emission terminates.
	 *
	 * Params:
	 *     context = the #GdkGLContext used by @area
	 *
	 * Return: %TRUE to stop other handlers from being invoked for the event.
	 *     %FALSE to propagate the event further.
	 *
	 * Since: 3.16
	 */
	void addOnRender(bool delegate(GLContext, GLArea) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "render" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"render",
				cast(GCallback)&callBackRender,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["render"] = 1;
		}
		onRenderListeners ~= dlg;
	}
	extern(C) static int callBackRender(GtkGLArea* glareaStruct, GdkGLContext* context, GLArea _glarea)
	{
		foreach ( bool delegate(GLContext, GLArea) dlg; _glarea.onRenderListeners )
		{
			if ( dlg(ObjectG.getDObject!(GLContext)(context), _glarea) )
			{
				return 1;
			}
		}
		
		return 0;
	}

	void delegate(int, int, GLArea)[] onResizeListeners;
	/**
	 * The ::resize signal is emitted once when the widget is realized, and
	 * then each time the widget is changed while realized. This is useful
	 * in order to keep GL state up to date with the widget size, like for
	 * instance camera properties which may depend on the width/height ratio.
	 *
	 * The GL context for the area is guaranteed to be current when this signal
	 * is emitted.
	 *
	 * The default handler sets up the GL viewport.
	 *
	 * Since: 3.16
	 */
	void addOnResize(void delegate(int, int, GLArea) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "resize" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"resize",
				cast(GCallback)&callBackResize,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["resize"] = 1;
		}
		onResizeListeners ~= dlg;
	}
	extern(C) static void callBackResize(GtkGLArea* glareaStruct, int object, int p0, GLArea _glarea)
	{
		foreach ( void delegate(int, int, GLArea) dlg; _glarea.onResizeListeners )
		{
			dlg(object, p0, _glarea);
		}
	}
}
