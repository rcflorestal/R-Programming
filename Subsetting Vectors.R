# Subsetting Vectors
#
# The way you tell R that you want to select some particular elements 
# (i.e. a 'subset') from a vector is by placing an 'index vector' in square
# brackets immediately following the name of the vector.
x <- c(0, 1, 3, 5, 5.5, 6.1, 7, 11, 15, 25, 55, NA, 100, NA, 1000)
x[1:10]

# Index vectors come in four different kinds:
        # LogicaL Vectors
        # Vector of Positive Integers
        # Vector of Negative Integers
        # Vector of Character Strings

# To see all the NA values in X vector, try:
x[is.na(x)]

# To see all the values that are not NA in x values and assign them to a new 
# variable called y, try:
y >- !x[is.na(x)]

# to see that we get all of the positive elements of y
y[x > 0]

# You might wonder why we didn't just start with x[x > 0] to isolate the
# positive elements of x. Try that now to see why.
x[x >0]

# Combining our knowledge of logical operators with our new knowledge of 
# subsetting, we could do this -- x[!is.na(x) & x > 0]. Try it out.
x[!is.na(x) & x > 0]

# subset the 3rd, 5th, and 7th elements of x
x[c(3, 5, 7)]

# What if we're interested in all elements of x EXCEPT the 2nd and 10th?
x[c(-2, -10)]

# A shorthand way of specifying multiple negative numbers is to put the negative 
# sign out in front of the vector of positive numbers.
x[-c(2, 10)]

# Create a numeric vector with three named elements using vect 
# <- c(foo = 11, bar = 2, norf = NA).
vect <- c(foo = 11, bar = 2, norf = NA)
vect ## When we print vect to the console, you'll see that each element has a name.

# We can also get the names of vect by passing vect as an argument to the 
# names() function
names(Vect)

# Alternatively, we can create an unnamed vector vect2 with c(11, 2, NA)
vect2 <- c(11, 2, NA)

# Then, we can add the `names` attribute to vect2
names(vect2) <- c("foo", "bar", "norf")


# Now, let's check that vect and vect2 are the same by passing them as arguments
identical(vect, vect2)

# Likewise, we can specify a vector of names
vect[c("foo", "bar")]

