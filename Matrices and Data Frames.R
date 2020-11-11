#----------------------Matrices and Data Frames--------------------------------#
#                                                                              #
#                                                                              #
# In this lesson, we'll cover matrices and data frames. Both represent         #
# 'rectangular' data types, meaning that they are used to store tabular data,  #
# with rows and columns.                                                       #
#                                                                              #
# Let's create a vector containing the numbers 1 through 20 using the `:`      #  
# operator. Store the result in a variable called my_vector.                   #
#------------------------------------------------------------------------------#

my_vector <- 1:20
my_vector

length(my_vector)       ## Shoe the length of my_vector

# The dim() function tells us the 'dimensions' of an matrix object. What happens 
# if we do dim(my_vector)? Give it a try.
dim(my_vector)

## here we transform the vector into a matrix
my_matrix <- dim(my_vector) <- c(4, 5)

# Another way to see this is by calling the attributes()
attributes(my_vector)

# A more direct method of creating the same matrix uses the matrix() function.
my_matrix2 <- matrix(1:20, nrow = 4, ncol = 5)

# Let's confirm that my_matrix and my_matrix2 are actually identical
identical(my_matrix, my_matrix2)

# Now, imagine that the numbers in our table represent some measurements from a
# clinical experiment, where each row represents one patient and each column 
# represents one variable for which measurements were taken.
# We may want to label the rows, so that we know which numbers belong to each
# patient in the experiment. One way to do this is to add a column to the matrix, 
# which contains the names of all four people.
# Let's start by creating a character vector containing the names of our 
# patients -- Bill, Gina, Kelly, and Sean.
patients <- c("Bill", "Gina", "Kelly", "Sean")

# Now we'll use the cbind() function to 'combine columns'
cbind(patients, my_matrix)

# Something is fishy about our result! It appears that combining the character 
# vector with our matrix of numbers caused everything to be enclosed in double 
# quotes. This means we're left with a matrix of character strings, which is no 
# good.
#
# Matrices can only contain ONE class of data. Therefore, when we tried to 
# combine a character vector with a numeric matrix, R was forced to 'coerce' the 
# numbers to characters, hence the double quotes.
# This is called 'implicit coercion'
# We need to include the names of our patients in the table without destroying 
# the integrity of our numeric data. Try the following:
my_data <- data.frame(patients, my_matrix)
my_data

# Since we have six columns (including patient names), we'll need to first 
# create a vector containing one element for each column. Create a character 
# vector called cnames that contains the following values (in order):
# "patient", "age", "weight", "bp", "rating", "test".
cnames <- c("patient", "age", "weight", "bp", "rating", "test")

# Now, use the colnames() function to set the `colnames` attribute for our data 
# frame
colnames(my_data) <- cnames
my_data