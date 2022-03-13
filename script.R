#creating the list of the variables
lst = vector(mode = "list", length = 0)
counter = 1

#reading all folder and remember their names
for (i in list.dirs(path = "D:/Desktop/data")) {
  for (j in list.dirs(full.names = T, path = i)) {
    lst[counter] = j
    counter = counter + 1
  }
  
}
  
lst = lst[!is.null(lst)]

#creating list of files with full path
fls = vector(mode = "list", length = 0)
counter = 1

#retrieving all paths
for (i in lst) {
  for (j in list.files(full.names = TRUE, path = i, recursive = T)) {
    fls[counter] = j
    counter = counter + 1
  }
}

#getting random 12000 files instead of 10 since after deleting bad ones it still should have 10000
fls = fls[!is.null(fls)]
fls = sample(fls, 12000)