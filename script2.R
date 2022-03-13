#reading all files and listing them
counter = 1
data = vector(mode = "list", length = 0)

for (i in fls) {
  data[counter] = read.delim(file = i, header = FALSE)
  counter = counter + 1
}