/// @description d3d - Pops the top transformation from the stack and makes it the current one.
function draw_transform_stack_pop() {

	var m = matrix_stack_top()
	matrix_stack_pop()
	matrix_set(matrix_world, m)



}
