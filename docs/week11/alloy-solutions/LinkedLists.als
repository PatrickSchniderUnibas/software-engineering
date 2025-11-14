sig List {
	first : lone Node
}

sig Node {
	succ : lone Node
}

fact "no cycles" {
	all n : Node | not n in n.^succ
}

fact "all node in list" {
	all n : Node | some l : List | n in l.first.*succ
}

pred inList [ l: List, n: Node ] {
	n in l.first.*succ
}

run {} for 3 but exactly 3 Node 


