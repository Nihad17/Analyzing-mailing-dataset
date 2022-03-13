#Finding of max_clique size
max_clique = cliques(graph)
max_clique_val = 0
for (i in  max_clique)   {
  if (length(unlist(i)) > max_clique_val) {
    max_clique_val  =  length(unlist(i))
  }
}
