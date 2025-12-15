sig Person {
  loves: set Person
}

one sig Me extends Person {}

pred my_baby[b: Person] {
	(all p: Person | b in p.loves) and (b.loves = Me)
}

// what Doris Day really meant:
//pred my_baby[b: Person] {
//	(all p: Person - b | b in p.loves) and (b.loves = Me)
//}

assert song {
	all p: Person | my_baby[p] implies p = Me
}

check song for 3
