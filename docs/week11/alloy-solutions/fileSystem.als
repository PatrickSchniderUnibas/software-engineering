sig FSObject {
	parent: lone Dir
}

sig Dir extends FSObject {
	contents: set FSObject
}

sig File extends FSObject {}

fact {
	all d: Dir, o: d.contents | o.parent = d
}

fact {
	File + Dir = FSObject
}

fact {
	no d: Dir | d in d.contents
}

one sig Root extends Dir {} {no parent}

//Wenn dieser Fact fehlt, ist der Graph nicht zwingend azyklisch
fact {
	FSObject in Root.*contents
}

fun file_number[d: Dir] : Int {
	#{o: d.contents | o in File}
}

assert acyclic {
	no d: Dir | d in d.^contents
}

check acyclic for 5

assert MaxNumber { all d: Dir | file_number[d] < 4}

check MaxNumber for 8
