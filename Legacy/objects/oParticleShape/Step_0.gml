/// @description 

if tsize != size
	size += (tsize - size) * 0.1

if size > tsize * 0.5 {
	isize += (tsize - isize) * 0.05
	if isize > tsize
		instance_destroy()
}
