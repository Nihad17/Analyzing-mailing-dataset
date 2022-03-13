#creating all needed lists
counter = 1
final_data_from = vector(mode="list", length = 0)
final_data_to = vector(mode="list", length = 0)
final_data_subject = vector(mode="list", length = 0)
#running through all files
for (i in data) {
  found1 = FALSE
  found2 = FALSE
  found3 = FALSE
  from_temp = ""
  
  #running through all string in the file
  for (j in i) {
    tempString = toString(j)
    lengthString = nchar(toString(tempString))
    #trying to find From where only email is included
    isXFrom = grepl(pattern = "From: ", x = tempString) && grepl(pattern = "@", x = tempString) && !grepl(pattern = "X-From:|1:|2:|3:|4:|5:|6:|7:|8:|9:|0:|mailto:|<|>", x = tempString) && lengthString < 70
    
    if (isXFrom) {
      #if found set flag to true and retrieve mail
      found1 = TRUE
      from_temp = substr(x = j, start = 7, stop = lengthString)
      final_data_from[counter] = from_temp
    }
    
    #trying to find To list
    isXTo = grepl(pattern = "To:", x = tempString) && !grepl(pattern = "-To:|<|>", x = tempString)
    
    if (isXTo) {
      #if found set flag to true and retrieve mails
      found2 = TRUE
      final_data_to[counter] = substr(x = j, start = 5, stop = lengthString)
    }
    
    isXSubject = grepl(pattern = "Subject:", x = tempString)
    
    if (isXSubject) {
      #if found set flag to true and retrieve subjects
      found3 = TRUE
      final_data_subject[counter] = substr(x = j, start = 10, stop = lengthString)
      if (!grepl(pattern = "conference", x = final_data_subject[counter], ignore.case = T)) {
        found3 = F
      }
    }
    
    #if all 3 found just skip the rest of the text
    if (found1 && found2 && found3) {
      break;
    }
  }
  
  #if some of them not found do not add to the list
  if (!found1 || !found2 || !found3) {
    counter = counter - 1
  }
  else {
    #check if there exist mail with the same From param and add them together
    counter2 = 1;
    for (j in final_data_from) {
      if (j == from_temp && counter2 != counter) {
        #if found append To and Subject to that element
        final_data_to[counter2] =  paste(final_data_to[counter2], paste(", ", final_data_to[counter]))
        final_data_subject[counter2] =  paste(final_data_subject[counter2], paste(" $$ ", final_data_subject[counter]))
        counter = counter - 1
        break
      }
      counter2 = counter2 + 1
    }
  }
  
  counter = counter + 1
}



counter = 1
counter2 = 1

from = vector(mode = "list", length = 0)
to = vector(mode = "list", length = 0)
subject = vector(mode = "list", length = 0)

#creating pairs of from to elements
for (i in final_data_from) {
  for (j in strsplit(final_data_to[[counter]], split = ", ")[[1]]) {
    from_vec = c(final_data_from[[counter]])
    subject_vec = c(final_data_subject[[counter]])
    
    from[counter2] = from_vec
    to[counter2] = j
    subject[counter2] = subject_vec
    counter2 = counter2 + 1
  }
  counter = counter + 1
}

from = unlist(from)
to = unlist(to)
subject = unlist(subject)

