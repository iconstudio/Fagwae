/// @description find_hierachy(id)
/// @function find_hierachy
/// @param id { instance }
with argument0 {
	if !instance_exists(parent)
		return id
	else
		return find_hierachy(parent)
}
