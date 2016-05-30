

titanic_original <- read.csv("titanic_original.csv", stringsAsFactors = FALSE, header = TRUE)

titanic_original$embarked <- str_replace(titanic_original$embarked, "^$", "S")

#indices of missing values in age
cc <- which(is.na(titanic_original$age)==TRUE)

# replace NAs with mean of age
titanic_original$age[cc] <- mean(titanic_original$age, na.rm = TRUE)

# replace blanks in boat with 'None'
zz <- which((titanic_original$boat == ""))
titanic_original$boat[zz] <- "None"

# create column has_cabin_numbert
titanic_original$has_cabin_number <- ifelse(titanic_original$cabin == "",0,1)

write.csv(titanic_original, "titanic_clean.csv")


