#V(graph)$name <- paste("y", 1:223, sep="")
V(graph)$size <- rep(5, gorder(graph))
components_all <- components(graph)
components_elems <- components_all$membership
colors <- sample(colors(T), components_all$no)

final_colors = c()

for (i in components_elems) {
  final_colors = append(final_colors, colors[i])
}

V(graph)$color <- final_colors
plot(graph, edge.arrow.size=.4, edge.curved=.1, vertext.size = 1 ,layout = layout_with_fr(graph), vertex.label=NA)