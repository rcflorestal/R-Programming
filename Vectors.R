# Vectors

# First, create a numeric vector num_vect that contains the values 0.5, 55, -10,
# and 6.
num_vect <- c(0.5, 55, -10, 6)

# Now, create a variable called tf that gets the result of num_vect < 1, which 
# is read as 'num_vect is less than 1'.
tf <- num_vect < 1
tf

# The statement num_vect < 1 is a condition and tf tells us whether each 
# corresponding element of our numeric vector num_vect satisfies this condition.

# Create a character vector that contains the following words: "My", "name", 
# "is". Remember to enclose each word in its own set of double quotes, so that R 
# knows they are character strings. Store the vector in a variable called my_char.
my_char <- c("My", "name", "is")

# Let's say we want to join the elements of my_char together into one continuous 
# character string (i.e. a character vector of length 1). We can do this using 
# the paste() function.
paste(my_char, collapse = " ")

# To add (or 'concatenate') your name to the end of my_char, use the c() function 
# like this: c(my_char, "your_name_here"). Place your name in double quotes where 
# I've put "your_name_here". Try it now, storing the result in a new variable 
# called my_name.
my_name <- c(my_char, "Robson Cruz")
my_name

# Now, use the paste() function once more to join the words in my_name together 
# into a single character string. Don't forget to say collapse = " "!
paste(my_name, collapse = " ")

# Enter paste("Hello", "world!", sep = " ") to join the two words "Hello" and 
# "world", separated by a single space. There should be a single space between 
# the double quotes in the `sep` argument to the paste() function.
paste("Hello", "world!", sep=" ")

# | For a slightly more complicated example, we can join two vectors, each of 
# length 3. Use paste() to join the integer vector 1:3 with the character vector
# c("X", "Y", "Z"). This time, use sep = "" to leave no space between the joined
# elements.
paste(1:3, c("X", "Y", "Z"), sep = "")

# What do you think will happen if our vectors are of different length?
# Vector recycling!
# Try paste(LETTERS, 1:4, sep = "-"), where LETTERS is a predefined variable in 
# R containing a character vector of all 26 letters in the English alphabet.
paste(LETTERS, 1:4, sep = "-")

# Since the character vector LETTERS is longer than the numeric vector 1:4, R 
# simply recycles, or repeats, 1:4 until it matches the length of LETTERS.

