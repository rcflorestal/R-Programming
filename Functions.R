#----------------------------Functions-----------------------------------------#
add2 <- function(x, y){
        x + y
}
add2(5, 3)


# Function to take a vector of numbers and return a subset that is greater than
# ten 
above10 <- function(x){
        use <- x > 10
        x[use]
}


x <- 1:15       # create a vector x
above10(x)      # Call function

# Function to take a vector of numbers and return a subset that is greater than
# a certain value
above <- function(x, n = 10){
        use <- x > n
        x[use]
}


x <- 1:20       # create a vector x
above(x, 10)    # Call function


# Function to take a matrix or a data frame and return the mean of each column
columnMean <- function(y){
        nc <- ncol(y)
        means <- numeric(nc)
        for(i in 1:nc){
                means[i] <- mean(y[, i], na.rm = T)
        }
        means
}

# Call the columnMean Function:
columnMean(airquality)
