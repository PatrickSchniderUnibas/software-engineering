//Definiert Personen. Jede Person ist mit höchstens einer anderen Person verheiratet
sig Person {
	married: lone Person
}

//Schreibt vor, dass keine Person mit sich selbst verheiratet ist
fact "not married to yourself" {
	no p: Person | p.married = p
}

//Schreibt vor, dass verheiratete Personen gegenseitig verheiratet sind
fact "married to each other" {
	all p,q: Person | (p.married = q implies q.married = p)
}

//Gibt True zurück, wenn eine Person verheiratet ist
pred is_married[p: Person] {
	some q: Person | p.married = q
}

//Behauptung, die vom System geprüft werden kann
assert symmetry1 {
	all p: Person | p.married.married = p
}

//Überprüft die Behauptung und findet ein Gegenbeispiel
check symmetry1

//Behauptung, die vom System geprüft werden kann
assert symmetry2 {
	all p: Person | (p.married.married = p or not is_married[p])
}

//Überprüft die Behauptung und findet kein Gegenbeispiel
check symmetry2
