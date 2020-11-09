# Missing Values

# In R, NA (not available) is used to represent any value that is 'not available' 
# or 'missing'.
#
# Any operation involving NA generally yields NA as the result. To illustrate, 
# let's create a vector c(44, NA, 5, NA) and assign it to a variable x.
x <- c(44, NA, 5, NA)
x

x * 3
x

# To make things a little more interesting, lets create a vector containing 1000 
# draws from a standard normal distribution with y <- rnorm(1000).
y <- rnorm(1000)

# Next, let's create a vector containing 1000 NAs with z <- rep(NA, 1000).
z <- rep(NA, 1000)

# Finally, let's select 100 elements at random from these 2000 values 
# (combining y and z) such that we don't know how many NAs we'll wind up with or
# what positions they'll occupy in our final vector -- my_data <- sample(c(y, z), 100).
my_data <- sample(c(y, z), 100)
my_data

# Let's first ask the question of where our NAs are located in our data. The 
# is.na() function tells us whether each element of a vector is NA. Call is.na()
# on my_data and assign the result to my_na.
my_na <- is.na(my_data)
my_na

# Everywhere you see a TRUE, you know the corresponding element of my_data is NA. 
# Likewise, everywhere you see a FALSE, you know the corresponding element of 
# my_data is one of our random draws from the standard normal distribution.

# Now that we have a vector, my_na, that has a TRUE for every NA and FALSE for 
# every numeric value, we can compute the total number of NAs in our data.
#
# The trick is to recognize that underneath the surface, R represents TRUE as 
# the number 1 and FALSE as the number 0. Therefore, if we take the sum of a 
# bunch of TRUEs and FALSEs, we get the total number of TRUEs.
sum(my_na)

# Now that we know the NAs, let's look at a second type of missing value -- NaN,
# which stands for 'not a number'. To generate NaN, try dividing 
# (using a forward slash) 0 by 0 now, or Inf - Inf.
0 / 0
Inf - Inf
