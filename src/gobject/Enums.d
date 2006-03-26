/*
 * This file is part of duit.
 *
 * duit is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * duit is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with duit; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
 
// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage

/*
 * Conversion parameters:
 * outPack = gobject
 * outFile = Enums
 * strct   = GEnumValue
 * realStrct=
 * clss    = Enums
 * interf  = 
 * template for:
 * extend  = 
 * implements:
 * prefixes:
 * 	- g_enum_
 * omit structs:
 * omit prefixes:
 * 	- g_flags_
 * omit code:
 * imports:
 * 	- glib.Str
 * structWrap:
 * local aliases:
 */

module gobject.Enums;

private import gobject.typedefs;

private import lib.gobject;

private import glib.Str;

/**
 * Description
 * The GLib type system provides fundamental types for enumeration and flags types. (Flags types
 * are like enumerations, but allow their values to be combined by bitwise or). A registered
 * enumeration or flags type associates a name and a nickname with each allowed value, and
 * the methods g_enum_get_value_by_name(), g_enum_get_value_by_nick(), g_flags_get_value_by_name()
 * and g_flags_get_value_by_nick() can look up values by their name or nickname.
 * When an enumeration or flags type is registered with the GLib type system, it can
 * be used as value type for object properties, using g_param_spec_enum() or
 * g_param_spec_flags().
 * GObject ships with a utility called glib-mkenums that can
 * construct suitable type registration functions from C enumeration definitions.
 */
public class Enums
{
	
	/** the main Gtk struct */
	protected GEnumValue* gEnumValue;
	
	
	public GEnumValue* getEnumsStruct()
	{
		return gEnumValue;
	}
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gEnumValue;
	}
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GEnumValue* gEnumValue)
	{
		this.gEnumValue = gEnumValue;
	}
	
	/**
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * Returns the GEnumValue for a value.
	 * enum_class:
	 * a GEnumClass
	 * value:
	 * the value to look up
	 * Returns:
	 * the GEnumValue for value, or NULL if value is not
	 * a member of the enumeration
	 */
	public static GEnumValue* getValue(GEnumClass* enumClass, int value)
	{
		// GEnumValue* g_enum_get_value (GEnumClass *enum_class,  gint value);
		return g_enum_get_value(enumClass, value);
	}
	
	/**
	 * Looks up a GEnumValue by name.
	 * enum_class:
	 * a GEnumClass
	 * name:
	 * the name to look up
	 * Returns:
	 * the GEnumValue with name name, or NULL if the enumeration doesn'
	 * t have a member with that name
	 */
	public static GEnumValue* getValueByName(GEnumClass* enumClass, char[] name)
	{
		// GEnumValue* g_enum_get_value_by_name (GEnumClass *enum_class,  const gchar *name);
		return g_enum_get_value_by_name(enumClass, Str.toStringz(name));
	}
	
	/**
	 * Looks up a GEnumValue by nickname.
	 * enum_class:
	 * a GEnumClass
	 * nick:
	 * the nickname to look up
	 * Returns:
	 * the GEnumValue with nickname nick, or NULL if the enumeration doesn'
	 * t have a member with that nickname
	 */
	public static GEnumValue* getValueByNick(GEnumClass* enumClass, char[] nick)
	{
		// GEnumValue* g_enum_get_value_by_nick (GEnumClass *enum_class,  const gchar *nick);
		return g_enum_get_value_by_nick(enumClass, Str.toStringz(nick));
	}
	
	
	
	
	/**
	 * Registers a new static enumeration type with the name name.
	 * It is normally more convenient to let glib-mkenums
	 * generate a my_enum_get_type() function from a usual C enumeration definition
	 * than to write one yourself using g_enum_register_static().
	 * name:
	 * A nul-terminated string used as the name of the new type.
	 * const_static_values:
	 * An array of GEnumValue structs for the possible
	 *  enumeration values. The array is terminated by a struct with all
	 *  members being 0.
	 * Returns:
	 * The new type identifier.
	 */
	public static GType registerStatic(char[] name, GEnumValue* _StaticValues)
	{
		// GType g_enum_register_static (const gchar *name,  const GEnumValue *const_static_values);
		return g_enum_register_static(Str.toStringz(name), _StaticValues);
	}
	
	
	/**
	 * This function is meant to be called from the complete_type_info() function
	 * of a GTypePlugin implementation, as in the following example:
	 * static void
	 * my_enum_complete_type_info (GTypePlugin *plugin,
	 *  GType g_type,
	 *  GTypeInfo *info,
	 *  GTypeValueTable *value_table)
	 * {
		 *  static const GEnumValue values[] = {
			 *  { MY_ENUM_FOO, "MY_ENUM_FOO", "foo" },
			 *  { MY_ENUM_BAR, "MY_ENUM_BAR", "bar" },
		 *  { 0, NULL, NULL }
	 *  };
	 *  g_enum_complete_type_info (type, info, values);
 * }
 * g_enum_type:
 * the type identifier of the type being completed
 * info:
 * the GTypeInfo struct to be filled in
 * const_values:
 * An array of GEnumValue structs for the possible
 *  enumeration values. The array is terminated by a struct with all
 *  members being 0.
 */
public static void completeTypeInfo(GType type, GTypeInfo* info, GEnumValue* _Values)
{
	// void g_enum_complete_type_info (GType g_enum_type,  GTypeInfo *info,  const GEnumValue *const_values);
	g_enum_complete_type_info(type, info, _Values);
}

}