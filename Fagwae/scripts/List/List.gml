/// @function iterator_destroy(iterator)
function iterator_destroy(Target_iterator) { Target_iterator._Data = 0; delete Target_iterator }


/// @function container_destroy(container)
function container_destroy(Container) { Container._Data = 0; delete Container }


/// @function Iterator(container)
function Iterator(Parent) constructor {
	/// @function equals_to(other)
	static equals_to = function(Other) { return (_Serial_number == Other._Serial_number
		and _Container == Other._Container and _Index == Other._Index) }

	/// @function not_equals_to(other)
	static not_equals_to = function(Other) { return (_Serial_number != Other._Serial_number
		or _Container != Other._Container or _Index != Other._Index) }

	/// @function vailidate()
	static vailidate = function() { return (_Serial_number == _Container._Serial_number) }

	/// @function set(value)
	static set = function(Value) {
		if vailidate() {
			_Container._Data[_Index] = Value
		}
		_Data[_Index] = Value
	}
	
	/// @function get()
	static get = function() {
		if vailidate()
			return _Container._Data[_Index]
		else
			return _Data[_Index]
	}

	/// @function set_index(index)
	static set_index = function(Index) { _Index = Index; return this }

	/// @function go_next()
	static go_next = function() {
		if _Index < _Size - 1
			_Index++
		return this
	}

	/// @function go_previous()
	static go_previous = function() {
		if 0 < _Index
			_Index--
		return this
	}

	_Container = weak_ref_create(Parent)
	_Size = 0
	var NewSize = Parent._Size
	if 0 < NewSize {
		_Data = array_create(NewSize)
		_Size = NewSize
		array_copy(_Data, 0, Parent._Data, 0, _Size)
	} else {
		_Data = undefined
	}
	_Index = 0
	_Serial_number = Parent._Serial_number
}


/// @function List
function List() constructor {
	/// @function raw_data()
	static raw_data = function() { return _Data }

	/// @function get_size()
	static get_size = function() { return _Size }

	/// @function get_capacity()
	static get_capacity = function() { return _Capacity }

	/// @function is_empty()
	static is_empty = function() { return (_Size == 0) }

	/// @function clear()
	static clear = function() { _Serial_change(); _Size = 0 }

	/// @function resize(size)
	static resize = function(Size) {
		if Size != _Size {
			if Size < _Size {  // reduce
				array_resize(_Data, Size)
			}
			_Capacity_ensure(Size)
			_Size = Size
		}
	}

	/// @function reserve(size)
	static reserve = function(Size) { if _Capacity < Size _Capacity_ensure(Size) }

	/// @function shrink_to_fit()
	static shrink_to_fit = function() { _Capacity_set(max(1, _Size)) }

	/// @function at(index)
	static at = function(Index) { return (0 < _Size and Index < _Size ? _Data[Index] : undefined) }

	/// @function front()
	static front = function() { return (0 < _Size ? _Data[0] : undefined) }

	/// @function back()
	static back = function() { return (0 < _Size ? _Data[_Size - 1] : undefined) }

	/// @function first()
	static first = function() { return (new Iterator(this)) }

	/// @function last()
	static last = function() { return (new Iterator(this).set_index(_Size)) }

	/// @function set_at(index, value)
	static set_at = function(Index, Value) {
		if Index < _Size {
			_Data[Index] = Value
		}
		return this
	}

	/// @function push_back(value)
	static push_back = function(Value) {
		if 1 < argument_count {
			_Capacity_append(argument_count)
			for (var i = 0; i < argument_count; ++i)
				_Element_add(argument[i])
		} else {
			_Element_add(Value)
		}
		return this
	}

	/// @function erase_at(index)
	static erase_at = function(Index) {
		if _Capacity <= 0 or _Size <= 0 or is_undefined(Index) or is_nan(Index)
			return undefined

		var Result = undefined, RIndex = 0
		if is_struct(Index)
			RIndex = Index._Index
		else
			RIndex = Index

		if RIndex < 0 or _Size <= RIndex
			return undefined
		Result = _Data[RIndex]
		_Size--
		_Serial_change()
		//for (var i = 0; i < _Size; ++i)
		//	_Data[i] = _Data[i]
		array_delete(_Data, RIndex, 1)
		array_push(_Data, undefined)
		return Result
	}

	/// @function erase(begin, end)
	static erase = function(First, Last) {
		if _Size <= 0
			return undefined

		var FirstIndex = (is_struct(First) ? First._Index : First)
		var LastIndex = (is_struct(Last) ? Last._Index : Last)
		_Check_range(FirstIndex, LastIndex)

		_Serial_change()
		var Count = LastIndex - FirstIndex
		_Size -= Count
		if 0 == _Size {
			_Data = 0 // deletes _Data
			_Data = []
			_Capacity = 1
			return undefined
		} else {
			array_delete(_Data, FirstIndex, Count)
			//repeat Count array_push(_Data, undefined)
			_Capacity -= Count
			return (new Iterator(this).set_index(FirstIndex))
		}
	}

	/// @function pop_front()
	static pop_front = function() {
		if 0 < _Size {
			return erase_at(0)
		} else {
			return undefined
		}
	}

	/// @function pop_back()
	static pop_back = function() {
		if 0 < _Size {
			_Serial_change()
			var Result = _Data[--_Size]
			return Result
		} else {
			return undefined
		}
	}

	/// @function all_of(begin, end, predicate)
	static all_of = function(First, Last, Pred) {
		return is_undefined(find_if_not(First, Last, Pred))
	}

	/// @function any_of(begin, end, predicate)
	static any_of = function(First, Last, Pred) {
		return !is_undefined(find_if(First, Last, Pred))
	}

	/// @function none_of(begin, end, predicate)
	static none_of = function(First, Last, Pred) {
		return is_undefined(find_if(First, Last, Pred))
	}

	/// @function foreach(begin, end, predicate)
	static foreach = function(First, Last, Pred) {
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)

		while First != Last {
			Pred(at(First))
			First++
		}
		return Pred
	}

	/// @function foreach_n(begin, count, predicate)
	static foreach_n = function(First, Number, Pred) {
		First = _Check_iterator(First)
		for (var i = 0; i < Number; ++i)
			Pred(at(First++))
		return First
	}

	/// @function foreach_all(predicate)
	static foreach_all = function(Pred) {
		return this.foreach(0, _Size, Pred)
	}

	/// @function enumerate(begin, end, predicate)
	static enumerate = function(First, Last, Pred) {
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)

		var i = 0
		while First != Last {
			Pred(i++, at(First))
			First++
		}
		return Pred
	}

	/// @function enumerate_all(predicate)
	static enumerate_all = function(Pred) {
		return this.enumerate(0, _Size, Pred)
	}

	/// @function sort(begin, end, [comparator=compare_less])
	static sort = function(First, Last) {
		if _Size <= 0
			exit

		var FirstIndex = _Check_iterator(First)
		var LastIndex = _Check_iterator(Last)
		_Check_range(FirstIndex, LastIndex)

		var Comparator = (2 < argument_count ? argument[2] : compare_less)
		var Range = LastIndex - FirstIndex
		if Range == 1 {
			exit
		} else {
			var Temp = array_create(Range)
			array_copy(Temp, 0, _Data, FirstIndex, Range)
			array_sort(Temp, Comparator)
			array_copy(_Data, FirstIndex, Temp, 0, Range)
			Temp = 0
		}
	}

	/// @function find(begin, end, value, [comparator=compare_equal])
	static find = function(First, Last, Value) {
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)

		var Compare
		if 3 < argument_count
			Compare = argument[3]
		else
			Compare = compare_equal
		while First != Last {
			if Compare(at(First), Value)
				return First
			First++
		}
		return undefined
	}

	/// @function find_if(begin, end, predicate)
	static find_if = function(First, Last, Pred) {
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)

		while First != Last {
			if Pred(at(First))
				return First
			First++
		}
		return undefined
	}

	/// @function find_if_not(begin, end, predicate)
	static find_if_not = function(First, Last, Pred) {
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)

		while First != Last {
			if !Pred(at(First))
				return First
			First++
		}
		return undefined
	}

	/// @function count(begin, end, value)
	static count = function(First, Last, Value) {
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)

		var Result = 0
		while First != Last {
			if at(First) == Value
				Result++
			First++
		}
		return Result
	}

	/// @function count_if(begin, end, predicate)
	static count_if = function(First, Last, Pred) {
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)

		var Result = 0
		while First != Last {
			if Pred(at(First))
				Result++
			First++
		}
		return Result
	}

	/// @function accumulate(begin, end, init, predicate)
	static accumulate = function(First, Last, Init) {
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)

		var Pred
		if 2 < argument_count
			Pred = argument[3]
		else
			Pred = function(a, b) { return a + b }

		while First != Last {
	        Init = Pred(Init, at(First))
			First++
		}
		return Init
	}

	/// @function remove(begin, end, value)
	static remove = function(First, Last, Value) {
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)

		var Result = First
		while First != Last {
			if at(First) == Value
				erase_at(Result)
			else
				Result++
			First++
		}
		return Result
	}

	/// @function remove_if(begin, end, predicate)
	static remove_if = function(First, Last, Pred) {
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)

		var Result = First
		while First != Last {
			if Pred(at(First))
				erase_at(Result)
			else
				Result++
			First++
		}
		return Result
	}

	/// @function min_element(begin, end, [comparator=compare_less])
	static min_element = function(First, Last) {
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)
		if First == Last
			return Last

		var Compare, Result = First, Cursor = First + 1
		if 2 < argument_count
			Compare = argument[2]
		else
			Compare = compare_less

		while Cursor != Last {
			if Compare(at(Cursor), at(Result)) {
				Result = Cursor
			}
			Cursor++
		}
		return Result
	}

	/// @function max_element(begin, end, [comparator=compare_less])
	static max_element = function(First, Last) {
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)
		if First == Last
			return Last

		var Compare, Result = First, Cursor = First + 1
		if 2 < argument_count
			Compare = argument[2]
		else
			Compare = compare_less

		while Cursor != Last {
			if Compare(at(Result), at(Cursor)) {
				Result = Cursor
			}
			Cursor++
		}
		return Result
	}

	/// @function lower_bound(begin, end, value, [comparator=compare_less])
	static lower_bound = function(First, Last, Value) { // return the first and largest element which less than value.
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)

		var Compare
		if 3 < argument_count
			Compare = argument[3]
		else
			Compare = compare_less

		var It, Step, count = Last - First
		while 0 < count {
			Step = count * 0.5
			It = First + Step

			if Compare(at(It), Value) {
				It++

				First = It
				count -= Step + 1
			} else {
				count = Step
			}
		}
		return First
	}

	/// @function upper_bound(begin, end, value, [comparator=compare_less])
	static upper_bound = function(First, Last, Value) { // return a greater element to the value.
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)

		var Compare
		if 3 < argument_count
			Compare = argument[3]
		else
			Compare = compare_less

		var It, Step, count = Last - First
		while 0 < count {
			Step = count * 0.5
			It = First + Step

			if !Compare(Value, at(It)) {
				It++

				First = It
				count -= Step + 1
			} else {
				count = Step
			}
		}
		return First
	}

	/// @function binary_search(begin, end, value, [comparator=compare_less])
	static binary_search = function(First, Last, Value) {
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)

		var Compare
		if 3 < argument_count
			Compare = argument[3]
		else
			Compare = compare_less

		First = lower_bound(First, Last, Value, Compare)
		return bool(First != Last and !Compare(Value, at(First)))
	}

	/// @function swap(iterator_1, iterator_2)
	static swap = function(ItA, ItB) {
		ItA = _Check_iterator(ItA)
		ItB = _Check_iterator(ItB)
		var Temp = at(ItA)
		set_at(ItA, at(ItB))
		set_at(ItB, Temp)
	}

	/// @function shuffle(begin, end, [engine=irandom_range])
	static shuffle = function(First, Last) {
		First = _Check_iterator(First)
		Last = _Check_iterator(Last)
		_Check_range(First, Last)

		var Urng, Dist
		if 2 < argument_count
			Urng = argument[2]
		else
			Urng = irandom_range
		Dist = Last - First - 1
		if 0 < Dist {
			for (var i = Dist; 0 < i; --i) {
				swap(First + i, First + Urng(0, i))
			}
		}
	}

	/// @function toString()
	static toString = function() { return "List (" + string(_Serial_number) + ") - Size: " + string(_Size) + ", Cash: " + string(_Capacity) }

	/// @function 
	static _Check_iterator = function(Iter) { return (is_struct(Iter) ? Iter._Index : Iter) }

	/// @function 
	static _Check_range = function(First, Last) {
		if First < 0 or Last < 0 or _Size < First
			throw "An error occured when erasing on range(" + string(First) + ", " + string(Last) + ")\nOut of bound of " + string(_Size) + "."
		else
		if Last < First
			throw "An error occured when erasing on range(" + string(First) + ", " + string(Last) + ")\nFirst is greater then Last."
	}

	/// @function 
	static _Serial_change = function() { _Serial_number++ }

	/// @function 
	static _Capacity_set = function(Size) {
		if _Capacity != Size {
			array_resize(_Data, Size)
			if _Capacity < Size {
				for (var i = 0; i < Size - _Capacity; ++i)
					_Data[_Capacity + i] = undefined
			}
			_Capacity = Size
		}
	}

	/// @function 
	static _Capacity_ensure = function(StoreSize) { _Capacity_set(ceil(StoreSize / 4) * 4 + 8) }

	/// @function 
	static _Capacity_append = function(Count) {
		var NewCap = _Size + Count
		if _Capacity <= NewCap
			_Capacity_ensure(NewCap)
	}

	/// @function 
	static _Element_add = function(Value) {
		if _Capacity <= _Size
			_Capacity_ensure(_Size)
		_Data[_Size++] = Value
	}

	_STD = true
	_Serial_number = 0
	_Data = []
	_Capacity = 8
	_Size = 0

	// ** Contructor **
	if 0 < argument_count {
		if argument_count == 1 {
			var Item = argument[0]
			if is_array(Item) {
				// (*) Built-in Array
				_Size = array_length(Item)
				_Capacity_ensure(_Size)
				array_copy(_Data, 0, Item, 0, _Size)
			} else if !is_nan(Item) and ds_exists(Item, ds_type_list) {
				// (*) Built-in List
				_Size = ds_list_size(Item)
				_Capacity_ensure(_Size)
				for (var i = 0; i < _Size; ++i)
					set_at(i, Item[| i])
			} else if is_struct(Item) and variable_struct_exists(Item, "_STD") {
				// (*) Container
				_Capacity_ensure(Item.get_size())
				//assign(Item.first(), Item.last())
			} else {
				// (*) Arg
				_Capacity_ensure(1)
				set_at(0, Item)
			}
		} else {
			// (*) Iterator-Begin, Iterator-End
			if argument_count == 2 {
				if is_struct(argument[0]) and is_iterator(argument[0])
				and is_struct(argument[1]) and is_iterator(argument[1]) {
					//assign(argument[0], argument[1])
					exit
				}
			}
			// (*) Arg0, Arg1, ...
			_Capacity_ensure(argument_count)
			for (var i = 0; i < argument_count; ++i)
				set_at(i, argument[i])
		}
	}
}

/// @function SmartList()
function SmartList(): List() constructor {
	/// @function at(index)
	static at = function(Index) {
		if 0 < _Size and Index < _Size {
			var Picked = _Data[Index]
			if weak_ref_alive(Picked)
				return Picked.ref
		}
		return undefined
	}

	/// @function front()
	static front = function() { return at(0) }

	/// @function back()
	static back = function() { return at(_Size - 1) }

	/// @function set_at(index, value)
	static set_at = function(Index, Value) {
		if Index < _Size {
			if is_struct(Value) {
				if instanceof(Value) == "weakref"
					_Data[Index] = Value
				else
					_Data[Index] = weak_ref_create(Value)
			}
		}
		return this
	}

	/// @function push_back(value)
	static push_back = function(Value) {
		if 1 < argument_count {
			_Capacity_append(argument_count)
			for (var i = 0; i < argument_count; ++i)
				_Element_add(argument[i])
		} else {
			_Element_add(Value)
		}
		return this
	}

	/// @function erase_at(index)
	static erase_at = function(Index) {
		if _Capacity <= 0 or _Size <= 0 or is_undefined(Index) or is_nan(Index)
			return undefined

		var Result = undefined, RIndex = 0
		if is_struct(Index)
			RIndex = Index._Index
		else
			RIndex = Index

		if RIndex < 0 or _Size <= RIndex
			return undefined
		Result = at(RIndex)
		_Size--
		_Serial_change()

		array_delete(_Data, RIndex, 1)
		array_push(_Data, undefined)
		if weak_ref_alive(Result)
			return Result
		else
			return undefined
	}

	/// @function erase(begin, end)
	static erase = function(First, Last) {
		if _Size <= 0
			return undefined

		var FirstIndex = (is_struct(First) ? First._Index : First)
		var LastIndex = (is_struct(Last) ? Last._Index : Last)
		_Check_range(FirstIndex, LastIndex)

		_Serial_change()
		var Count = LastIndex - FirstIndex
		_Size -= Count
		if 0 == _Size {
			_Data = 0 // deletes _Data
			_Data = []
			_Capacity = 1
			return undefined
		} else {
			array_delete(_Data, FirstIndex, Count)
			//repeat Count array_push(_Data, undefined)
			_Capacity -= Count
			return (new Iterator(this).set_index(FirstIndex))
		}
	}

	/// @function pop_front()
	static pop_front = function() {
		if 0 < _Size {
			return erase_at(0)
		} else {
			return undefined
		}
	}

	/// @function pop_back()
	static pop_back = function() {
		if 0 < _Size {
			_Serial_change()
			var Result = at(_Size - 1)
			_Size--
			return Result
		} else {
			return undefined
		}
	}

	/// @function 
	static _Element_add = function(Value) {
		if is_struct(Value) {
			if _Capacity <= _Size
				_Capacity_ensure(_Size)
			if instanceof(Value) == "weakref"
				_Data[_Size] = Value
			else
				_Data[_Size] = weak_ref_create(Value)
			_Size++
		}
	}
}
