" Automatically closes tag if in htmldjango
fun! CloseDjango()
	return stridx(&ft, 'htmldjango') == -1 ? '' : ' /'
endf
