# Workspace and Files
#
# In this lesson, you'll learn how to examine your local workspace in R and 
# begin to explore the relationship between your workspace and the file system 
# of your machine.
#
# Because different operating systems have different conventions with regards to 
# things like file paths, the outputs of these commands may vary across machines.
#
# However it's important to note that R provides a common API (a common set of 
# commands) for interacting with files, that way your code will work across
# different kinds of computers.
#
# Determine which directory your R session is using as its current working 
# directory using getwd().
getwd()

# List all the objects in your local workspace using ls().
ls()

# Some R commands are the same as their equivalents commands on Linux or on a 
# Mac. Both Linux and Mac operating systems are based on an operating system 
# called Unix. It's always a good idea to learn more about Unix!
# Assign 9 to x using x <- 9.
x <- 9

# Now take a look at objects that are in your workspace using ls().
ls()

# List all the files in your working directory using list.files() or dir().
list.files()

# Check out the help page for list.files with the command ?list.files.
?list.files

# Using the args() function on a function name is also a handy way to see what
# arguments a function can take.
args(list.files)

# Assign the value of the current working directory to a variable called "old.dir".
old.dir <- getwd()

# Use dir.create() to create a directory in the current working directory called 
# "testdir".
dir.create("testdir")

# Set your working directory to "testdir" with the setwd() command.
setwd("testdir")

# Create a file in your working directory called "mytest.R"
file.create("mytest.R")

# This should be the only file in this newly created directory. Let's check this 
# by listing all the files in the current directory.
list.files()

# Check to see if "mytest.R" exists in the working directory using.
file.exists("mytest.R")

# Access information about the file "mytest.R"
file.info("mytest.R")

# You can use the $ operator --- e.g., file.info("mytest.R")$mode --- to grab 
# specific items.

# Change the name of the file "mytest.R" to "mytest2.R" by using file.rename().
file.rename("mytest.R", "mytest2.R")

# Make a copy of "mytest2.R" called "mytest3.R" using file.copy().
file.copy("mytest2.R", "mytest3.R")

# Provide the relative path to the file "mytest3.R" by using file.path().

# You now have two files in the current directory. That may not seem very
# interesting. But what if you were working with dozens, or millions, of 
# individual files? In that case, being able to programatically act on many 
# files would be absolutely necessary. Don't forget that you can, temporarily, 
# leave the lesson by typing play() and then return by typing nxt().

# Provide the relative path to the file "mytest3.R" by using file.path().
file.path("mytest3.R")

# You can use file.path to construct file and directory paths that are 
# independent of the operating system your R code is running on. Pass 'folder1' 
# and 'folder2' as arguments to file.path to make a platform-independent pathname.
file.path("folder1", "folder2")

# Take a look at the documentation for dir.create by entering ?dir.create 
# Notice the 'recursive' argument. In order to create nested directories, 
# 'recursive' must be set to TRUE.
?dir.create

#  Create a directory in the current working directory called "testdir2" and a 
# subdirectory for it called "testdir3", all in one command by using 
# dir.create() and file.path().
dir.create(file.path("testdir2", "testdir3"), recursive = TRUE)

# Go back to your original working directory using setwd(). 
# (Recall that we created the variable old.dir with the full path for the orginal 
# working directory at the start of these questions.)
setwd(old.dir)

# After you finish this lesson delete the 'testdir' directory that you just 
# left (and everything in it)


