sig Man {shaves: set Man}

//abstract sig Person {shaves: set Man}

//sig Man, Woman extends Person {}

one sig Barber in Man {} //ändern auf lone oder some ergibt auch Lösungen

//one sig Barber in Person {}

fact {
   Barber.shaves = {m: Man | m not in m.shaves}
}

run { }
