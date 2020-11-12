#------------------------------------------------------------------------------# 
# Function that takes a directory of data files and a threshold for complete   #
# cases and calculates the correlation between sulfate and nitrate for monitor #
# locations where the number of completely observed cases (on all variables)   #
# is greater than the threshold.                                               #
# The function should return a vector of correlations for the monitors that    #
# meet the threshold requirement.                                              #
# If no monitors meet the threshold requirement then the function should return#
# a numeric vector of length 0.                                                # 
#------------------------------------------------------------------------------#

corr <- function(directory, threshold = 0){
        ## Creates a list from all files in the directory
        lf <- list.files(directory, full.names = TRUE)
        ## Creates a empty vector
        res <- vector(mode = "numeric", length = 0)
        ## Looping to read each file in the list of files and creates a data
        ## frame without NA values
        for(i in seq(lf)){
                df <- read.csv(lf[i])
                df2 <- complete.cases(df)
                df <- df[df2, ]
                ## Calculates correlations between sulfate and bitrate
                if(nrow(df) > threshold){
                        corre <- cor(df[["sulfate"]], df[["nitrate"]])
                        res <- append(res, corre)
                        
                }else{
                        return(c(0))
                }

        }
        res
}

cr <- corr("specdata", 150)
cr
head(cr)

# Question 8
cr <- corr("specdata") 
summary(cr)
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

# Question 9
cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

# Question 10
cr <- corr("specdata", 2000)  
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
