sig ID { 
	s: one Student
}

sig Major { }

sig University { }

abstract sig Student {
	id: one ID,
	m: one Major,
	uni: one University,
	classmate: set Student
}

sig Undergraduate extends Student { }

sig Graduate extends Student { }

fact {
	all st: Student, i: st.id | i.s = st
}

fact classmates {
	no st: Student | st in st.classmate
	all disj st1, st2: Student | st1 in st2.classmate iff st1.m = st2.m and st1.uni = st2.uni
	no b: Undergraduate, g: Graduate | b in g.classmate
}

run {} for 5 but exactly 5 Student
