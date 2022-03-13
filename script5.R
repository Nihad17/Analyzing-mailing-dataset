#make simplification, getting rid of multiple, loops, deleting all where degree is greater than 65
#deleting all empty
graph = simplify(graph, remove.multiple = T, remove.loops = T, edge.attr.comb = igraph_opt("f"))
graph = igraph::delete.vertices(graph = graph, which(igraph::degree(graph) > 65))
graph = igraph::delete.vertices(graph = graph, which(igraph::degree(graph) == 0))
