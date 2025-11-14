abstract sig Position {}

one sig Ping, Peng, Pong extends Position {}

one sig State {
	var loc: Position
}

pred move[from: State] {
	from.loc = Ping implies from.loc' = Peng
	from.loc = Peng implies from.loc' = Pong
	from.loc = Pong implies from.loc' = Ping
}

fact always_move {
	always move[State]
}

pred show {}
run show for 5..5 steps
