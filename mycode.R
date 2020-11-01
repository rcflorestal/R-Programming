# Getting Started and R Nuts and Bolts
myfunction <- function() {
  x <- rnorm(100)
  mean(x)
}

second <- function(x) {
  x + rnorm(length(x))
}

second(1)
second(2)

# R Console Input and Evaluation
x <- 1

msg <- "Hello"
# The hash symbol indicates a comment

x ## Auto-printing

print(x) ## Explicit printing

# The operator : is used to create a sequence
x <- 1:20  ## Creates a sequence of integers from 1 to 20

# When an R vector is printed you will notice that an index for the vector is 
# printed in square brackets [] on the side.
x

## Week 1 Quiz
## Question 10:
## Suppose I have a vector x <- c(17, 14, 4, 5, 13, 12, 10) and I want to set all 
## elements of this vector that are greater than 10 to be equal to 4. What R code 
## achieves this? Select all that apply.
x <- c(17, 14, 4, 5, 13, 12, 10)
x[x > 10] <- 4
x[x < 10] <- 4

## Question 11:
# Load Data Frame:
df <- read.csv('C:/Robson/home_office/r_john_hopkins/R-Programming/quiz1_data/hw1_data.csv')

# Question 12
# Extract the first 2 rows of the data frame
head(df,2)  

# Question 13
# Read the last rows of Data Frame
tail(df, 1)

# Question 14
# Extract the last 2 rows of the Data Frame
tail(df, 2)

# Question 15
# Read until 47th row
head(df, 47)

# Question 16
# Select and show missing values
summary(df)

# Question 17
# Mean of the Ozone column in the dataset exclude missing values 
df_Filter <- df[which(df$Ozone!=""),]

z <- mean(df_Filter$Ozone)

# Question 18
# Extract the subset of rows of the data frame where Ozone values are
# above 31 and Temp values are above 90. 
# What is the mean of Solar.R in this subset
df_Oz_Temp <- df [which(df$Ozone > 31 & df$Temp > 90),]
write.csv2(df_Oz_Temp, 'test.csv')
summary(df_Oz_Temp)

# Question 19
# What is the mean of "Temp" when "Month" is equal to 6? 
df_month6 <- df[which(df$Month==6),]
mean(df_month6$Temp)

# Question 20
# What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
