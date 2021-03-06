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

## Creating Vectors
x <- c(0.5, 0.6)        ## numeric
x <- c(TRUE, FALSE)     ## logical
# TRUE and FALSE can be abbreviate to T and F
x <- c(T, F)            ## logical
x <- c("a", "b", "c")   ## character
x <- 9:29               ## integer
x <- c(1 + 0i, 2 + 4i)  ## complex

# Using the vector() function
x <- vector("numeric", length = 10)
x

# Mixing Objects
y <- c(1.7, "a")  ## character
y <- c(TRUE, 2)   ## numeric
y <- c("a", TRUE) ## character

# Explicit Coercion
x <- 0:6
class(x)

as.numeric(x)
class(x)

as.logical(x)
as.character(x)

x <- c("a", "b", "c")
as.numeric(x)
as.logical(x)

x <- c(0, 1, 2, 3, 4, 5, 6)
as.complex(x)

## Lists
x <- list(1, "a", TRUE, 1 + 4i)
x

## Matrices
m <- matrix(nrow = 2, ncol = 3)
m

dim(m)  ## Show the number of row and columns
attributes(m)

# Matrices are constructed column-wise, so entries can be thought of starting in the “upper left” corner
# and running down the columns.
m <- matrix(1:6, nrow = 2, ncol = 3)
m

# Matrices can be created by column-binding or row-binding with cbind() and rbind().
x <- 1:3
y <- 10:12

cbind(x, y)
rbind(x, y)


## Factors
# Factors are used to represent categorical data. Factors can be unordered or ordered.
# Factors are treated specially by modeling functions like lm() and glm()
# Using factors with labels is better than using integers because factors are self-describing; having
# a variable that has values “Male” and “Female” is better than a variable that has values 1 and 2.
# With the elements yes and no, then the base line level with be the first level that's encountered 
# and because no comes before yes in the alphabet then no will be the base line level and yes will be the second level. 
x <- factor(c("yes", "yes", "no", "yes", "no"))
x

table(x)

unclass(x)

# The order of the levels can be set using the levels argument to factor().
x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
x

## Missing Values
# Missing values are denoted by 'NA' or 'NaN' for undefined mathematical operations.
# is.na() is used to test objects if they are NA
# NA values have a class also, so there are integer NA, character NA, etc.
# 
x <- c(1, 2, NA, 10, 3)
is.na(x)

# is.nan() is used to test for NaN
is.nan(x)

x <- c(1, 2, NaN, NA, 4)
is.nan(x)

# A NaN value is also NA but the converse is not true
is.na(x)

# Data Frames
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x

# Show the number of rows
nrow(x)

# Show de number of columns
ncol(x)


## Names
# R objects can also have names, which is very useful for writing readable code 
# and self-describing

x <- 1:3
x
# show names of objects
names(x)

# Name the objects
names(x) <- c("foo", "bar", "norf")

names(x)
x

# List and Matrices can also have names
x <- list(a = 1, b = 2, c = 3)
x

m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m

## Reading Lines of a Text File
#  This might take time
#  From a compressed file

#con <- gzfile("file name")
#x <- readlines(con, 10)

# From a websit
con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
head(x)

## Subsetting
x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[2]
x[1:4]
x[x > "a"]
u <- x > "a"
u
x[u]


## 
x <- list(foo = 1:4, bar = 0.6)
x
x[1]
x[[1]]
x$bar

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x
x[c(1,3)]
x$baz

## Subsetting - Lists
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo"
x[[name]]  ## computed index for 'foo'
x$name     ## element ‘name’ doesn’t exist!
x$foo      ## element ‘foo’ does exist

# The [[ can take an integer sequence.
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[c(1, 3)]]
x[[1]][[3]]
x[[c(2, 1)]]

## Subsetting - Matrices
x<- matrix(1:6, 2,3)
x
x[1, 2] ## filters the object that is int he first row and second column
x[2, 1] ## filters the element that is in the second row and first column
x[1, ]  ## filters row 1

# By default, when a single element of a matrix is retrieved, it is returned as 
# a vector of length 1 rather than a 1 × 1 matrix. This behavior can be turned off 
# by setting drop = FALSE.
x[1, 2, drop = FALSE] 
x[1, , drop = FALSE] 

## Subsetting - Partial Matching
x <- list(aardvark = 1:5)
x$a
x[["a"]]              ## Filters exactly the object "a"
x[["a", exact = F]]   ## Filters object that have "a" in the name


## Removing NA Values
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
bad
x[!bad]

x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)  ## vector logical
good
x[good]
y[good]

airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6]

## Vectorized Operations
x <- 1:4; y <- 6:9
x; y
x + y
x > 2 
y == 8
x * y
x / y

x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x * y
x / y
x %*% y  ## true matrix multiplication
