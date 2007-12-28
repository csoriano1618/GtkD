/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
 
// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage

/*
 * Conversion parameters:
 * inFile  = GtkWindowGroup.html
 * outPack = gtk
 * outFile = WindowGroup
 * strct   = GtkWindowGroup
 * realStrct=
 * ctorStrct=
 * clss    = WindowGroup
 * interf  = 
 * class Code: No
 * interface Code: No
 * template for:
 * extend  = 
 * implements:
 * prefixes:
 * 	- gtk_window_group_
 * 	- gtk_
 * omit structs:
 * omit prefixes:
 * omit code:
 * imports:
 * 	- gtk.Window
 * structWrap:
 * 	- GtkWindow* -> Window
 * module aliases:
 * local aliases:
 */

module gtk.WindowGroup;

version(noAssert)
{
	version(Tango)
	{
		import tango.io.Stdout;	// use the tango loging?
	}
}

private import gtkc.gtktypes;

private import gtkc.gtk;


private import gtk.Window;




/**
 * Description
 */
private import gobject.ObjectG;
public class WindowGroup : ObjectG
{
	
	/** the main Gtk struct */
	protected GtkWindowGroup* gtkWindowGroup;
	
	
	public GtkWindowGroup* getWindowGroupStruct()
	{
		return gtkWindowGroup;
	}
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gtkWindowGroup;
	}
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GtkWindowGroup* gtkWindowGroup)
	{
		version(noAssert)
		{
			if ( gtkWindowGroup is null )
			{
				int zero = 0;
				version(Tango)
				{
					Stdout("struct gtkWindowGroup is null on constructor").newline;
				}
				else
				{
					printf("struct gtkWindowGroup is null on constructor");
				}
				zero = zero / zero;
			}
		}
		else
		{
			assert(gtkWindowGroup !is null, "struct gtkWindowGroup is null on constructor");
		}
		super(cast(GObject*)gtkWindowGroup);
		this.gtkWindowGroup = gtkWindowGroup;
	}
	
	/**
	 */
	
	
	/**
	 * Creates a new GtkWindowGroup object. Grabs added with
	 * gtk_grab_add() only affect windows within the same GtkWindowGroup.
	 * Returns:
	 *  a new GtkWindowGroup.
	 */
	public this ()
	{
		// GtkWindowGroup* gtk_window_group_new (void);
		this(cast(GtkWindowGroup*)gtk_window_group_new() );
	}
	
	/**
	 * Adds a window to a GtkWindowGroup.
	 * window_group:
	 *  a GtkWindowGroup
	 * window:
	 *  the GtkWindow to add
	 */
	public void addWindow(Window window)
	{
		// void gtk_window_group_add_window (GtkWindowGroup *window_group,  GtkWindow *window);
		gtk_window_group_add_window(gtkWindowGroup, (window is null) ? null : window.getWindowStruct());
	}
	
	/**
	 * Removes a window from a GtkWindowGroup.
	 * window_group:
	 *  a GtkWindowGroup
	 * window:
	 *  the GtkWindow to remove
	 */
	public void removeWindow(Window window)
	{
		// void gtk_window_group_remove_window (GtkWindowGroup *window_group,  GtkWindow *window);
		gtk_window_group_remove_window(gtkWindowGroup, (window is null) ? null : window.getWindowStruct());
	}
}