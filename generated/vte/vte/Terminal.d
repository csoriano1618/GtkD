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


module vte.Terminal;

private import gdk.Cursor;
private import gdk.Event;
private import gdk.RGBA;
private import gio.Cancellable;
private import gio.OutputStream;
private import glib.ArrayG;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Regex;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ScrollableIF;
private import gtk.ScrollableT;
private import gtk.Widget;
private import gtk.Window;
private import pango.PgFontDescription;
private import std.algorithm;
private import vte.Pty;
private import vte.Regex : RegexVte = Regex;
private import vte.c.functions;
public  import vte.c.types;
public  import vtec.vtetypes;


/** */
public class Terminal : Widget, ScrollableIF
{
	/** the main Gtk struct */
	protected VteTerminal* vteTerminal;

	/** Get the main Gtk struct */
	public VteTerminal* getTerminalStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return vteTerminal;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)vteTerminal;
	}

	protected override void setStruct(GObject* obj)
	{
		vteTerminal = cast(VteTerminal*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (VteTerminal* vteTerminal, bool ownedRef = false)
	{
		this.vteTerminal = vteTerminal;
		super(cast(GtkWidget*)vteTerminal, ownedRef);
	}

	// add the Scrollable capabilities
	mixin ScrollableT!(VteTerminal);


	/** */
	public static GType getType()
	{
		return vte_terminal_get_type();
	}

	/**
	 * Creates a new terminal widget.
	 *
	 * Returns: a new #VteTerminal object
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = vte_terminal_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(VteTerminal*) p);
	}

	/**
	 * Places the selected text in the terminal in the #GDK_SELECTION_CLIPBOARD
	 * selection.
	 *
	 * Deprecated: Use vte_terminal_copy_clipboard_format() with %VTE_FORMAT_TEXT
	 * instead.
	 */
	public void copyClipboard()
	{
		vte_terminal_copy_clipboard(vteTerminal);
	}

	/**
	 * Places the selected text in the terminal in the #GDK_SELECTION_CLIPBOARD
	 * selection in the form specified by @format.
	 *
	 * For all formats, the selection data (see #GtkSelectionData) will include the
	 * text targets (see gtk_target_list_add_text_targets() and
	 * gtk_selection_data_targets_includes_text()). For %VTE_FORMAT_HTML,
	 * the selection will also include the "text/html" target, which when requested,
	 * returns the HTML data in UTF-16 with a U+FEFF BYTE ORDER MARK character at
	 * the start.
	 *
	 * Params:
	 *     format = a #VteFormat
	 *
	 * Since: 0.50
	 */
	public void copyClipboardFormat(VteFormat format)
	{
		vte_terminal_copy_clipboard_format(vteTerminal, format);
	}

	/**
	 * Places the selected text in the terminal in the #GDK_SELECTION_PRIMARY
	 * selection.
	 */
	public void copyPrimary()
	{
		vte_terminal_copy_primary(vteTerminal);
	}

	/**
	 * This function does nothing.
	 *
	 * Deprecated: Use vte_terminal_event_check_regex_simple() instead.
	 *
	 * Params:
	 *     event = a #GdkEvent
	 *     regexes = an array of #GRegex
	 *     matchFlags = the #GRegexMatchFlags to use when matching the regexes
	 *     matches = a location to store the matches
	 *
	 * Returns: %FALSE
	 *
	 * Since: 0.44
	 */
	public bool eventCheckGregexSimple(Event event, Regex[] regexes, GRegexMatchFlags matchFlags, string[] matches)
	{
		GRegex*[] regexesArray = new GRegex*[regexes.length];
		for ( int i = 0; i < regexes.length; i++ )
		{
			regexesArray[i] = regexes[i].getRegexStruct();
		}

		return vte_terminal_event_check_gregex_simple(vteTerminal, (event is null) ? null : event.getEventStruct(), regexesArray.ptr, cast(size_t)matches.length, matchFlags, Str.toStringzArray(matches)) != 0;
	}

	/**
	 * Checks each regex in @regexes if the text in and around the position of
	 * the event matches the regular expressions.  If a match exists, the matched
	 * text is stored in @matches at the position of the regex in @regexes; otherwise
	 * %NULL is stored there.
	 *
	 * Params:
	 *     event = a #GdkEvent
	 *     regexes = an array of #VteRegex
	 *     matchFlags = PCRE2 match flags, or 0
	 *     matches = a location to store the matches
	 *
	 * Returns: %TRUE iff any of the regexes produced a match
	 *
	 * Since: 0.46
	 */
	public bool eventCheckRegexSimple(Event event, RegexVte[] regexes, uint matchFlags, string[] matches)
	{
		VteRegex*[] regexesArray = new VteRegex*[regexes.length];
		for ( int i = 0; i < regexes.length; i++ )
		{
			regexesArray[i] = regexes[i].getRegexStruct();
		}

		return vte_terminal_event_check_regex_simple(vteTerminal, (event is null) ? null : event.getEventStruct(), regexesArray.ptr, cast(size_t)matches.length, matchFlags, Str.toStringzArray(matches)) != 0;
	}

	/**
	 * Interprets @data as if it were data received from a child process.  This
	 * can either be used to drive the terminal without a child process, or just
	 * to mess with your users.
	 *
	 * Params:
	 *     data = a string in the terminal's current encoding
	 */
	public void feed(string data)
	{
		vte_terminal_feed(vteTerminal, Str.toStringz(data), cast(ptrdiff_t)data.length);
	}

	/**
	 * Sends a block of UTF-8 text to the child as if it were entered by the user
	 * at the keyboard.
	 *
	 * Params:
	 *     text = data to send to the child
	 *     length = length of @text in bytes, or -1 if @text is NUL-terminated
	 */
	public void feedChild(string text, ptrdiff_t length)
	{
		vte_terminal_feed_child(vteTerminal, Str.toStringz(text), length);
	}

	/**
	 * Sends a block of binary data to the child.
	 *
	 * Params:
	 *     data = data to send to the child
	 */
	public void feedChildBinary(ubyte[] data)
	{
		vte_terminal_feed_child_binary(vteTerminal, data.ptr, cast(size_t)data.length);
	}

	/**
	 * Checks whether or not the terminal will attempt to draw bold text by
	 * repainting text with a one-pixel offset.
	 *
	 * Returns: %TRUE if bolding is enabled, %FALSE if not
	 */
	public bool getAllowBold()
	{
		return vte_terminal_get_allow_bold(vteTerminal) != 0;
	}

	/**
	 * Checks whether or not hyperlinks (OSC 8 escape sequence) are allowed.
	 *
	 * Returns: %TRUE if hyperlinks are enabled, %FALSE if not
	 *
	 * Since: 0.50
	 */
	public bool getAllowHyperlink()
	{
		return vte_terminal_get_allow_hyperlink(vteTerminal) != 0;
	}

	/**
	 * Checks whether or not the terminal will beep when the child outputs the
	 * "bl" sequence.
	 *
	 * Returns: %TRUE if audible bell is enabled, %FALSE if not
	 */
	public bool getAudibleBell()
	{
		return vte_terminal_get_audible_bell(vteTerminal) != 0;
	}

	/**
	 * Returns: the height of a character cell
	 */
	public glong getCharHeight()
	{
		return vte_terminal_get_char_height(vteTerminal);
	}

	/**
	 * Returns: the width of a character cell
	 */
	public glong getCharWidth()
	{
		return vte_terminal_get_char_width(vteTerminal);
	}

	/**
	 * Returns whether ambiguous-width characters are narrow or wide when using
	 * the UTF-8 encoding (vte_terminal_set_encoding()).
	 *
	 * Returns: 1 if ambiguous-width characters are narrow, or 2 if they are wide
	 */
	public int getCjkAmbiguousWidth()
	{
		return vte_terminal_get_cjk_ambiguous_width(vteTerminal);
	}

	/**
	 * Returns: the number of columns
	 */
	public glong getColumnCount()
	{
		return vte_terminal_get_column_count(vteTerminal);
	}

	/**
	 * Returns: the URI of the current directory of the
	 *     process running in the terminal, or %NULL
	 */
	public string getCurrentDirectoryUri()
	{
		return Str.toString(vte_terminal_get_current_directory_uri(vteTerminal));
	}

	/**
	 * Returns: the URI of the current file the
	 *     process running in the terminal is operating on, or %NULL if
	 *     not set
	 */
	public string getCurrentFileUri()
	{
		return Str.toString(vte_terminal_get_current_file_uri(vteTerminal));
	}

	/**
	 * Returns the currently set cursor blink mode.
	 *
	 * Returns: cursor blink mode.
	 */
	public VteCursorBlinkMode getCursorBlinkMode()
	{
		return vte_terminal_get_cursor_blink_mode(vteTerminal);
	}

	/**
	 * Reads the location of the insertion cursor and returns it.  The row
	 * coordinate is absolute.
	 *
	 * Params:
	 *     column = a location to store the column, or %NULL
	 *     row = a location to store the row, or %NULL
	 */
	public void getCursorPosition(out glong column, out glong row)
	{
		vte_terminal_get_cursor_position(vteTerminal, &column, &row);
	}

	/**
	 * Returns the currently set cursor shape.
	 *
	 * Returns: cursor shape.
	 */
	public VteCursorShape getCursorShape()
	{
		return vte_terminal_get_cursor_shape(vteTerminal);
	}

	/**
	 * Determines the name of the encoding in which the terminal expects data to be
	 * encoded.
	 *
	 * Returns: the current encoding for the terminal
	 */
	public string getEncoding()
	{
		return Str.toString(vte_terminal_get_encoding(vteTerminal));
	}

	/**
	 * Queries the terminal for information about the fonts which will be
	 * used to draw text in the terminal.  The actual font takes the font scale
	 * into account, this is not reflected in the return value, the unscaled
	 * font is returned.
	 *
	 * Returns: a #PangoFontDescription describing the font the
	 *     terminal uses to render text at the default font scale of 1.0.
	 */
	public PgFontDescription getFont()
	{
		auto p = vte_terminal_get_font(vteTerminal);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgFontDescription)(cast(PangoFontDescription*) p);
	}

	/**
	 * Returns: the terminal's font scale
	 */
	public double getFontScale()
	{
		return vte_terminal_get_font_scale(vteTerminal);
	}

	/**
	 * Fills in some @hints from @terminal's geometry. The hints
	 * filled are those covered by the %GDK_HINT_RESIZE_INC,
	 * %GDK_HINT_MIN_SIZE and %GDK_HINT_BASE_SIZE flags.
	 *
	 * See gtk_window_set_geometry_hints() for more information.
	 *
	 * @terminal must be realized (see gtk_widget_get_realized()).
	 *
	 * Params:
	 *     hints = a #GdkGeometry to fill in
	 *     minRows = the minimum number of rows to request
	 *     minColumns = the minimum number of columns to request
	 */
	public void getGeometryHints(out GdkGeometry hints, int minRows, int minColumns)
	{
		vte_terminal_get_geometry_hints(vteTerminal, &hints, minRows, minColumns);
	}

	/**
	 * Checks if the terminal currently contains selected text.  Note that this
	 * is different from determining if the terminal is the owner of any
	 * #GtkClipboard items.
	 *
	 * Returns: %TRUE if part of the text in the terminal is selected.
	 */
	public bool getHasSelection()
	{
		return vte_terminal_get_has_selection(vteTerminal) != 0;
	}

	/**
	 * Returns: the icon title
	 */
	public string getIconTitle()
	{
		return Str.toString(vte_terminal_get_icon_title(vteTerminal));
	}

	/**
	 * Returns whether the terminal allow user input.
	 */
	public bool getInputEnabled()
	{
		return vte_terminal_get_input_enabled(vteTerminal) != 0;
	}

	/**
	 * Determines the value of the terminal's mouse autohide setting.  When
	 * autohiding is enabled, the mouse cursor will be hidden when the user presses
	 * a key and shown when the user moves the mouse.  This setting can be changed
	 * using vte_terminal_set_mouse_autohide().
	 *
	 * Returns: %TRUE if autohiding is enabled, %FALSE if not
	 */
	public bool getMouseAutohide()
	{
		return vte_terminal_get_mouse_autohide(vteTerminal) != 0;
	}

	/**
	 * Returns the #VtePty of @terminal.
	 *
	 * Returns: a #VtePty, or %NULL
	 */
	public Pty getPty()
	{
		auto p = vte_terminal_get_pty(vteTerminal);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Pty)(cast(VtePty*) p);
	}

	/**
	 * Checks whether or not the terminal will rewrap its contents upon resize.
	 *
	 * Returns: %TRUE if rewrapping is enabled, %FALSE if not
	 */
	public bool getRewrapOnResize()
	{
		return vte_terminal_get_rewrap_on_resize(vteTerminal) != 0;
	}

	/**
	 * Returns: the number of rows
	 */
	public glong getRowCount()
	{
		return vte_terminal_get_row_count(vteTerminal);
	}

	/**
	 * Extracts a view of the visible part of the terminal.  If @is_selected is not
	 * %NULL, characters will only be read if @is_selected returns %TRUE after being
	 * passed the column and row, respectively.  A #VteCharAttributes structure
	 * is added to @attributes for each byte added to the returned string detailing
	 * the character's position, colors, and other characteristics.
	 *
	 * Params:
	 *     isSelected = a #VteSelectionFunc callback
	 *     userData = user data to be passed to the callback
	 *     attributes = location for storing text attributes
	 *
	 * Returns: a newly allocated text string, or %NULL.
	 */
	public string getText(VteSelectionFunc isSelected, void* userData, out ArrayG attributes)
	{
		GArray* outattributes = gMalloc!GArray();

		auto retStr = vte_terminal_get_text(vteTerminal, isSelected, userData, outattributes);

		attributes = new ArrayG(outattributes, true);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Extracts a view of the visible part of the terminal.  If @is_selected is not
	 * %NULL, characters will only be read if @is_selected returns %TRUE after being
	 * passed the column and row, respectively.  A #VteCharAttributes structure
	 * is added to @attributes for each byte added to the returned string detailing
	 * the character's position, colors, and other characteristics. This function
	 * differs from vte_terminal_get_text() in that trailing spaces at the end of
	 * lines are included.
	 *
	 * Params:
	 *     isSelected = a #VteSelectionFunc callback
	 *     userData = user data to be passed to the callback
	 *     attributes = location for storing text attributes
	 *
	 * Returns: a newly allocated text string, or %NULL.
	 */
	public string getTextIncludeTrailingSpaces(VteSelectionFunc isSelected, void* userData, out ArrayG attributes)
	{
		GArray* outattributes = gMalloc!GArray();

		auto retStr = vte_terminal_get_text_include_trailing_spaces(vteTerminal, isSelected, userData, outattributes);

		attributes = new ArrayG(outattributes, true);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Extracts a view of the visible part of the terminal.  If @is_selected is not
	 * %NULL, characters will only be read if @is_selected returns %TRUE after being
	 * passed the column and row, respectively.  A #VteCharAttributes structure
	 * is added to @attributes for each byte added to the returned string detailing
	 * the character's position, colors, and other characteristics.  The
	 * entire scrollback buffer is scanned, so it is possible to read the entire
	 * contents of the buffer using this function.
	 *
	 * Params:
	 *     startRow = first row to search for data
	 *     startCol = first column to search for data
	 *     endRow = last row to search for data
	 *     endCol = last column to search for data
	 *     isSelected = a #VteSelectionFunc callback
	 *     userData = user data to be passed to the callback
	 *     attributes = location for storing text attributes
	 *
	 * Returns: a newly allocated text string, or %NULL.
	 */
	public string getTextRange(glong startRow, glong startCol, glong endRow, glong endCol, VteSelectionFunc isSelected, void* userData, out ArrayG attributes)
	{
		GArray* outattributes = gMalloc!GArray();

		auto retStr = vte_terminal_get_text_range(vteTerminal, startRow, startCol, endRow, endCol, isSelected, userData, outattributes);

		attributes = new ArrayG(outattributes, true);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Returns: the window title
	 */
	public string getWindowTitle()
	{
		return Str.toString(vte_terminal_get_window_title(vteTerminal));
	}

	/**
	 * Returns the set of characters which will be considered parts of a word
	 * when doing word-wise selection, in addition to the default which only
	 * considers alphanumeric characters part of a word.
	 *
	 * If %NULL, a built-in set is used.
	 *
	 * Returns: a string, or %NULL
	 *
	 * Since: 0.40
	 */
	public string getWordCharExceptions()
	{
		return Str.toString(vte_terminal_get_word_char_exceptions(vteTerminal));
	}

	/**
	 * Returns a nonempty string: the target of the explicit hyperlink (printed using the OSC 8
	 * escape sequence) at the position of the event, or %NULL.
	 *
	 * Proper use of the escape sequence should result in URI-encoded URIs with a proper scheme
	 * like "http://", "https://", "file://", "mailto:" etc. This is, however, not enforced by VTE.
	 * The caller must tolerate the returned string potentially not being a valid URI.
	 *
	 * Params:
	 *     event = a #GdkEvent
	 *
	 * Returns: a newly allocated string containing the target of the hyperlink
	 *
	 * Since: 0.50
	 */
	public string hyperlinkCheckEvent(Event event)
	{
		auto retStr = vte_terminal_hyperlink_check_event(vteTerminal, (event is null) ? null : event.getEventStruct());

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Adds the regular expression @regex to the list of matching expressions.  When the
	 * user moves the mouse cursor over a section of displayed text which matches
	 * this expression, the text will be highlighted.
	 *
	 * Deprecated: Use vte_terminal_match_add_regex() or vte_terminal_match_add_regex_full() instead.
	 *
	 * Params:
	 *     gregex = a #GRegex
	 *     gflags = the #GRegexMatchFlags to use when matching the regex
	 *
	 * Returns: an integer associated with this expression, or -1 if @gregex could not be
	 *     transformed into a #VteRegex or @gflags were incompatible
	 */
	public int matchAddGregex(Regex gregex, GRegexMatchFlags gflags)
	{
		return vte_terminal_match_add_gregex(vteTerminal, (gregex is null) ? null : gregex.getRegexStruct(), gflags);
	}

	/**
	 * Adds the regular expression @regex to the list of matching expressions.  When the
	 * user moves the mouse cursor over a section of displayed text which matches
	 * this expression, the text will be highlighted.
	 *
	 * Params:
	 *     regex = a #VteRegex
	 *     flags = PCRE2 match flags, or 0
	 *
	 * Returns: an integer associated with this expression
	 *
	 * Since: 0.46
	 */
	public int matchAddRegex(RegexVte regex, uint flags)
	{
		return vte_terminal_match_add_regex(vteTerminal, (regex is null) ? null : regex.getRegexStruct(), flags);
	}

	/**
	 * Checks if the text in and around the specified position matches any of the
	 * regular expressions previously set using vte_terminal_match_add().  If a
	 * match exists, the text string is returned and if @tag is not %NULL, the number
	 * associated with the matched regular expression will be stored in @tag.
	 *
	 * If more than one regular expression has been set with
	 * vte_terminal_match_add(), then expressions are checked in the order in
	 * which they were added.
	 *
	 * Deprecated: Use vte_terminal_match_check_event() instead.
	 *
	 * Params:
	 *     column = the text column
	 *     row = the text row
	 *     tag = a location to store the tag, or %NULL
	 *
	 * Returns: a newly allocated string which matches one of the previously
	 *     set regular expressions
	 */
	public string matchCheck(glong column, glong row, out int tag)
	{
		auto retStr = vte_terminal_match_check(vteTerminal, column, row, &tag);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Checks if the text in and around the position of the event matches any of the
	 * regular expressions previously set using vte_terminal_match_add().  If a
	 * match exists, the text string is returned and if @tag is not %NULL, the number
	 * associated with the matched regular expression will be stored in @tag.
	 *
	 * If more than one regular expression has been set with
	 * vte_terminal_match_add(), then expressions are checked in the order in
	 * which they were added.
	 *
	 * Params:
	 *     event = a #GdkEvent
	 *     tag = a location to store the tag, or %NULL
	 *
	 * Returns: a newly allocated string which matches one of the previously
	 *     set regular expressions
	 */
	public string matchCheckEvent(Event event, out int tag)
	{
		auto retStr = vte_terminal_match_check_event(vteTerminal, (event is null) ? null : event.getEventStruct(), &tag);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Removes the regular expression which is associated with the given @tag from
	 * the list of expressions which the terminal will highlight when the user
	 * moves the mouse cursor over matching text.
	 *
	 * Params:
	 *     tag = the tag of the regex to remove
	 */
	public void matchRemove(int tag)
	{
		vte_terminal_match_remove(vteTerminal, tag);
	}

	/**
	 * Clears the list of regular expressions the terminal uses to highlight text
	 * when the user moves the mouse cursor.
	 */
	public void matchRemoveAll()
	{
		vte_terminal_match_remove_all(vteTerminal);
	}

	/**
	 * Sets which cursor the terminal will use if the pointer is over the pattern
	 * specified by @tag.  The terminal keeps a reference to @cursor.
	 *
	 * Deprecated: Use vte_terminal_match_set_cursor_type() or vte_terminal_match_set_cursor_named() instead.
	 *
	 * Params:
	 *     tag = the tag of the regex which should use the specified cursor
	 *     cursor = the #GdkCursor which the terminal should use when the pattern is
	 *         highlighted, or %NULL to use the standard cursor
	 */
	public void matchSetCursor(int tag, Cursor cursor)
	{
		vte_terminal_match_set_cursor(vteTerminal, tag, (cursor is null) ? null : cursor.getCursorStruct());
	}

	/**
	 * Sets which cursor the terminal will use if the pointer is over the pattern
	 * specified by @tag.
	 *
	 * Params:
	 *     tag = the tag of the regex which should use the specified cursor
	 *     cursorName = the name of the cursor
	 */
	public void matchSetCursorName(int tag, string cursorName)
	{
		vte_terminal_match_set_cursor_name(vteTerminal, tag, Str.toStringz(cursorName));
	}

	/**
	 * Sets which cursor the terminal will use if the pointer is over the pattern
	 * specified by @tag.
	 *
	 * Params:
	 *     tag = the tag of the regex which should use the specified cursor
	 *     cursorType = a #GdkCursorType
	 */
	public void matchSetCursorType(int tag, GdkCursorType cursorType)
	{
		vte_terminal_match_set_cursor_type(vteTerminal, tag, cursorType);
	}

	/**
	 * Sends the contents of the #GDK_SELECTION_CLIPBOARD selection to the
	 * terminal's child.  If necessary, the data is converted from UTF-8 to the
	 * terminal's current encoding. It's called on paste menu item, or when
	 * user presses Shift+Insert.
	 */
	public void pasteClipboard()
	{
		vte_terminal_paste_clipboard(vteTerminal);
	}

	/**
	 * Sends the contents of the #GDK_SELECTION_PRIMARY selection to the terminal's
	 * child.  If necessary, the data is converted from UTF-8 to the terminal's
	 * current encoding.  The terminal will call also paste the
	 * #GDK_SELECTION_PRIMARY selection when the user clicks with the the second
	 * mouse button.
	 */
	public void pastePrimary()
	{
		vte_terminal_paste_primary(vteTerminal);
	}

	/**
	 * Creates a new #VtePty, and sets the emulation property
	 * from #VteTerminal:emulation.
	 *
	 * See vte_pty_new() for more information.
	 *
	 * Params:
	 *     flags = flags from #VtePtyFlags
	 *     cancellable = a #GCancellable, or %NULL
	 *
	 * Returns: a new #VtePty
	 *
	 * Throws: GException on failure.
	 */
	public Pty ptyNewSync(VtePtyFlags flags, Cancellable cancellable)
	{
		GError* err = null;

		auto p = vte_terminal_pty_new_sync(vteTerminal, flags, (cancellable is null) ? null : cancellable.getCancellableStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Pty)(cast(VtePty*) p, true);
	}

	/**
	 * Resets as much of the terminal's internal state as possible, discarding any
	 * unprocessed input data, resetting character attributes, cursor state,
	 * national character set state, status line, terminal modes (insert/delete),
	 * selection state, and encoding.
	 *
	 * Params:
	 *     clearTabstops = whether to reset tabstops
	 *     clearHistory = whether to empty the terminal's scrollback buffer
	 */
	public void reset(bool clearTabstops, bool clearHistory)
	{
		vte_terminal_reset(vteTerminal, clearTabstops, clearHistory);
	}

	/**
	 * Searches the next string matching the search regex set with
	 * vte_terminal_search_set_regex().
	 *
	 * Returns: %TRUE if a match was found
	 */
	public bool searchFindNext()
	{
		return vte_terminal_search_find_next(vteTerminal) != 0;
	}

	/**
	 * Searches the previous string matching the search regex set with
	 * vte_terminal_search_set_regex().
	 *
	 * Returns: %TRUE if a match was found
	 */
	public bool searchFindPrevious()
	{
		return vte_terminal_search_find_previous(vteTerminal) != 0;
	}

	/**
	 *
	 *
	 * Deprecated: use vte_terminal_search_get_regex() instead.
	 *
	 * Returns: %NULL
	 */
	public Regex searchGetGregex()
	{
		auto p = vte_terminal_search_get_gregex(vteTerminal);

		if(p is null)
		{
			return null;
		}

		return new Regex(cast(GRegex*) p);
	}

	/**
	 * Returns: the search #VteRegex regex set in @terminal, or %NULL
	 *
	 * Since: 0.46
	 */
	public RegexVte searchGetRegex()
	{
		auto p = vte_terminal_search_get_regex(vteTerminal);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RegexVte)(cast(VteRegex*) p);
	}

	/**
	 * Returns: whether searching will wrap around
	 */
	public bool searchGetWrapAround()
	{
		return vte_terminal_search_get_wrap_around(vteTerminal) != 0;
	}

	/**
	 * Sets the #GRegex regex to search for. Unsets the search regex when passed %NULL.
	 *
	 * Deprecated: use vte_terminal_search_set_regex() instead.
	 *
	 * Params:
	 *     gregex = a #GRegex, or %NULL
	 *     gflags = flags from #GRegexMatchFlags
	 */
	public void searchSetGregex(Regex gregex, GRegexMatchFlags gflags)
	{
		vte_terminal_search_set_gregex(vteTerminal, (gregex is null) ? null : gregex.getRegexStruct(), gflags);
	}

	/**
	 * Sets the regex to search for. Unsets the search regex when passed %NULL.
	 *
	 * Params:
	 *     regex = a #VteRegex, or %NULL
	 *     flags = PCRE2 match flags, or 0
	 *
	 * Since: 0.46
	 */
	public void searchSetRegex(RegexVte regex, uint flags)
	{
		vte_terminal_search_set_regex(vteTerminal, (regex is null) ? null : regex.getRegexStruct(), flags);
	}

	/**
	 * Sets whether search should wrap around to the beginning of the
	 * terminal content when reaching its end.
	 *
	 * Params:
	 *     wrapAround = whether search should wrap
	 */
	public void searchSetWrapAround(bool wrapAround)
	{
		vte_terminal_search_set_wrap_around(vteTerminal, wrapAround);
	}

	/**
	 * Selects all text within the terminal (including the scrollback buffer).
	 */
	public void selectAll()
	{
		vte_terminal_select_all(vteTerminal);
	}

	/**
	 * Controls whether or not the terminal will attempt to draw bold text,
	 * either by using a bold font variant or by repainting text with a different
	 * offset.
	 *
	 * Params:
	 *     allowBold = %TRUE if the terminal should attempt to draw bold text
	 */
	public void setAllowBold(bool allowBold)
	{
		vte_terminal_set_allow_bold(vteTerminal, allowBold);
	}

	/**
	 * Controls whether or not hyperlinks (OSC 8 escape sequence) are allowed.
	 *
	 * Params:
	 *     allowHyperlink = %TRUE if the terminal should allow hyperlinks
	 *
	 * Since: 0.50
	 */
	public void setAllowHyperlink(bool allowHyperlink)
	{
		vte_terminal_set_allow_hyperlink(vteTerminal, allowHyperlink);
	}

	/**
	 * Controls whether or not the terminal will beep when the child outputs the
	 * "bl" sequence.
	 *
	 * Params:
	 *     isAudible = %TRUE if the terminal should beep
	 */
	public void setAudibleBell(bool isAudible)
	{
		vte_terminal_set_audible_bell(vteTerminal, isAudible);
	}

	/**
	 * Modifies the terminal's backspace key binding, which controls what
	 * string or control sequence the terminal sends to its child when the user
	 * presses the backspace key.
	 *
	 * Params:
	 *     binding = a #VteEraseBinding for the backspace key
	 */
	public void setBackspaceBinding(VteEraseBinding binding)
	{
		vte_terminal_set_backspace_binding(vteTerminal, binding);
	}

	/**
	 * This setting controls whether ambiguous-width characters are narrow or wide
	 * when using the UTF-8 encoding (vte_terminal_set_encoding()). In all other encodings,
	 * the width of ambiguous-width characters is fixed.
	 *
	 * Params:
	 *     width = either 1 (narrow) or 2 (wide)
	 */
	public void setCjkAmbiguousWidth(int width)
	{
		vte_terminal_set_cjk_ambiguous_width(vteTerminal, width);
	}

	/**
	 * Sets the background color for text which does not have a specific background
	 * color assigned.  Only has effect when no background image is set and when
	 * the terminal is not transparent.
	 *
	 * Params:
	 *     background = the new background color
	 */
	public void setColorBackground(RGBA background)
	{
		vte_terminal_set_color_background(vteTerminal, (background is null) ? null : background.getRGBAStruct());
	}

	/**
	 * Sets the color used to draw bold text in the default foreground color.
	 * If @bold is %NULL then the default color is used.
	 *
	 * Params:
	 *     bold = the new bold color or %NULL
	 */
	public void setColorBold(RGBA bold)
	{
		vte_terminal_set_color_bold(vteTerminal, (bold is null) ? null : bold.getRGBAStruct());
	}

	/**
	 * Sets the background color for text which is under the cursor.  If %NULL, text
	 * under the cursor will be drawn with foreground and background colors
	 * reversed.
	 *
	 * Params:
	 *     cursorBackground = the new color to use for the text cursor, or %NULL
	 */
	public void setColorCursor(RGBA cursorBackground)
	{
		vte_terminal_set_color_cursor(vteTerminal, (cursorBackground is null) ? null : cursorBackground.getRGBAStruct());
	}

	/**
	 * Sets the foreground color for text which is under the cursor.  If %NULL, text
	 * under the cursor will be drawn with foreground and background colors
	 * reversed.
	 *
	 * Params:
	 *     cursorForeground = the new color to use for the text cursor, or %NULL
	 *
	 * Since: 0.44
	 */
	public void setColorCursorForeground(RGBA cursorForeground)
	{
		vte_terminal_set_color_cursor_foreground(vteTerminal, (cursorForeground is null) ? null : cursorForeground.getRGBAStruct());
	}

	/**
	 * Sets the foreground color used to draw normal text.
	 *
	 * Params:
	 *     foreground = the new foreground color
	 */
	public void setColorForeground(RGBA foreground)
	{
		vte_terminal_set_color_foreground(vteTerminal, (foreground is null) ? null : foreground.getRGBAStruct());
	}

	/**
	 * Sets the background color for text which is highlighted.  If %NULL,
	 * it is unset.  If neither highlight background nor highlight foreground are set,
	 * highlighted text (which is usually highlighted because it is selected) will
	 * be drawn with foreground and background colors reversed.
	 *
	 * Params:
	 *     highlightBackground = the new color to use for highlighted text, or %NULL
	 */
	public void setColorHighlight(RGBA highlightBackground)
	{
		vte_terminal_set_color_highlight(vteTerminal, (highlightBackground is null) ? null : highlightBackground.getRGBAStruct());
	}

	/**
	 * Sets the foreground color for text which is highlighted.  If %NULL,
	 * it is unset.  If neither highlight background nor highlight foreground are set,
	 * highlighted text (which is usually highlighted because it is selected) will
	 * be drawn with foreground and background colors reversed.
	 *
	 * Params:
	 *     highlightForeground = the new color to use for highlighted text, or %NULL
	 */
	public void setColorHighlightForeground(RGBA highlightForeground)
	{
		vte_terminal_set_color_highlight_foreground(vteTerminal, (highlightForeground is null) ? null : highlightForeground.getRGBAStruct());
	}

	/**
	 * @palette specifies the new values for the 256 palette colors: 8 standard colors,
	 * their 8 bright counterparts, 6x6x6 color cube, and 24 grayscale colors.
	 * Omitted entries will default to a hardcoded value.
	 *
	 * @palette_size must be 0, 8, 16, 232 or 256.
	 *
	 * If @foreground is %NULL and @palette_size is greater than 0, the new foreground
	 * color is taken from @palette[7].  If @background is %NULL and @palette_size is
	 * greater than 0, the new background color is taken from @palette[0].
	 *
	 * Params:
	 *     foreground = the new foreground color, or %NULL
	 *     background = the new background color, or %NULL
	 *     palette = the color palette
	 */
	public void setColors(RGBA foreground, RGBA background, RGBA[] palette)
	{
		GdkRGBA[] paletteArray = new GdkRGBA[palette.length];
		for ( int i = 0; i < palette.length; i++ )
		{
			paletteArray[i] = *(palette[i].getRGBAStruct());
		}

		vte_terminal_set_colors(vteTerminal, (foreground is null) ? null : foreground.getRGBAStruct(), (background is null) ? null : background.getRGBAStruct(), paletteArray.ptr, cast(size_t)palette.length);
	}

	/**
	 * Sets whether or not the cursor will blink. Using %VTE_CURSOR_BLINK_SYSTEM
	 * will use the #GtkSettings::gtk-cursor-blink setting.
	 *
	 * Params:
	 *     mode = the #VteCursorBlinkMode to use
	 */
	public void setCursorBlinkMode(VteCursorBlinkMode mode)
	{
		vte_terminal_set_cursor_blink_mode(vteTerminal, mode);
	}

	/**
	 * Sets the shape of the cursor drawn.
	 *
	 * Params:
	 *     shape = the #VteCursorShape to use
	 */
	public void setCursorShape(VteCursorShape shape)
	{
		vte_terminal_set_cursor_shape(vteTerminal, shape);
	}

	/**
	 * Reset the terminal palette to reasonable compiled-in default color.
	 */
	public void setDefaultColors()
	{
		vte_terminal_set_default_colors(vteTerminal);
	}

	/**
	 * Modifies the terminal's delete key binding, which controls what
	 * string or control sequence the terminal sends to its child when the user
	 * presses the delete key.
	 *
	 * Params:
	 *     binding = a #VteEraseBinding for the delete key
	 */
	public void setDeleteBinding(VteEraseBinding binding)
	{
		vte_terminal_set_delete_binding(vteTerminal, binding);
	}

	/**
	 * Changes the encoding the terminal will expect data from the child to
	 * be encoded with.  For certain terminal types, applications executing in the
	 * terminal can change the encoding. If @codeset is %NULL, it uses "UTF-8".
	 *
	 * Params:
	 *     codeset = a valid #GIConv target, or %NULL to use UTF-8
	 *
	 * Returns: %TRUE if the encoding could be changed to the specified one,
	 *     or %FALSE with @error set to %G_CONVERT_ERROR_NO_CONVERSION.
	 *
	 * Throws: GException on failure.
	 */
	public bool setEncoding(string codeset)
	{
		GError* err = null;

		auto p = vte_terminal_set_encoding(vteTerminal, Str.toStringz(codeset), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Sets the font used for rendering all text displayed by the terminal,
	 * overriding any fonts set using gtk_widget_modify_font().  The terminal
	 * will immediately attempt to load the desired font, retrieve its
	 * metrics, and attempt to resize itself to keep the same number of rows
	 * and columns.  The font scale is applied to the specified font.
	 *
	 * Params:
	 *     fontDesc = a #PangoFontDescription for the desired font, or %NULL
	 */
	public void setFont(PgFontDescription fontDesc)
	{
		vte_terminal_set_font(vteTerminal, (fontDesc is null) ? null : fontDesc.getPgFontDescriptionStruct());
	}

	/**
	 * Sets the terminal's font scale to @scale.
	 *
	 * Params:
	 *     scale = the font scale
	 */
	public void setFontScale(double scale)
	{
		vte_terminal_set_font_scale(vteTerminal, scale);
	}

	/**
	 * Sets @terminal as @window's geometry widget. See
	 * gtk_window_set_geometry_hints() for more information.
	 *
	 * @terminal must be realized (see gtk_widget_get_realized()).
	 *
	 * Params:
	 *     window = a #GtkWindow
	 */
	public void setGeometryHintsForWindow(Window window)
	{
		vte_terminal_set_geometry_hints_for_window(vteTerminal, (window is null) ? null : window.getWindowStruct());
	}

	/**
	 * Enables or disables user input. When user input is disabled,
	 * the terminal's child will not receive any key press, or mouse button
	 * press or motion events sent to it.
	 *
	 * Params:
	 *     enabled = whether to enable user input
	 */
	public void setInputEnabled(bool enabled)
	{
		vte_terminal_set_input_enabled(vteTerminal, enabled);
	}

	/**
	 * Changes the value of the terminal's mouse autohide setting.  When autohiding
	 * is enabled, the mouse cursor will be hidden when the user presses a key and
	 * shown when the user moves the mouse.  This setting can be read using
	 * vte_terminal_get_mouse_autohide().
	 *
	 * Params:
	 *     setting = whether the mouse pointer should autohide
	 */
	public void setMouseAutohide(bool setting)
	{
		vte_terminal_set_mouse_autohide(vteTerminal, setting);
	}

	/**
	 * Sets @pty as the PTY to use in @terminal.
	 * Use %NULL to unset the PTY.
	 *
	 * Params:
	 *     pty = a #VtePty, or %NULL
	 */
	public void setPty(Pty pty)
	{
		vte_terminal_set_pty(vteTerminal, (pty is null) ? null : pty.getPtyStruct());
	}

	/**
	 * Controls whether or not the terminal will rewrap its contents, including
	 * the scrollback history, whenever the terminal's width changes.
	 *
	 * Params:
	 *     rewrap = %TRUE if the terminal should rewrap on resize
	 */
	public void setRewrapOnResize(bool rewrap)
	{
		vte_terminal_set_rewrap_on_resize(vteTerminal, rewrap);
	}

	/**
	 * Controls whether or not the terminal will forcibly scroll to the bottom of
	 * the viewable history when the user presses a key.  Modifier keys do not
	 * trigger this behavior.
	 *
	 * Params:
	 *     scroll = whether the terminal should scroll on keystrokes
	 */
	public void setScrollOnKeystroke(bool scroll)
	{
		vte_terminal_set_scroll_on_keystroke(vteTerminal, scroll);
	}

	/**
	 * Controls whether or not the terminal will forcibly scroll to the bottom of
	 * the viewable history when the new data is received from the child.
	 *
	 * Params:
	 *     scroll = whether the terminal should scroll on output
	 */
	public void setScrollOnOutput(bool scroll)
	{
		vte_terminal_set_scroll_on_output(vteTerminal, scroll);
	}

	/**
	 * Sets the length of the scrollback buffer used by the terminal.  The size of
	 * the scrollback buffer will be set to the larger of this value and the number
	 * of visible rows the widget can display, so 0 can safely be used to disable
	 * scrollback.
	 *
	 * A negative value means "infinite scrollback".
	 *
	 * Note that this setting only affects the normal screen buffer.
	 * No scrollback is allowed on the alternate screen buffer.
	 *
	 * Params:
	 *     lines = the length of the history buffer
	 */
	public void setScrollbackLines(glong lines)
	{
		vte_terminal_set_scrollback_lines(vteTerminal, lines);
	}

	/**
	 * Attempts to change the terminal's size in terms of rows and columns.  If
	 * the attempt succeeds, the widget will resize itself to the proper size.
	 *
	 * Params:
	 *     columns = the desired number of columns
	 *     rows = the desired number of rows
	 */
	public void setSize(glong columns, glong rows)
	{
		vte_terminal_set_size(vteTerminal, columns, rows);
	}

	/**
	 * With this function you can provide a set of characters which will
	 * be considered parts of a word when doing word-wise selection, in
	 * addition to the default which only considers alphanumeric characters
	 * part of a word.
	 *
	 * The characters in @exceptions must be non-alphanumeric, each character
	 * must occur only once, and if @exceptions contains the character
	 * U+002D HYPHEN-MINUS, it must be at the start of the string.
	 *
	 * Use %NULL to reset the set of exception characters to the default.
	 *
	 * Params:
	 *     exceptions = a string of ASCII punctuation characters, or %NULL
	 *
	 * Since: 0.40
	 */
	public void setWordCharExceptions(string exceptions)
	{
		vte_terminal_set_word_char_exceptions(vteTerminal, Str.toStringz(exceptions));
	}

	/**
	 * A convenience function that wraps creating the #VtePty and spawning
	 * the child process on it. See vte_pty_new_sync(), vte_pty_spawn_async(),
	 * and vte_pty_spawn_finish() for more information.
	 *
	 * When the operation is finished successfully, @callback will be called
	 * with the child #GPid, and a %NULL #GError. The child PID will already be
	 * watched via vte_terminal_watch_child().
	 *
	 * When the operation fails, @callback will be called with a -1 #GPid,
	 * and a non-%NULL #GError containing the error information.
	 *
	 * Note that if @terminal has been destroyed before the operation is called,
	 * @callback will be called with a %NULL @terminal; you must not do anything
	 * in the callback besides freeing any resources associated with @user_data,
	 * but taking care not to access the now-destroyed #VteTerminal. Note that
	 * in this case, if spawning was successful, the child process will be aborted
	 * automatically.
	 *
	 * Params:
	 *     ptyFlags = flags from #VtePtyFlags
	 *     workingDirectory = the name of a directory the command should start
	 *         in, or %NULL to use the current working directory
	 *     argv = child's argument vector
	 *     envv = a list of environment
	 *         variables to be added to the environment before starting the process, or %NULL
	 *     spawnFlags = flags from #GSpawnFlags
	 *     childSetup = an extra child setup function to run in the child just before exec(), or %NULL
	 *     childSetupData = user data for @child_setup, or %NULL
	 *     childSetupDataDestroy = a #GDestroyNotify for @child_setup_data, or %NULL
	 *     timeout = a timeout value in ms, or -1 to wait indefinitely
	 *     cancellable = a #GCancellable, or %NULL
	 *     callback = a #VteTerminalSpawnAsyncCallback, or %NULL
	 *     userData = user data for @callback, or %NULL
	 *
	 * Since: 0.48
	 */
	public void spawnAsync(VtePtyFlags ptyFlags, string workingDirectory, string[] argv, string[] envv, GSpawnFlags spawnFlags, GSpawnChildSetupFunc childSetup, void* childSetupData, GDestroyNotify childSetupDataDestroy, int timeout, Cancellable cancellable, VteTerminalSpawnAsyncCallback callback, void* userData)
	{
		vte_terminal_spawn_async(vteTerminal, ptyFlags, Str.toStringz(workingDirectory), Str.toStringzArray(argv), Str.toStringzArray(envv), spawnFlags, childSetup, childSetupData, childSetupDataDestroy, timeout, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Starts the specified command under a newly-allocated controlling
	 * pseudo-terminal.  The @argv and @envv lists should be %NULL-terminated.
	 * The "TERM" environment variable is automatically set to a default value,
	 * but can be overridden from @envv.
	 * @pty_flags controls logging the session to the specified system log files.
	 *
	 * Note that %G_SPAWN_DO_NOT_REAP_CHILD will always be added to @spawn_flags.
	 *
	 * Note that all open file descriptors will be closed in the child. If you want
	 * to keep some file descriptor open for use in the child process, you need to
	 * use a child setup function that unsets the FD_CLOEXEC flag on that file
	 * descriptor.
	 *
	 * See vte_pty_new(), g_spawn_async() and vte_terminal_watch_child() for more information.
	 *
	 * Deprecated: Use vte_terminal_spawn_async() instead.
	 *
	 * Params:
	 *     ptyFlags = flags from #VtePtyFlags
	 *     workingDirectory = the name of a directory the command should start
	 *         in, or %NULL to use the current working directory
	 *     argv = child's argument vector
	 *     envv = a list of environment
	 *         variables to be added to the environment before starting the process, or %NULL
	 *     spawnFlags = flags from #GSpawnFlags
	 *     childSetup = an extra child setup function to run in the child just before exec(), or %NULL
	 *     childSetupData = user data for @child_setup
	 *     childPid = a location to store the child PID, or %NULL
	 *     cancellable = a #GCancellable, or %NULL
	 *
	 * Returns: %TRUE on success, or %FALSE on error with @error filled in
	 *
	 * Throws: GException on failure.
	 */
	public bool spawnSync(VtePtyFlags ptyFlags, string workingDirectory, string[] argv, string[] envv, GSpawnFlags spawnFlags, GSpawnChildSetupFunc childSetup, void* childSetupData, out GPid childPid, Cancellable cancellable)
	{
		GError* err = null;

		auto p = vte_terminal_spawn_sync(vteTerminal, ptyFlags, Str.toStringz(workingDirectory), Str.toStringzArray(argv), Str.toStringzArray(envv), spawnFlags, childSetup, childSetupData, &childPid, (cancellable is null) ? null : cancellable.getCancellableStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Clears the current selection.
	 */
	public void unselectAll()
	{
		vte_terminal_unselect_all(vteTerminal);
	}

	/**
	 * Watches @child_pid. When the process exists, the #VteTerminal::child-exited
	 * signal will be called with the child's exit status.
	 *
	 * Prior to calling this function, a #VtePty must have been set in @terminal
	 * using vte_terminal_set_pty().
	 * When the child exits, the terminal's #VtePty will be set to %NULL.
	 *
	 * Note: g_child_watch_add() or g_child_watch_add_full() must not have
	 * been called for @child_pid, nor a #GSource for it been created with
	 * g_child_watch_source_new().
	 *
	 * Note: when using the g_spawn_async() family of functions,
	 * the %G_SPAWN_DO_NOT_REAP_CHILD flag MUST have been passed.
	 *
	 * Params:
	 *     childPid = a #GPid
	 */
	public void watchChild(GPid childPid)
	{
		vte_terminal_watch_child(vteTerminal, childPid);
	}

	/**
	 * Write contents of the current contents of @terminal (including any
	 * scrollback history) to @stream according to @flags.
	 *
	 * If @cancellable is not %NULL, then the operation can be cancelled by triggering
	 * the cancellable object from another thread. If the operation was cancelled,
	 * the error %G_IO_ERROR_CANCELLED will be returned in @error.
	 *
	 * This is a synchronous operation and will make the widget (and input
	 * processing) during the write operation, which may take a long time
	 * depending on scrollback history and @stream availability for writing.
	 *
	 * Params:
	 *     stream = a #GOutputStream to write to
	 *     flags = a set of #VteWriteFlags
	 *     cancellable = a #GCancellable object, or %NULL
	 *
	 * Returns: %TRUE on success, %FALSE if there was an error
	 *
	 * Throws: GException on failure.
	 */
	public bool writeContentsSync(OutputStream stream, VteWriteFlags flags, Cancellable cancellable)
	{
		GError* err = null;

		auto p = vte_terminal_write_contents_sync(vteTerminal, (stream is null) ? null : stream.getOutputStreamStruct(), flags, (cancellable is null) ? null : cancellable.getCancellableStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	protected class OnBellDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onBellListeners ~= this;
		}

		void remove(OnBellDelegateWrapper source)
		{
			foreach(index, wrapper; onBellListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onBellListeners[index] = null;
					onBellListeners = std.algorithm.remove(onBellListeners, index);
					break;
				}
			}
		}
	}
	OnBellDelegateWrapper[] onBellListeners;

	/**
	 * This signal is emitted when the a child sends a bell request to the
	 * terminal.
	 */
	gulong addOnBell(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnBellDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"bell",
			cast(GCallback)&callBackBell,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackBellDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackBell(VteTerminal* terminalStruct, OnBellDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackBellDestroy(OnBellDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnCharSizeChangedDelegateWrapper
	{
		void delegate(uint, uint, Terminal) dlg;
		gulong handlerId;

		this(void delegate(uint, uint, Terminal) dlg)
		{
			this.dlg = dlg;
			onCharSizeChangedListeners ~= this;
		}

		void remove(OnCharSizeChangedDelegateWrapper source)
		{
			foreach(index, wrapper; onCharSizeChangedListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onCharSizeChangedListeners[index] = null;
					onCharSizeChangedListeners = std.algorithm.remove(onCharSizeChangedListeners, index);
					break;
				}
			}
		}
	}
	OnCharSizeChangedDelegateWrapper[] onCharSizeChangedListeners;

	/**
	 * Emitted whenever selection of a new font causes the values of the
	 * %char_width or %char_height fields to change.
	 *
	 * Params:
	 *     width = the new character cell width
	 *     height = the new character cell height
	 */
	gulong addOnCharSizeChanged(void delegate(uint, uint, Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnCharSizeChangedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"char-size-changed",
			cast(GCallback)&callBackCharSizeChanged,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackCharSizeChangedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackCharSizeChanged(VteTerminal* terminalStruct, uint width, uint height, OnCharSizeChangedDelegateWrapper wrapper)
	{
		wrapper.dlg(width, height, wrapper.outer);
	}

	extern(C) static void callBackCharSizeChangedDestroy(OnCharSizeChangedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnChildExitedDelegateWrapper
	{
		void delegate(int, Terminal) dlg;
		gulong handlerId;

		this(void delegate(int, Terminal) dlg)
		{
			this.dlg = dlg;
			onChildExitedListeners ~= this;
		}

		void remove(OnChildExitedDelegateWrapper source)
		{
			foreach(index, wrapper; onChildExitedListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onChildExitedListeners[index] = null;
					onChildExitedListeners = std.algorithm.remove(onChildExitedListeners, index);
					break;
				}
			}
		}
	}
	OnChildExitedDelegateWrapper[] onChildExitedListeners;

	/**
	 * This signal is emitted when the terminal detects that a child
	 * watched using vte_terminal_watch_child() has exited.
	 *
	 * Params:
	 *     status = the child's exit status
	 */
	gulong addOnChildExited(void delegate(int, Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnChildExitedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"child-exited",
			cast(GCallback)&callBackChildExited,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackChildExitedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackChildExited(VteTerminal* terminalStruct, int status, OnChildExitedDelegateWrapper wrapper)
	{
		wrapper.dlg(status, wrapper.outer);
	}

	extern(C) static void callBackChildExitedDestroy(OnChildExitedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnCommitDelegateWrapper
	{
		void delegate(string, uint, Terminal) dlg;
		gulong handlerId;

		this(void delegate(string, uint, Terminal) dlg)
		{
			this.dlg = dlg;
			onCommitListeners ~= this;
		}

		void remove(OnCommitDelegateWrapper source)
		{
			foreach(index, wrapper; onCommitListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onCommitListeners[index] = null;
					onCommitListeners = std.algorithm.remove(onCommitListeners, index);
					break;
				}
			}
		}
	}
	OnCommitDelegateWrapper[] onCommitListeners;

	/**
	 * Emitted whenever the terminal receives input from the user and
	 * prepares to send it to the child process.  The signal is emitted even
	 * when there is no child process.
	 *
	 * Params:
	 *     text = a string of text
	 *     size = the length of that string of text
	 */
	gulong addOnCommit(void delegate(string, uint, Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnCommitDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"commit",
			cast(GCallback)&callBackCommit,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackCommitDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackCommit(VteTerminal* terminalStruct, char* text, uint size, OnCommitDelegateWrapper wrapper)
	{
		wrapper.dlg(Str.toString(text), size, wrapper.outer);
	}

	extern(C) static void callBackCommitDestroy(OnCommitDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnContentsChangedDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onContentsChangedListeners ~= this;
		}

		void remove(OnContentsChangedDelegateWrapper source)
		{
			foreach(index, wrapper; onContentsChangedListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onContentsChangedListeners[index] = null;
					onContentsChangedListeners = std.algorithm.remove(onContentsChangedListeners, index);
					break;
				}
			}
		}
	}
	OnContentsChangedDelegateWrapper[] onContentsChangedListeners;

	/**
	 * Emitted whenever the visible appearance of the terminal has changed.
	 * Used primarily by #VteTerminalAccessible.
	 */
	gulong addOnContentsChanged(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnContentsChangedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"contents-changed",
			cast(GCallback)&callBackContentsChanged,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackContentsChangedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackContentsChanged(VteTerminal* terminalStruct, OnContentsChangedDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackContentsChangedDestroy(OnContentsChangedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnCopyClipboardDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onCopyClipboardListeners ~= this;
		}

		void remove(OnCopyClipboardDelegateWrapper source)
		{
			foreach(index, wrapper; onCopyClipboardListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onCopyClipboardListeners[index] = null;
					onCopyClipboardListeners = std.algorithm.remove(onCopyClipboardListeners, index);
					break;
				}
			}
		}
	}
	OnCopyClipboardDelegateWrapper[] onCopyClipboardListeners;

	/**
	 * Emitted whenever vte_terminal_copy_clipboard() is called.
	 */
	gulong addOnCopyClipboard(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnCopyClipboardDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"copy-clipboard",
			cast(GCallback)&callBackCopyClipboard,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackCopyClipboardDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackCopyClipboard(VteTerminal* terminalStruct, OnCopyClipboardDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackCopyClipboardDestroy(OnCopyClipboardDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnCurrentDirectoryUriChangedDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onCurrentDirectoryUriChangedListeners ~= this;
		}

		void remove(OnCurrentDirectoryUriChangedDelegateWrapper source)
		{
			foreach(index, wrapper; onCurrentDirectoryUriChangedListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onCurrentDirectoryUriChangedListeners[index] = null;
					onCurrentDirectoryUriChangedListeners = std.algorithm.remove(onCurrentDirectoryUriChangedListeners, index);
					break;
				}
			}
		}
	}
	OnCurrentDirectoryUriChangedDelegateWrapper[] onCurrentDirectoryUriChangedListeners;

	/**
	 * Emitted when the current directory URI is modified.
	 */
	gulong addOnCurrentDirectoryUriChanged(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnCurrentDirectoryUriChangedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"current-directory-uri-changed",
			cast(GCallback)&callBackCurrentDirectoryUriChanged,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackCurrentDirectoryUriChangedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackCurrentDirectoryUriChanged(VteTerminal* terminalStruct, OnCurrentDirectoryUriChangedDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackCurrentDirectoryUriChangedDestroy(OnCurrentDirectoryUriChangedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnCurrentFileUriChangedDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onCurrentFileUriChangedListeners ~= this;
		}

		void remove(OnCurrentFileUriChangedDelegateWrapper source)
		{
			foreach(index, wrapper; onCurrentFileUriChangedListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onCurrentFileUriChangedListeners[index] = null;
					onCurrentFileUriChangedListeners = std.algorithm.remove(onCurrentFileUriChangedListeners, index);
					break;
				}
			}
		}
	}
	OnCurrentFileUriChangedDelegateWrapper[] onCurrentFileUriChangedListeners;

	/**
	 * Emitted when the current file URI is modified.
	 */
	gulong addOnCurrentFileUriChanged(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnCurrentFileUriChangedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"current-file-uri-changed",
			cast(GCallback)&callBackCurrentFileUriChanged,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackCurrentFileUriChangedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackCurrentFileUriChanged(VteTerminal* terminalStruct, OnCurrentFileUriChangedDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackCurrentFileUriChangedDestroy(OnCurrentFileUriChangedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnCursorMovedDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onCursorMovedListeners ~= this;
		}

		void remove(OnCursorMovedDelegateWrapper source)
		{
			foreach(index, wrapper; onCursorMovedListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onCursorMovedListeners[index] = null;
					onCursorMovedListeners = std.algorithm.remove(onCursorMovedListeners, index);
					break;
				}
			}
		}
	}
	OnCursorMovedDelegateWrapper[] onCursorMovedListeners;

	/**
	 * Emitted whenever the cursor moves to a new character cell.  Used
	 * primarily by #VteTerminalAccessible.
	 */
	gulong addOnCursorMoved(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnCursorMovedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"cursor-moved",
			cast(GCallback)&callBackCursorMoved,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackCursorMovedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackCursorMoved(VteTerminal* terminalStruct, OnCursorMovedDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackCursorMovedDestroy(OnCursorMovedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnDecreaseFontSizeDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onDecreaseFontSizeListeners ~= this;
		}

		void remove(OnDecreaseFontSizeDelegateWrapper source)
		{
			foreach(index, wrapper; onDecreaseFontSizeListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onDecreaseFontSizeListeners[index] = null;
					onDecreaseFontSizeListeners = std.algorithm.remove(onDecreaseFontSizeListeners, index);
					break;
				}
			}
		}
	}
	OnDecreaseFontSizeDelegateWrapper[] onDecreaseFontSizeListeners;

	/**
	 * Emitted when the user hits the '-' key while holding the Control key.
	 */
	gulong addOnDecreaseFontSize(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnDecreaseFontSizeDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"decrease-font-size",
			cast(GCallback)&callBackDecreaseFontSize,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackDecreaseFontSizeDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackDecreaseFontSize(VteTerminal* terminalStruct, OnDecreaseFontSizeDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackDecreaseFontSizeDestroy(OnDecreaseFontSizeDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnDeiconifyWindowDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onDeiconifyWindowListeners ~= this;
		}

		void remove(OnDeiconifyWindowDelegateWrapper source)
		{
			foreach(index, wrapper; onDeiconifyWindowListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onDeiconifyWindowListeners[index] = null;
					onDeiconifyWindowListeners = std.algorithm.remove(onDeiconifyWindowListeners, index);
					break;
				}
			}
		}
	}
	OnDeiconifyWindowDelegateWrapper[] onDeiconifyWindowListeners;

	/**
	 * Emitted at the child application's request.
	 */
	gulong addOnDeiconifyWindow(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnDeiconifyWindowDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"deiconify-window",
			cast(GCallback)&callBackDeiconifyWindow,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackDeiconifyWindowDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackDeiconifyWindow(VteTerminal* terminalStruct, OnDeiconifyWindowDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackDeiconifyWindowDestroy(OnDeiconifyWindowDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnEncodingChangedDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onEncodingChangedListeners ~= this;
		}

		void remove(OnEncodingChangedDelegateWrapper source)
		{
			foreach(index, wrapper; onEncodingChangedListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onEncodingChangedListeners[index] = null;
					onEncodingChangedListeners = std.algorithm.remove(onEncodingChangedListeners, index);
					break;
				}
			}
		}
	}
	OnEncodingChangedDelegateWrapper[] onEncodingChangedListeners;

	/**
	 * Emitted whenever the terminal's current encoding has changed, either
	 * as a result of receiving a control sequence which toggled between the
	 * local and UTF-8 encodings, or at the parent application's request.
	 */
	gulong addOnEncodingChanged(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnEncodingChangedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"encoding-changed",
			cast(GCallback)&callBackEncodingChanged,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackEncodingChangedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackEncodingChanged(VteTerminal* terminalStruct, OnEncodingChangedDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackEncodingChangedDestroy(OnEncodingChangedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnEofDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onEofListeners ~= this;
		}

		void remove(OnEofDelegateWrapper source)
		{
			foreach(index, wrapper; onEofListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onEofListeners[index] = null;
					onEofListeners = std.algorithm.remove(onEofListeners, index);
					break;
				}
			}
		}
	}
	OnEofDelegateWrapper[] onEofListeners;

	/**
	 * Emitted when the terminal receives an end-of-file from a child which
	 * is running in the terminal.  This signal is frequently (but not
	 * always) emitted with a #VteTerminal::child-exited signal.
	 */
	gulong addOnEof(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnEofDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"eof",
			cast(GCallback)&callBackEof,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackEofDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackEof(VteTerminal* terminalStruct, OnEofDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackEofDestroy(OnEofDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnHyperlinkHoverUriChangedDelegateWrapper
	{
		void delegate(string, GdkRectangle*, Terminal) dlg;
		gulong handlerId;

		this(void delegate(string, GdkRectangle*, Terminal) dlg)
		{
			this.dlg = dlg;
			onHyperlinkHoverUriChangedListeners ~= this;
		}

		void remove(OnHyperlinkHoverUriChangedDelegateWrapper source)
		{
			foreach(index, wrapper; onHyperlinkHoverUriChangedListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onHyperlinkHoverUriChangedListeners[index] = null;
					onHyperlinkHoverUriChangedListeners = std.algorithm.remove(onHyperlinkHoverUriChangedListeners, index);
					break;
				}
			}
		}
	}
	OnHyperlinkHoverUriChangedDelegateWrapper[] onHyperlinkHoverUriChangedListeners;

	/**
	 * Emitted when the hovered hyperlink changes.
	 *
	 * @uri and @bbox are owned by VTE, must not be modified, and might
	 * change after the signal handlers returns.
	 *
	 * The signal is not re-emitted when the bounding box changes for the
	 * same hyperlink. This might change in a future VTE version without notice.
	 *
	 * Params:
	 *     uri = the nonempty target URI under the mouse, or NULL
	 *     bbox = the bounding box of the hyperlink anchor text, or NULL
	 *
	 * Since: 0.50
	 */
	gulong addOnHyperlinkHoverUriChanged(void delegate(string, GdkRectangle*, Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnHyperlinkHoverUriChangedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"hyperlink-hover-uri-changed",
			cast(GCallback)&callBackHyperlinkHoverUriChanged,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackHyperlinkHoverUriChangedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackHyperlinkHoverUriChanged(VteTerminal* terminalStruct, char* uri, GdkRectangle* bbox, OnHyperlinkHoverUriChangedDelegateWrapper wrapper)
	{
		wrapper.dlg(Str.toString(uri), bbox, wrapper.outer);
	}

	extern(C) static void callBackHyperlinkHoverUriChangedDestroy(OnHyperlinkHoverUriChangedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnIconTitleChangedDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onIconTitleChangedListeners ~= this;
		}

		void remove(OnIconTitleChangedDelegateWrapper source)
		{
			foreach(index, wrapper; onIconTitleChangedListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onIconTitleChangedListeners[index] = null;
					onIconTitleChangedListeners = std.algorithm.remove(onIconTitleChangedListeners, index);
					break;
				}
			}
		}
	}
	OnIconTitleChangedDelegateWrapper[] onIconTitleChangedListeners;

	/**
	 * Emitted when the terminal's %icon_title field is modified.
	 */
	gulong addOnIconTitleChanged(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnIconTitleChangedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"icon-title-changed",
			cast(GCallback)&callBackIconTitleChanged,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackIconTitleChangedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackIconTitleChanged(VteTerminal* terminalStruct, OnIconTitleChangedDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackIconTitleChangedDestroy(OnIconTitleChangedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnIconifyWindowDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onIconifyWindowListeners ~= this;
		}

		void remove(OnIconifyWindowDelegateWrapper source)
		{
			foreach(index, wrapper; onIconifyWindowListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onIconifyWindowListeners[index] = null;
					onIconifyWindowListeners = std.algorithm.remove(onIconifyWindowListeners, index);
					break;
				}
			}
		}
	}
	OnIconifyWindowDelegateWrapper[] onIconifyWindowListeners;

	/**
	 * Emitted at the child application's request.
	 */
	gulong addOnIconifyWindow(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnIconifyWindowDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"iconify-window",
			cast(GCallback)&callBackIconifyWindow,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackIconifyWindowDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackIconifyWindow(VteTerminal* terminalStruct, OnIconifyWindowDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackIconifyWindowDestroy(OnIconifyWindowDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnIncreaseFontSizeDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onIncreaseFontSizeListeners ~= this;
		}

		void remove(OnIncreaseFontSizeDelegateWrapper source)
		{
			foreach(index, wrapper; onIncreaseFontSizeListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onIncreaseFontSizeListeners[index] = null;
					onIncreaseFontSizeListeners = std.algorithm.remove(onIncreaseFontSizeListeners, index);
					break;
				}
			}
		}
	}
	OnIncreaseFontSizeDelegateWrapper[] onIncreaseFontSizeListeners;

	/**
	 * Emitted when the user hits the '+' key while holding the Control key.
	 */
	gulong addOnIncreaseFontSize(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnIncreaseFontSizeDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"increase-font-size",
			cast(GCallback)&callBackIncreaseFontSize,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackIncreaseFontSizeDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackIncreaseFontSize(VteTerminal* terminalStruct, OnIncreaseFontSizeDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackIncreaseFontSizeDestroy(OnIncreaseFontSizeDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnLowerWindowDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onLowerWindowListeners ~= this;
		}

		void remove(OnLowerWindowDelegateWrapper source)
		{
			foreach(index, wrapper; onLowerWindowListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onLowerWindowListeners[index] = null;
					onLowerWindowListeners = std.algorithm.remove(onLowerWindowListeners, index);
					break;
				}
			}
		}
	}
	OnLowerWindowDelegateWrapper[] onLowerWindowListeners;

	/**
	 * Emitted at the child application's request.
	 */
	gulong addOnLowerWindow(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnLowerWindowDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"lower-window",
			cast(GCallback)&callBackLowerWindow,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackLowerWindowDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackLowerWindow(VteTerminal* terminalStruct, OnLowerWindowDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackLowerWindowDestroy(OnLowerWindowDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnMaximizeWindowDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onMaximizeWindowListeners ~= this;
		}

		void remove(OnMaximizeWindowDelegateWrapper source)
		{
			foreach(index, wrapper; onMaximizeWindowListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onMaximizeWindowListeners[index] = null;
					onMaximizeWindowListeners = std.algorithm.remove(onMaximizeWindowListeners, index);
					break;
				}
			}
		}
	}
	OnMaximizeWindowDelegateWrapper[] onMaximizeWindowListeners;

	/**
	 * Emitted at the child application's request.
	 */
	gulong addOnMaximizeWindow(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnMaximizeWindowDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"maximize-window",
			cast(GCallback)&callBackMaximizeWindow,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackMaximizeWindowDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackMaximizeWindow(VteTerminal* terminalStruct, OnMaximizeWindowDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackMaximizeWindowDestroy(OnMaximizeWindowDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnMoveWindowDelegateWrapper
	{
		void delegate(uint, uint, Terminal) dlg;
		gulong handlerId;

		this(void delegate(uint, uint, Terminal) dlg)
		{
			this.dlg = dlg;
			onMoveWindowListeners ~= this;
		}

		void remove(OnMoveWindowDelegateWrapper source)
		{
			foreach(index, wrapper; onMoveWindowListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onMoveWindowListeners[index] = null;
					onMoveWindowListeners = std.algorithm.remove(onMoveWindowListeners, index);
					break;
				}
			}
		}
	}
	OnMoveWindowDelegateWrapper[] onMoveWindowListeners;

	/**
	 * Emitted at the child application's request.
	 *
	 * Params:
	 *     x = the terminal's desired location, X coordinate
	 *     y = the terminal's desired location, Y coordinate
	 */
	gulong addOnMoveWindow(void delegate(uint, uint, Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnMoveWindowDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"move-window",
			cast(GCallback)&callBackMoveWindow,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackMoveWindowDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackMoveWindow(VteTerminal* terminalStruct, uint x, uint y, OnMoveWindowDelegateWrapper wrapper)
	{
		wrapper.dlg(x, y, wrapper.outer);
	}

	extern(C) static void callBackMoveWindowDestroy(OnMoveWindowDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnPasteClipboardDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onPasteClipboardListeners ~= this;
		}

		void remove(OnPasteClipboardDelegateWrapper source)
		{
			foreach(index, wrapper; onPasteClipboardListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onPasteClipboardListeners[index] = null;
					onPasteClipboardListeners = std.algorithm.remove(onPasteClipboardListeners, index);
					break;
				}
			}
		}
	}
	OnPasteClipboardDelegateWrapper[] onPasteClipboardListeners;

	/**
	 * Emitted whenever vte_terminal_paste_clipboard() is called.
	 */
	gulong addOnPasteClipboard(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnPasteClipboardDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"paste-clipboard",
			cast(GCallback)&callBackPasteClipboard,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackPasteClipboardDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackPasteClipboard(VteTerminal* terminalStruct, OnPasteClipboardDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackPasteClipboardDestroy(OnPasteClipboardDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnRaiseWindowDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onRaiseWindowListeners ~= this;
		}

		void remove(OnRaiseWindowDelegateWrapper source)
		{
			foreach(index, wrapper; onRaiseWindowListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onRaiseWindowListeners[index] = null;
					onRaiseWindowListeners = std.algorithm.remove(onRaiseWindowListeners, index);
					break;
				}
			}
		}
	}
	OnRaiseWindowDelegateWrapper[] onRaiseWindowListeners;

	/**
	 * Emitted at the child application's request.
	 */
	gulong addOnRaiseWindow(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnRaiseWindowDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"raise-window",
			cast(GCallback)&callBackRaiseWindow,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackRaiseWindowDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackRaiseWindow(VteTerminal* terminalStruct, OnRaiseWindowDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackRaiseWindowDestroy(OnRaiseWindowDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnRefreshWindowDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onRefreshWindowListeners ~= this;
		}

		void remove(OnRefreshWindowDelegateWrapper source)
		{
			foreach(index, wrapper; onRefreshWindowListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onRefreshWindowListeners[index] = null;
					onRefreshWindowListeners = std.algorithm.remove(onRefreshWindowListeners, index);
					break;
				}
			}
		}
	}
	OnRefreshWindowDelegateWrapper[] onRefreshWindowListeners;

	/**
	 * Emitted at the child application's request.
	 */
	gulong addOnRefreshWindow(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnRefreshWindowDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"refresh-window",
			cast(GCallback)&callBackRefreshWindow,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackRefreshWindowDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackRefreshWindow(VteTerminal* terminalStruct, OnRefreshWindowDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackRefreshWindowDestroy(OnRefreshWindowDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnResizeWindowDelegateWrapper
	{
		void delegate(uint, uint, Terminal) dlg;
		gulong handlerId;

		this(void delegate(uint, uint, Terminal) dlg)
		{
			this.dlg = dlg;
			onResizeWindowListeners ~= this;
		}

		void remove(OnResizeWindowDelegateWrapper source)
		{
			foreach(index, wrapper; onResizeWindowListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onResizeWindowListeners[index] = null;
					onResizeWindowListeners = std.algorithm.remove(onResizeWindowListeners, index);
					break;
				}
			}
		}
	}
	OnResizeWindowDelegateWrapper[] onResizeWindowListeners;

	/**
	 * Emitted at the child application's request.
	 *
	 * Params:
	 *     width = the desired number of columns
	 *     height = the desired number of rows
	 */
	gulong addOnResizeWindow(void delegate(uint, uint, Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnResizeWindowDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"resize-window",
			cast(GCallback)&callBackResizeWindow,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackResizeWindowDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackResizeWindow(VteTerminal* terminalStruct, uint width, uint height, OnResizeWindowDelegateWrapper wrapper)
	{
		wrapper.dlg(width, height, wrapper.outer);
	}

	extern(C) static void callBackResizeWindowDestroy(OnResizeWindowDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnRestoreWindowDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onRestoreWindowListeners ~= this;
		}

		void remove(OnRestoreWindowDelegateWrapper source)
		{
			foreach(index, wrapper; onRestoreWindowListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onRestoreWindowListeners[index] = null;
					onRestoreWindowListeners = std.algorithm.remove(onRestoreWindowListeners, index);
					break;
				}
			}
		}
	}
	OnRestoreWindowDelegateWrapper[] onRestoreWindowListeners;

	/**
	 * Emitted at the child application's request.
	 */
	gulong addOnRestoreWindow(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnRestoreWindowDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"restore-window",
			cast(GCallback)&callBackRestoreWindow,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackRestoreWindowDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackRestoreWindow(VteTerminal* terminalStruct, OnRestoreWindowDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackRestoreWindowDestroy(OnRestoreWindowDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnSelectionChangedDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onSelectionChangedListeners ~= this;
		}

		void remove(OnSelectionChangedDelegateWrapper source)
		{
			foreach(index, wrapper; onSelectionChangedListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onSelectionChangedListeners[index] = null;
					onSelectionChangedListeners = std.algorithm.remove(onSelectionChangedListeners, index);
					break;
				}
			}
		}
	}
	OnSelectionChangedDelegateWrapper[] onSelectionChangedListeners;

	/**
	 * Emitted whenever the contents of terminal's selection changes.
	 */
	gulong addOnSelectionChanged(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnSelectionChangedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"selection-changed",
			cast(GCallback)&callBackSelectionChanged,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackSelectionChangedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackSelectionChanged(VteTerminal* terminalStruct, OnSelectionChangedDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackSelectionChangedDestroy(OnSelectionChangedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnTextDeletedDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onTextDeletedListeners ~= this;
		}

		void remove(OnTextDeletedDelegateWrapper source)
		{
			foreach(index, wrapper; onTextDeletedListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onTextDeletedListeners[index] = null;
					onTextDeletedListeners = std.algorithm.remove(onTextDeletedListeners, index);
					break;
				}
			}
		}
	}
	OnTextDeletedDelegateWrapper[] onTextDeletedListeners;

	/**
	 * An internal signal used for communication between the terminal and
	 * its accessibility peer. May not be emitted under certain
	 * circumstances.
	 */
	gulong addOnTextDeleted(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnTextDeletedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"text-deleted",
			cast(GCallback)&callBackTextDeleted,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackTextDeletedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackTextDeleted(VteTerminal* terminalStruct, OnTextDeletedDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackTextDeletedDestroy(OnTextDeletedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnTextInsertedDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onTextInsertedListeners ~= this;
		}

		void remove(OnTextInsertedDelegateWrapper source)
		{
			foreach(index, wrapper; onTextInsertedListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onTextInsertedListeners[index] = null;
					onTextInsertedListeners = std.algorithm.remove(onTextInsertedListeners, index);
					break;
				}
			}
		}
	}
	OnTextInsertedDelegateWrapper[] onTextInsertedListeners;

	/**
	 * An internal signal used for communication between the terminal and
	 * its accessibility peer. May not be emitted under certain
	 * circumstances.
	 */
	gulong addOnTextInserted(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnTextInsertedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"text-inserted",
			cast(GCallback)&callBackTextInserted,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackTextInsertedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackTextInserted(VteTerminal* terminalStruct, OnTextInsertedDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackTextInsertedDestroy(OnTextInsertedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnTextModifiedDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onTextModifiedListeners ~= this;
		}

		void remove(OnTextModifiedDelegateWrapper source)
		{
			foreach(index, wrapper; onTextModifiedListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onTextModifiedListeners[index] = null;
					onTextModifiedListeners = std.algorithm.remove(onTextModifiedListeners, index);
					break;
				}
			}
		}
	}
	OnTextModifiedDelegateWrapper[] onTextModifiedListeners;

	/**
	 * An internal signal used for communication between the terminal and
	 * its accessibility peer. May not be emitted under certain
	 * circumstances.
	 */
	gulong addOnTextModified(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnTextModifiedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"text-modified",
			cast(GCallback)&callBackTextModified,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackTextModifiedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackTextModified(VteTerminal* terminalStruct, OnTextModifiedDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackTextModifiedDestroy(OnTextModifiedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnTextScrolledDelegateWrapper
	{
		void delegate(int, Terminal) dlg;
		gulong handlerId;

		this(void delegate(int, Terminal) dlg)
		{
			this.dlg = dlg;
			onTextScrolledListeners ~= this;
		}

		void remove(OnTextScrolledDelegateWrapper source)
		{
			foreach(index, wrapper; onTextScrolledListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onTextScrolledListeners[index] = null;
					onTextScrolledListeners = std.algorithm.remove(onTextScrolledListeners, index);
					break;
				}
			}
		}
	}
	OnTextScrolledDelegateWrapper[] onTextScrolledListeners;

	/**
	 * An internal signal used for communication between the terminal and
	 * its accessibility peer. May not be emitted under certain
	 * circumstances.
	 *
	 * Params:
	 *     delta = the number of lines scrolled
	 */
	gulong addOnTextScrolled(void delegate(int, Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnTextScrolledDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"text-scrolled",
			cast(GCallback)&callBackTextScrolled,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackTextScrolledDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackTextScrolled(VteTerminal* terminalStruct, int delta, OnTextScrolledDelegateWrapper wrapper)
	{
		wrapper.dlg(delta, wrapper.outer);
	}

	extern(C) static void callBackTextScrolledDestroy(OnTextScrolledDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnWindowTitleChangedDelegateWrapper
	{
		void delegate(Terminal) dlg;
		gulong handlerId;

		this(void delegate(Terminal) dlg)
		{
			this.dlg = dlg;
			onWindowTitleChangedListeners ~= this;
		}

		void remove(OnWindowTitleChangedDelegateWrapper source)
		{
			foreach(index, wrapper; onWindowTitleChangedListeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					onWindowTitleChangedListeners[index] = null;
					onWindowTitleChangedListeners = std.algorithm.remove(onWindowTitleChangedListeners, index);
					break;
				}
			}
		}
	}
	OnWindowTitleChangedDelegateWrapper[] onWindowTitleChangedListeners;

	/**
	 * Emitted when the terminal's %window_title field is modified.
	 */
	gulong addOnWindowTitleChanged(void delegate(Terminal) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnWindowTitleChangedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"window-title-changed",
			cast(GCallback)&callBackWindowTitleChanged,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackWindowTitleChangedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}

	extern(C) static void callBackWindowTitleChanged(VteTerminal* terminalStruct, OnWindowTitleChangedDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}

	extern(C) static void callBackWindowTitleChangedDestroy(OnWindowTitleChangedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	/**
	 * Gets the user's shell, or %NULL. In the latter case, the
	 * system default (usually "/bin/sh") should be used.
	 *
	 * Returns: a newly allocated string with the
	 *     user's shell, or %NULL
	 */
	public static string getUserShell()
	{
		auto retStr = vte_get_user_shell();

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}
}
