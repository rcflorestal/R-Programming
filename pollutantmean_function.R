# Function to calculate the mean of a pollutant (sulfate or nitrate) across a
# specified list of monitors. 

pollutantmean <- function(directory, pollutant, id = 1:332){
        ## Create a empty data frame
        df <- data.frame()
        ## Looping to read each file in the directory
        for(i in id){
                files <- read.csv(paste(directory, 
                                        "/", 
                                        sprintf("%03d", i), 
                                        ".csv", 
                                        sep =""
                                        ))
                ## Merge all files in a single data frame
                df <- rbind(df, files)
        }
        ## Returns the average of selected pollutant
        mn <- mean(df[[pollutant]], na.rm = TRUE)
        mn
}


# Call the function
pollutantmean("specdata", "sulfate", 1:10)      ## 4.064128
pollutantmean("specdata", "nitrate", 70:72)     ## 1.706047
pollutantmean("specdata", "nitrate", 23)        ## 1.280833
