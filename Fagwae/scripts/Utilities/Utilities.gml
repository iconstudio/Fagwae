/// @function bezier4(v1, v2, v3, v4, ratio)
function bezier4(x1, x2, x3, x4, t) {
	var Rv = 1 - t
	return power(Rv, 3) * argument0 + 3 * t * power(Rv, 2) * argument1 + 3 * power(t, 2) * Rv * argument2 + power(t, 3) * argument3
}


/// @description get_rotation_next(current, destination, increment)
/// @function get_rotation_next
/// @param current { real }
/// @param target { real }
/// @param addition { real }
function get_rotation_next(current, destination, increment) {
	while destination < 0
		destination += 360
	while 360 <= destination
		destination -= 360
	return clamp(-angle_difference(current, destination), -increment, increment)
}


/// https://eatchangmyeong.github.io/2021/04/29/how-i-made-honeyhouse.html
function contrast_ratio(lhs, rhs) {
	var
		l1 = relative_luminance(lhs),
		l2 = relative_luminance(rhs);
	return l1 > l2
		? (l1 + 0.05)/(l2 + 0.05)
		: (l2 + 0.05)/(l1 + 0.05);
}


function relative_luminance(color) {
	static f = function(x) {
		return x <= 0.03928
			? x/12.92
			: power((x + 0.055)/1.055, 2.4)
	}


	var
		r = colour_get_red(color)/255,
		g = colour_get_green(color)/255,
		b = colour_get_blue(color)/255

	return 0.2126*f(r) + 0.7152*f(g) + 0.0722*f(b)
}


/// @function trace
function trace() {
	var Count = argument_count
	if Count == 0 {
		exit
	} else if Count == 1 {
		show_debug_message(argument[0])
		exit
	}


	var Result = ""
	for (var i = 0; i < Count; ++i) {
		Result += string(argument[i])
	}

	show_debug_message(Result)
}


/// @function duet
function duet(condition, value_true, value_false) {
	return condition ? value_true : value_false
}


/// @function compare_equal(a, b)
function compare_equal(A, B) { return (A == B) }


/// @function compare_less(a, b)
function compare_less(A, B) { return (A < B) }


/// @function string_split(string, seperator)
function string_split(String, Seperator) {
	var count = 0, result = [], temp = String

	var position = string_pos(Seperator, String)
	while true {
		if position == 0
			break
 
		array_set(result, count, string_copy(temp, 1, position - 1))
		array_push(result, string_copy(temp, position + 1, string_length(temp) - position))
 
		position = string_pos(Seperator, result[++count])
		temp = result[count]
	}

	return result
}


globalvar ease;
ease = new (function() constructor {
	static c1 = 1.70158
	static c2 = c1 * 1.525
	static c3 = c1 + 1
	static c4 = 2 * pi / 3
	static c5 = 2 * pi / 4.5
	static n1 = 1 / 2.75
	static n2 = 2 / 2.75
	static n3 = 2.5 / 2.75
	static d1 = 1.5 / 2.75
	static d2 = 2.25 / 2.75
	static d3 = 2.625 / 2.75

	function linear(x) { return x; }

	/// sine
	function in_sine(x) { return 1 - cos(x * pi * 0.5); }
	function out_sine(x) { return sin(x * pi * 0.5); }
	function inout_sine(x) { return 0.5 - cos(x * pi) * 0.5; }

	// quad
	function in_quad(x) { return power(x, 2); };
	function out_quad(x) { return 1 - power(1 - x, 2); };
	function inout_quad(x) { return (x < 0.5) ? (2 * power(x,2)) : (1 - power(-2 * x + 2, 2) * 0.5); };

	// cubic
	function in_cubic(x) { return power(x, 3); };
	function out_cubic(x) { return 1 - power(1 - x, 3); };
	function inout_cubic(x) { return (x < 0.5) ? (4 * power(x,3)) : (1 - power(-2 * x + 2, 3) * 0.5); };

	// quart
	function in_quart(x) { return power(x, 4); };
	function out_quart(x) { return 1 - power(1 - x, 4); };
	function inout_quart(x) { return (x < 0.5)?(8 * power(x,4)):(1 - power(-2 * x + 2, 4) * 0.5); };

	// quint
	function in_quint(x) { return power(x, 5); };
	function out_quint(x) { return 1 - power(1 - x, 5); };
	function inout_quint(x) { return (x < 0.5)?(16 * power(x,5)):(1 - power(-2 * x + 2, 5) * 0.5); };

	// expo
	function in_expo(x) { return (x == 0)? 0 : (power(2, 10 * x - 10)); };
	function out_expo(x) { return (x == 1)? 1 : (1 - power(2, -10 * x)); };
	function inout_expo(x) { return (x == 0)? 0 :((x == 1)? 1 : ((x < 0.5)? (power(2, 20 * x - 10) * 0.5): (1 - power(2, -20 * x + 10) * 0.5))); };

	// circ
	function in_circ(x) { return 1 - sqrt(1 - power(x, 2)); };
	function out_circ(x) { return sqrt(1 - power(x - 1, 2)) };
	function inout_circ(x) { return (x < 0.5)?(0.5 - 0.5 * sqrt(1 - power(2 * x, 2))):(sqrt(1 - power(-2 * x + 2, 2)) * 0.5 + 0.5); };

	// back
	function in_back(x) { return c3 * power(x, 3) - c1 * power(x, 2) };
	function out_back(x) { return 1 + c3 * power(x - 1, 3) + c1 * power(x - 1, 2); };
	function inout_back(x) { return (x < 0.5)? ((power(2 * x, 2) * ((c2 + 1) * 2 * x - c2)) * 0.5): ((power(2 * x - 2, 2) * ((c2 + 1) * (x * 2 - 2) + c2) + 2) * 0.5); };

	// elastic
	function in_elastic(x) { return (x == 0)? 0: ((x == 1)? 1: (-power(2, 10 * x - 10) * sin((x * 10 - 10.75) * c4))); };
	function out_elastic(x) { return (x == 0)? 0: ((x == 1)? 1: (power(2, -10 * x) * sin((x * 10 - 0.75) * c4) + 1)); };
	function inout_elastic(x) { return (x == 0)? 0: ((x == 1)? 1: ((x < 0.5)? (-0.5 * power(2, 20 * x - 10) * sin((20 * x - 11.125) * c5)): (1 + 0.5 * power(2, -20 * x + 10) * sin((20 * x - 11.125) * c5)))) };

	// bounce
	function in_bounce(x) { return 1 - out_bounce(1 - x); }
	function out_bounce(x) {
		if (x < n1) {
			return 7.5625 * power(x, 2);
		} else if (x < n2) {
			x -= d1;
			return 7.5625 * power(x, 2) + 0.75;
		} else if (x < n3) {
			x -= d2;
			return 7.5625 * power(x, 2) + 0.9375;
		} else {
			x -= d3;
			return 7.5625 * power(x, 2) + 0.984375;
		}
	}
	function inout_bounce(x) { return (x < 0.5)? (0.5 - out_bounce(1 - 2 * x) * 0.5): (0.5 + out_bounce(2 * x - 1) * 0.5) }
})()


/// @returm Copy of the given struct/array, including a copy of any nested structs and arrays
/// 
/// This function is designed to copy simple tree-like structures that have been imported from 
/// 
/// @param struct/array   The struct/array to be copied
/// 
/// @jujuadams 2021-02-14 : https://github.com/JujuAdams/SNAP
function snap_deep_copy(_value) {
    return (new __snap_deep_copy(_value)).copy;
}


/// @function 
function __snap_deep_copy(_value) constructor
{
    source = _value;
    copy = undefined;
    
    
    static copy_struct = function(_source)
    {
        var _copy = {};
        
        var _names = variable_struct_get_names(_source);
        var _i = 0;
        repeat(array_length(_names))
        {
            var _name = _names[_i];
            var _value = variable_struct_get(_source, _name);
            
            if (is_struct(_value))
            {
                _value = copy_struct(_value);
            }
            else if (is_array(_value))
            {
                _value = copy_array(_value);
            }
            else if (is_method(_value))
            {
                var _self = method_get_self(_value);
                if (_self == _source)
                {
                    //If this method is bound to the source struct, create a new method bound to the new struct
                    _value = method(_copy, method_get_index(_value));
                }
                else if (_self != undefined)
                {
                    //If the scope of the method isn't <undefined> (global) then spit out a warning
                    show_debug_message("snap_deep_copy(): Warning! Deep copy found a method reference that could not be appropriately handled");
                }
            }
            
            variable_struct_set(_copy, _name, _value);
            
            ++_i;
        }
        
        return _copy;
    };
    
    
    
    static copy_array = function(_source)
    {
        var _length = array_length(_source);
        var _copy = array_create(_length,);
        
        var _i = 0;
        repeat(_length)
        {
            var _value = _source[_i];
            
            if (is_struct(_value))
            {
                _value = copy_struct(_value);
            }
            else if (is_array(_value))
            {
                _value = copy_array(_value);
            }
            
            _copy[@ _i] = _value;
            
            ++_i;
        }
        
        return _copy;
    };
    
    
    
    if (is_struct(source))
    {
        copy = copy_struct(source);
    }
    else if (is_array(source))
    {
        copy = copy_array(source);
    }
    else
    {
        copy = source;
    }
}
