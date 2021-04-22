/// @function move(begin, end, output)
function move(First, Last, Output) {
	First = check_iterator(First)
	Output = check_iterator(Output)

	while First.not_equals(Last) {
		Output.set(First.get())

		First.go_next()
		Output.go_next()
	}
	erase(First, Last)
	return Output
}

/// @function fill(begin, end, value)
function fill(First, Last, Value) {
	First = check_iterator(First)

	while First.not_equals(Last) {
		First.set(Value)
		First.go_next()
	}
}

/// @function rotate(begin, middle, end)
function rotate(First, Middle, Last) {
	First = check_iterator(First)
	Middle = check_iterator(Middle)

	var Next = Middle // copied
	while First.equals(Next) {
		First.swap(Next)
		First.go_next()
		Next.go_next()

		if Next.equals(Last)
			Next = Middle
		else if First.equals(Middle)
			Middle = Next
	}
	return Middle
}

/// @function reverse(begin, end)
function reverse(First, Last) {
	First = check_iterator(First)

	while First.not_equals(Last) {
		Last.go_prev()
		if First.equals(Last)
			break
	  First.swap(Last)
	  First.go_next()
	}
}

/// @function transform(begin, end, output, unary_predicate)
function transform(First, Last, Output, Pred) {
	First = check_iterator(First)
	Output = check_iterator(Output)
	Pred = method(other, Pred)

	while First.not_equals(Last) {
		Output.set(Pred(First.get()))
		First.go_next()
		Output.go_next()
	}
	return Output
}

/// @function transform_binary(begin, end, another_begin, output, binary_predicate)
function transform_binary(First, Last, PairFirst, Output, Pred) {
	First = check_iterator(First)
	PairFirst = check_iterator(PairFirst)
	Output = check_iterator(Output)

	while First.not_equals(Last) {
		Output.set(Pred(First.get(), PairFirst.get()))
		First.go_next()
		PairFirst.go_next()
		Output.go_next()
	}
	return Output
}

/// @function unique(begin, end, [predicate=compare_equal])
/*
function unique(First, Last) {
	First = check_iterator(First)
	if First.equals(Last)
		return Last

	var Compare
	if 2 < argument_count
		Compare = argument[2]
	else
		Compare = compare_equal

	var It, Result = First.duplicate(), ResultValue = First.get()
	First.go_next()
	while First.not_equals(Last) {
		Result.go_next()
		if !Compare(ResultValue, First.get()) and Result.not_equals(First) {
			Result.set(First.get())
			It = First.duplicate()
			First.go_next()
			erase_iter(It)
		} else {
			First.go_next()
		}
		ResultValue = Result.get()
	}
    return Result.go_next()
}
*/

/// @function sort(begin, end, [comparator])
/// @description quick sort
function sort(First, Last) {
	First = check_iterator(First)
	Last = check_iterator(Last)
	if Last.index <= 1
		exit

	var Compare
	if 2 < argument_count
		Compare = argument[2]
	else
		Compare = compare_less
	var Pivot = First.duplicate(), Pivot_Next, Value = 0
	for (var It = First.make_next(); It.index < First.index + Last.index; It.go_next()) {
		Value = It.get()
		if Compare(Value, Pivot.get()) {
			Pivot_Next = Pivot.make_next()

			It.set(Pivot_Next.get())
			Pivot_Next.set(Pivot.get())
			Pivot.set(Value)

			Pivot.go_next()
		}
	}
	delete It

	sort(First, Pivot.duplicate().advance(-First.index), Compare)
	if Pivot.index < First.index + Last.index
		sort(Pivot.make_next().pure(), Last.advance(-Pivot.distance(First) - 1), Compare)
	delete Pivot
	delete Pivot_Next
	gc_collect()
}

/// @function stable_sort(begin, end, [comparator=compare_less])
/// @description selection sort
function stable_sort(First, Last) {
	First = check_iterator(First)

	var selection, Compare
	if 2 < argument_count
		Compare = argument[2]
	else
		Compare = compare_less
	while First.not_equals(Last) {
		selection = min_element(First, Last, Compare)
		selection.swap(First)
		First.go_next()
		delete selection
	}
	gc_collect()
}

/// @function insertion_sort(begin, end, [comparator=compare_less])
function insertion_sort(First, Last) {
	First = check_iterator(First).go_next()

	var Compare, It, Value
	if 2 < argument_count
		Compare = argument[2]
	else
		Compare = compare_less
	while First.not_equals(Last) {
		Value = First.get()
		for(It = First.previous(); 0 <= It.index and Compare(Value, It.get()); It.go_prev()) {
			It.make_next().set(It.get())
		}
		It.make_next().set(Value)

		First.go_next()
		delete It
	}
	gc_collect()
}

/// @function merge_sort(begin, end, [comparator=compare_less])
function merge_sort(First, Last) {
	First = check_iterator(First)
	Last = check_iterator(Last)
	var Dist = First.distance(Last)
	if Dist <= 1
		exit

	var Compare
	if 2 < argument_count
		Compare = argument[2]
	else
		Compare = compare_less
	var Middle = iterator_advance(First, Dist * 0.5)
	merge_sort(First, Middle, Compare)
	merge_sort(Middle, Last, Compare)
	inplace_merge(First, Middle, Last, Compare)
}

/// @function IMPLEMENTED FROM VS
/// @description sort median of three elements to middle
function sort_median(First, Middle, Last, Comparator) {
	if Comparator(Middle.get(), First.get())
		Middle.swap(First)

	if Comparator(Last.get(), Middle.get()) { // swap middle and last, then test first again
		Last.swap(Middle)

		if Comparator(Middle.get(), First.get())
			Middle.swap(First)
	}
}

/// @function IMPLEMENTED FROM VS
/// @description sort median element to middle
function predict_median(First, Middle, Last, Comparator) {
	First = check_iterator(First)
	Middle = check_iterator(Middle)

	var Distance = iterator_distance(First, Last)
	if 40 < Distance { // Tukey's ninther
		var Step = (Distance + 1) >> 3 // +1 can't overflow because range was made inclusive in caller
		var _Two_step = Step << 1 // note: intentionally discards low-order bit
		sort_median(First, First + Step, First + _Two_step, Comparator)
		sort_median(Middle - Step, Middle, Middle + Step, Comparator)
		sort_median(Last - _Two_step, Last - Step, Last, Comparator)
		sort_median(First + Step, Middle, Last - Step, Comparator)
	} else {
		sort_median(First, Middle, Last, Comparator)
	}
}

/// @function IMPLEMENTED FROM VS
/// @description partition [First, Last), using Comparator
function partition_by_median_guess(First, Last, Comparator) {
	First = check_iterator(First)
	Last = check_iterator(Last)

	var Middle = iterator_advance(First, (iterator_distance(First, Last) >> 1)) // shift for codegen (== * 0.5)
	predict_median(First, Middle, Last.previous(), Comparator)

	var _Pfirst = Middle.duplicate()
	var _Pbefore = _Pfirst.previous()
	var _Plast = _Pfirst.make_next()
	while First.index < _Pfirst.index && !Comparator(_Pbefore.get(), _Pfirst.get()) && !Comparator(_Pfirst.get(), _Pbefore.get()) {
		_Pfirst.go_prev()
		_Pbefore.go_prev()
	}
	delete _Pbefore

	while _Plast.index < Last.index && !Comparator(_Plast.get(), _Pfirst.get()) && !Comparator(_Pfirst.get(), _Plast.get()) {
		_Plast.go_next()
	}

	var _Gfirst = _Plast.duplicate()
	var _Glast = _Pfirst.duplicate()
	for (;;) { // partition
		for (; _Gfirst < Last; _Gfirst.go_next()) {
			if Comparator(_Pfirst.get(), _Gfirst.get()) {
			} else if Comparator(_Gfirst.get(), _Pfirst.get()) {
				break
			} else if _Plast.not_equals(_Gfirst) {
				swap(_Plast, _Gfirst)
				_Plast.go_next()
			} else {
				_Plast.go_next()
			}
		}

		var _Gfore
		for (; First.index < _Glast.index; _Glast.go_prev()) {
			_Gfore = _Glast.previous()
			if Comparator(_Gfore.get(), _Pfirst.get()) {
			} else if Comparator(_Pfirst.get(), _Gfore.get()) {
				break
			} else if _Pfirst.go_prev().not_equals(_Gfore) {
				swap(_Pfirst, _Gfore)
			}
			delete _Gfore
		}

		if _Glast.equals(First) and _Gfirst.equals(Last) {
			return [_Pfirst, _Plast]
		}

		if _Glast.equals(First) { // no room at bottom, rotate pivot upward
			if _Plast.not_equals(_Gfirst) {
				swap(_Pfirst, _Plast)
			}

			_Plast.go_next()
			_Pfirst.swap(_Gfirst)
			_Pfirst.go_next()
			_Gfirst.go_next()
		} else if _Gfirst.equals(Last) { // no room at top, rotate pivot downward
			if _Glast.go_prev().not_equals(_Pfirst.go_prev()) {
				swap(_Glast, _Pfirst)
			}

			swap(_Pfirst, _Plast.go_prev())
		} else {
			swap(_Gfirst, _Glast.go_prev())
			_Gfirst.go_next()
		}
	}
	delete _Pfirst
	delete _Plast
	delete _Gfirst
	delete _Glast
	gc_collect()
}

/// @function nth_element(begin, nth, end, [comparator=compare_less])
function nth_element(First, Nth, Last) {
	First = check_iterator(First)
	Nth = check_iterator(Nth)
	Last = check_iterator(Last)
	if First.equals(Last) or Nth.equals(Last)
		exit

	var Compare, Middle
	if 3 < argument_count
		Compare = argument[3]
	else
		Compare = compare_less
	while 32 < First.distance(Last) { // divide and conquer, ordering partition containing Nth
		Middle = partition_by_median_guess(First, Last, Compare)

		if Middle.index <= Nth.index {
			First = Middle
		} else if Middle.index <= Nth.index {
			exit
		} else {
			Last = Middle
		}
  }

  insertion_sort(First, Last, Compare)
}

/// @function is_sorted(begin, end, [comparator=compare_less])
function is_sorted(First, Last) {
	First = check_iterator(First)
	if First.equals(Last)
		return true

	var Compare
	if 2 < argument_count
		Compare = argument[2]
	else
		Compare = compare_less
	var Next = First.make_next()
	while Next.not_equals(Last) {
		if Compare(Next.get(), First.get()) {
			delete Next
			gc_collect()
		  return false
		}
		First.go_next()
		Next.go_next()
	}
	delete Next
	gc_collect()
	return true
}

/// @function unguarded_partition(begin, end, pivot, [comparator=compare_less])
function unguarded_partition(First, Last, Pivot) {
	First = check_iterator(First)
	Last = check_iterator(Last)

	var Compare
	if 3 < argument_count
		Compare = argument[3]
	else
		Compare = compare_less
	while true {
	  while Compare(First.get(), Pivot.get())
			First.go_next()

	  Last.go_prev()
	  while Compare(Pivot.get(), Last.get())
			Last.go_prev()

	  if !(First.index < Last.index)
			return First
	  First.swap(Last)
	  First.go_next()
	}
}

/// @function partition(begin, end, predicate)
function partition(First, Last, Pred) {
	First = check_iterator(First)
	Last = check_iterator(Last)
	Pred = method(other, Pred)

	while First.not_equals(Last) {
		var Value = First.get()
		while !is_undefined(Value) and Pred(Value) {
		  First.go_next()
		  if First.equals(Last)
				return First
			Value = First.get()
		}

		do {
		  Last.go_prev()
		  if First.equals(Last)
				return First
			Value = Last.get()
		} until !is_undefined(Value) and Pred(Value)

		First.swap(Last)
		First.go_next()
	}
	return First
}

/// @function is_partitioned(begin, end, predicate)
function is_partitioned(First, Last, Pred) {
	First = check_iterator(First)

	var Value = First.get()
	while First.not_equals(Last) and Pred(Value) {
		First.go_next()
		Value = First.get()
	}

	while First.not_equals(Last) {
		if Pred(Value)
			return false
		First.go_next()
		Value = First.get()
	}
	return true
}

/// @function merge(begin, end, other_begin, other_end, output, [comparator=compare_less])
function merge(First, Last, OtherFirst, OtherLast, Output) {
	First = check_iterator(First)
	Last = check_iterator(Last)
	OtherFirst = check_iterator(OtherFirst)
	OtherLast = check_iterator(OtherLast)

	var Compare, Src1_Val, Src2_Val
	if 5 < argument_count
		Compare = argument[5]
	else
		Compare = compare_less
	while true {
		if First.equals(Last)
			return copy(OtherFirst, OtherLast, Output)

		if OtherFirst.equals(OtherLast)
			return copy(First, Last, Output)

		Src1_Val = First.get()
		Src2_Val = OtherFirst.get()
		if Compare(Src2_Val, Src1_Val) {
			Output.set(Src2_Val)
			OtherFirst.go_next()
		} else {
			Output.set(Src1_Val)
			First.go_next()
		}

		Output.go_next()
	}
	return Output
}

/// @function inplace_merge(begin, middle, end, [comparator=compare_less])
function inplace_merge(First, Middle, Last) {
	First = check_iterator(First)
	Middle = check_iterator(Middle)
	Last = check_iterator(Last)

	var Compare
	if 3 < argument_count
		Compare = argument[2]
	else
		Compare = compare_less
	var Temp = duplicate()
	Temp.merge(First, Middle, Middle, Last, First, Compare)
	copy(Temp.first(), Temp.last(), First)
	delete Temp
}
