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
