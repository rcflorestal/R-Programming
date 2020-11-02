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

