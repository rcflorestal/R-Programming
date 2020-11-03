# Connect to website
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"

# Start Download
download.file(dataset_url, "diet_data.zip")

# Decompress files
unzip("diet_data.zip", exdir = "diet_data")

# get a list of the files
list.files("diet_data")

# Look at one file to see what's inside
Andy <- read.csv("diet_data/Andy.csv")
head(Andy)

# To figure out how many rows there are
length(Andy$Day)

# To show the dimensions of the Data.frame
dim(Andy)

# Data Overview
str(Andy)

# Summary of data
summary(Andy)

# know the names of the variables
names(Andy)

# show the first row of the Andy data frame
Andy[1,]

# Show de first weight of the Andy data frame
Andy[1,"Weight"]

# To find his final weight on Day 30:
Andy[30,"Weight"]

# create a subset of the 'Weight' column where the data where 'Day' is equal to 30.
Andy[which(Andy$Day == 30), "Weight"]
# Other way:
Andy[which(Andy[,"Day"] == 30), "Weight"]
subset(Andy$Weight, Andy$Day==30)

# Andy's starting and ending weight to vectors:
andy_start <- Andy[1, "Weight"]
andy_start
andy_end <- Andy[30, "Weight"]
andy_end

# find out how much weight he lost by subtracting the vectors:
andy_loss <- andy_start - andy_end
andy_loss

# list all files in the directory
list.files()

# list files in a specific folder
files <- list.files("diet_data")
files

# calls a specific file by subsetting it:
files[2]
files[3:5]

# Let's take a quick look at John.csv:
files_full <- list.files("diet_data", full.names = T)

head(read.csv(files_full[3]))

# Let's merge the data frames Andy and David:
andy_david <- rbind(Andy, read.csv(files_full[2]))
head(andy_david)
tail(andy_david)

# let's create a subset of the data frame that shows us just the 25th day for Andy and David.
day_25 <- andy_david[which(andy_david$Day == 25), ]
day_25

# To understand what's happening in a loop:
for (i in 1:5) {
  print(i)
}

# To create a single data frame from multiple data frames:
dat <- data.frame()
for (i in 1:5) {
  dat <- rbind(dat, read.csv(files_full[i]))
}

str(dat)

for (i in 1:5) {
  dat2 <- data.frame()
  dat2 <- rbind(dat2, read.csv(files_full[i]))
}
str(dat2)
dat2

# To know the median of the weigth:
median(dat$Weight)
median(dat$Weight, na.rm = T)

# We can find the median weight of day 30 by taking the median of a subset of the data where Day=30
dat_30 <- dat[which(dat$Day == 30), ]
dat_30
median(dat_30$Weight)

# Let's build a function that will return the median weight of a given day
weightMedian <- function(directory, day) {
  files_list <- list.files(directory, full.names = T) # creates a list of files
  dat <- data.frame()
  for (i in 1:5) {
    #loops through the files, rbinding them together
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  dat_subset <- dat[which(dat[, "Day"] == day), ] # subsets the rows that match the 'day' argument
  median(dat_subset[, "Weight"], na.rm = T)       # identifies the median weight
                                                  # while stripping out the NAs
}

# Call the function
weightMedian(directory = "diet_data", day = 20)
weightMedian("diet_data", 4)


# Creates an output object of an appropriate size and then fill it up.
# First way
summary(files_full)
tmp <- vector(mode = "list", length = length(files_full))
summary(tmp)

for (i in seq_along(files_full)) {
  tmp[[i]] <- read.csv(files_full[[i]])
}
str(tmp)

# Another way
str(lapply(files_full, read.csv))

str(tmp[[5]])
head(tmp[[5]][,"Day"])

# We can use a function called `do.call()` to combine `tmp` into a single data frame. `do.call`
output <- do.call(rbind, tmp)
str(output)
