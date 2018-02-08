/// @description 

if tsize != size
	size += (tsize - size) / 10

if size > tsize / 2 {
	isize += (tsize - isize) / 20
	if isize > tsize
		instance_destroy()
}
