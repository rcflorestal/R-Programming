x <- Sys.time()
x

unclass(x)

p <- as.POSIXlt(x)
p$sec
p$min
p$hou


# Strptime function in case your dates are written in a different format

datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
class(x)

x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")

x <- as.POSIXlt(x)
x-y

x <- as.Date("2012-03-01") 
y <- as.Date("2012-02-28")
x-y

x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x
