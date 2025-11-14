sig Node {
    edges: set Node
}

fact "Connected graph" {
    some n: Node | n.*edges = Node
}

fact "No self edges" {
    no iden & edges
}

sig Ball {
    var loc: Node 
}

pred move[b: Ball, n: Node] {
  n in b.loc.edges
  no b": Ball | b".loc = n
  b.loc' = n
}

pred moved[b: Ball] {
  some n: Node | move[b, n]
}

pred unchanged[b: Ball] {
  b.loc = b.loc'
}

pred step {
  all b: Ball | moved[b] or unchanged[b]
}

pred spec {
  all disj b, b": Ball {
    b.loc != b".loc
  }
  always step
}

assert no_overlap {
  spec => always {
    no disj b, b": Ball | b.loc = b".loc
  }
}

check no_overlap for 5 but exactly 2 Ball
