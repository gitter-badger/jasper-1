/*
 * Copyright (c) 2017 Jeremy Meltingtallow
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

// FILE: EDU.Washington.grad.gjb.cassowary
// package EDU.Washington.grad.gjb.cassowary;

package jasper;

import jasper.Hashable;
import jasper.Stringable;

class HashSet<T :(Hashable,Stringable)> implements Stringable
{
	/**
	 *  [Description]
	 */
	public function new() : Void
	{
		_map = new Map<T, T>();
		_length = 0;
	}

	/**
	 *  [Description]
	 *  @param key - 
	 *  @return T
	 */
	public function get(key :T) : T
	{
		return _map.get(key);
	}

	/**
	 *  [Description]
	 *  @param value - 
	 */
	public function add(value :T) : Void
	{
		if(!_map.exists(value)) ++_length;

		return _map.set(value, value);
	}

	/**
	 *  [Description]
	 *  @param value - 
	 *  @return Bool
	 */
	public function remove(value :T) : Bool
	{
		if(_map.exists(value)) --_length;

		return _map.remove(value);
	}

	/**
	 *  [Description]
	 *  @return Int
	 */
	public function size() : Int
	{
		return _length;
	}

	/**
	 *  [Description]
	 */
	public function clear() : Void
	{
		_map = new Map<T,T>();
	}

	/**
	 *  [Description]
	 *  @param fn - 
	 */
	public function each(fn : T -> Void) : Void
	{
		for(key in _map.keys()) {
			fn(key);
		}
	}

	/**
	 *  [Description]
	 *  @return String
	 */
	public function toString() :String
	{
		var answer = size() + " {";
		var first = true;

		each(function(e) {
			if (!first) {
				answer += ", ";
			} 
			else {
				first = false;
			}
			answer += e;
		});

		answer += "}\n";
		return answer;
	}  

	private var _map :Map<T, T>;
	private var _length :Int;
}