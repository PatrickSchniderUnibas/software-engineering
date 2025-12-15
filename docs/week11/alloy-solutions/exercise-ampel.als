open util/boolean

abstract sig Color {}

one sig Red, Yellow, Green extends Color {}

some sig Ampel {
	var state: set Color,
	var shown: Bool
}

fact start_at_red {
	all a: Ampel | a.state = Red
	all a: Ampel | a.shown = False
}

pred switch[a: Ampel] {
	a.state = Red implies (a.state' = Red + Yellow and a.shown' = a.shown)
	a.state = Red + Yellow implies (a.state' = Green and a.shown' = True)
	a.state = Green implies (a.state' = Yellow and a.shown' = a.shown)
	a.state = Yellow implies (a.state' = Red and a.shown' = a.shown)
}

pred stay[a: Ampel] {
	a.state' = a.state
	a.shown' = a.shown
}

fact either_switch_or_stay {
	all a: Ampel | always (switch[a] or stay[a])
}

fact only_one_not_red {
	always lone a: Ampel | a.state != Red
}

fact green_at_some_point {
	eventually all a: Ampel | a.shown = True
}

run {} for 2..20 steps, exactly 5 Ampel
