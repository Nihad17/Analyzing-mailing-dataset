#creating data frame from data
final_df = data.frame(FROM = from, TO = to, SUBJECT = subject, stringsAsFactors = F)
#write this data to csv
write.csv(final_df, "final.csv", row.names = F)
#retrieve them from file
final = read.csv("final.csv", col.names = c("FROM", "TO", "SUBJECT"))
#generate graph from it
graph = graph_from_data_frame(final)
