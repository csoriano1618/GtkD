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
 * outPack = glib
 * outFile = Cache
 * strct   = GCache
 * clss    = Cache
 * prefixes:
 * 	- g_cache_
 * omit structs:
 * omit prefixes:
 * omit code:
 * imports:
 * 	- glib.HashTable
 * structWrap:
 * 	- GHashTable* -> HashTable
 * local aliases:
 */

module glib.Cache;

private import glib.typedefs;

private import lib.glib;

private import glib.HashTable;
/**
 * Description
 * A GCache allows sharing of complex data structures, in order to save
 * system resources.
 * GTK+ uses caches for GtkStyles and GdkGCs. These consume a lot of
 * resources, so a GCache is used to see if a GtkStyle or GdkGC with the
 * required properties already exists. If it does, then the existing
 * object is used instead of creating a new one.
 * GCache uses keys and values.
 * A GCache key describes the properties of a particular resource.
 * A GCache value is the actual resource.
 */
public class Cache
{
	
	/** the main Gtk struct */
	protected GCache* gCache;
	
	
	public GCache* getCacheStruct()
	{
		return gCache;
	}
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gCache;
	}
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GCache* gCache)
	{
		this.gCache = gCache;
	}
	
	/**
	 */
	
	
	/**
	 * Creates a new GCache.
	 * value_new_func:
	 * a function to create a new object given a key.
	 * This is called by g_cache_insert() if an object with the given key
	 * does not already exist.
	 * value_destroy_func:
	 * a function to destroy an object. It is
	 * called by g_cache_remove() when the object is no longer needed (i.e. its
	 * reference count drops to 0).
	 * key_dup_func:
	 * a function to copy a key. It is called by
	 * g_cache_insert() if the key does not already exist in the GCache.
	 * key_destroy_func:
	 * a function to destroy a key. It is
	 * called by g_cache_remove() when the object is no longer needed (i.e. its
	 * reference count drops to 0).
	 * hash_key_func:
	 * a function to create a hash value from a key.
	 * hash_value_func:
	 * a function to create a hash value from a value.
	 * key_equal_func:
	 * a function to compare two keys. It should return TRUE if
	 * the two keys are equivalent.
	 * Returns:
	 * a new GCache.
	 */
	public this (GCacheNewFunc valueNewFunc, GCacheDestroyFunc valueDestroyFunc, GCacheDupFunc keyDupFunc, GCacheDestroyFunc keyDestroyFunc, GHashFunc hashKeyFunc, GHashFunc hashValueFunc, GEqualFunc keyEqualFunc)
	{
		// GCache* g_cache_new (GCacheNewFunc value_new_func,  GCacheDestroyFunc value_destroy_func,  GCacheDupFunc key_dup_func,  GCacheDestroyFunc key_destroy_func,  GHashFunc hash_key_func,  GHashFunc hash_value_func,  GEqualFunc key_equal_func);
		this(cast(GCache*)g_cache_new(valueNewFunc, valueDestroyFunc, keyDupFunc, keyDestroyFunc, hashKeyFunc, hashValueFunc, keyEqualFunc) );
	}
	
	/**
	 * Gets the value corresponding to the given key, creating it if necessary.
	 * It first checks if the value already exists in the GCache, by using
	 * the key_equal_func function passed to g_cache_new().
	 * If it does already exist it is returned, and its reference count is increased
	 * by one.
	 * If the value does not currently exist, if is created by calling the
	 * value_new_func. The key is duplicated by calling
	 * key_dup_func and the duplicated key and value are inserted
	 * into the GCache.
	 * cache:
	 * a GCache.
	 * key:
	 * a key describing a GCache object.
	 * Returns:
	 * a pointer to a GCache value.
	 */
	public void* insert(void* key)
	{
		// gpointer g_cache_insert (GCache *cache,  gpointer key);
		return g_cache_insert(gCache, key);
	}
	
	/**
	 * Decreases the reference count of the given value.
	 * If it drops to 0 then the value and its corresponding key are destroyed,
	 * using the value_destroy_func and key_destroy_func passed to g_cache_new().
	 * cache:
	 * a GCache.
	 * value:
	 * the value to remove.
	 */
	public void remove(void* value)
	{
		// void g_cache_remove (GCache *cache,  gconstpointer value);
		g_cache_remove(gCache, value);
	}
	
	/**
	 * Frees the memory allocated for the GCache.
	 * Note that it does not destroy the keys and values which were contained in the
	 * GCache.
	 * cache:
	 * a GCache.
	 */
	public void destroy()
	{
		// void g_cache_destroy (GCache *cache);
		g_cache_destroy(gCache);
	}
	
	/**
	 * Calls the given function for each of the keys in the GCache.
	 * Note
	 * func is passed three parameters, the value and key of a
	 * cache entry and the user_data. The order of value and key is different
	 * from the order in which g_hash_table_foreach() passes key-value pairs
	 * to its callback function !
	 * cache:
	 * a GCache.
	 * func:
	 * the function to call with each GCache key.
	 * user_data:
	 * user data to pass to the function.
	 */
	public void keyForeach(GHFunc func, void* userData)
	{
		// void g_cache_key_foreach (GCache *cache,  GHFunc func,  gpointer user_data);
		g_cache_key_foreach(gCache, func, userData);
	}
	
	/**
	 * Warning
	 * g_cache_value_foreach has been deprecated since version 2.10 and should not be used in newly-written code. The reason is that it passes pointers to internal data
	 * structures to func; use g_cache_key_foreach() instead
	 * Calls the given function for each of the values in the GCache.
	 * cache:
	 * a GCache.
	 * func:
	 * the function to call with each GCache value.
	 * user_data:
	 * user data to pass to the function.
	 */
	public void valueForeach(GHFunc func, void* userData)
	{
		// void g_cache_value_foreach (GCache *cache,  GHFunc func,  gpointer user_data);
		g_cache_value_foreach(gCache, func, userData);
	}
	
	
	
}
