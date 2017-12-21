/*
 * Copyright (c) 2013-2017, Nucleic Development Team.
 * Haxe Port Copyright (c) 2017 Jeremy Meltingtallow
 *
 * Distributed under the terms of the Modified BSD License.
 *  
 *  The full license is in the file COPYING.txt, distributed with this software.
*/

package jasper;

import jasper.Symbolics.Variable;
import jasper.Symbolics.Term;

class _Term_
{
    public var variable :Variable;
    public var coefficient :Float;

    /**
     *  [Description]
     *  @param variable - 
     *  @param coefficient - 
     */
    public function new(variable :Variable, coefficient :Float) : Void
    {
        this.variable = variable;
        this.coefficient = coefficient;
    }

    /**
     *  [Description]
     *  @param variable - 
     *  @return Term
     */
    public static inline function fromVariable(variable :Variable) : Term
    {
        return new Term(variable, 1.0);
    }

    /**
     *  [Description]
     *  @return Float
     */
    public function getValue() : Float
    {
        return coefficient * variable.value;
    }

    /**
     *  [Description]
     *  @return String
     */
    public function toString() : String
    {
        return "variable: (" + variable + ") coefficient: "  + coefficient;
    }
}


