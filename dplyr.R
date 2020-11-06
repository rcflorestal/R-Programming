library(dplyr)

mydf <- read.csv(path2csv, stringsAsFactors = F)

# Use dim() to look at the dimensions of mydf.
dim(mydf)

head(mydf)

# The first step of working with data in dplyr is to load the data into what the
# package authors call a 'data frame tbl' or 'tbl_df'. Use the following code to 
# create a new tbl_df called cran:
cran <- tbl_df(mydf)

# To avoid confusion and keep things running smoothly, let's remove the original 
# data frame from your workspace with rm("mydf")
rm(mydf)

cran

# Select variables
select(cran, ip_id, package, country)

# select the same columns above in reverse order
select(cran, country:r_arch)

# to omit the time column:
select(cran, -time)

# to omit all columns from X through size.
select(cran, -(X:size))

# select a subset of rows 
filter(cran, package == "swirl")

filter(cran, r_version == "3.1.1", country == "US")

# return rows corresponding to users in "IN" (India) running an R version that 
# is less than or equal to "3.0.2"
filter(cran, r_version <= "3.0.2", country == "IN")

# rows for which the country variable equals either "US" or "IN".
filter(cran, country == "US" | country == "IN")


# Filter rows which size is strictly greater than 100500 and r_os is "linux-gnu".
filter(cran,size > 100500, r_os == "linux-gnu")

# Finally, we want to get only the rows for which the r_version is not missing
filter(cran, !is.na(r_version))

# Sometimes we want to order the rows of a dataset according to the values of a 
# particular variable
arrange(cran2, ip_id)   ## from small to large - ascending order
arrange(cran2, ip_id)   ## from large to small - descending order

# We can also arrange the data according to the values of multiple variables.
arrange(carn2, package, ip_id)


# Arrange cran2 by the following three variables, in this order: country 
# (ascending), r_version (descending), and ip_id (ascending).
arrange(cran2, country, desc(r_version), ip_id)

# We want to add a column called size_mb that contains the download size in 
# megabytes and gigabytes
mutate(cran3, size_mb = size / 2^20)
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)

# All of the values in cran3 are 1000 bytes less than they should be. Using 
# cran3, create just one new column called correct_size that contains the 
# correct size.
mutate(cran3, correct_size = size + 1000)

# The last of the five core dplyr verbs, summarize(), collapses the dataset to 
# a single row. Let's say we're interested in knowing the average download size. 
# summarize(cran, avg_bytes = mean(size)) will yield the mean value of the size 
# variable. Here we've chosen to label the result 'avg_bytes', but we could have 
# named it anything. Give it a try.
summarize(cran, avg_bytes = mean(size))

# The summarize() function is most powerful when applied to grouped data.
# The main idea behind grouping data is that you want to break up your dataset 
# into groups of rows based on the values of one or more variables.
# The group_by() function is reponsible for doing this.
#
# I've made the dataset available to you in a data frame called mydf. Put it in
# a 'data frame tbl' using the tbl_df() function and store the result in a
# object called cran. If you're not sure what I'm talking about, you should 
# start with the previous lesson. Otherwise, practice makes perfect!
cran <- tbl_df(mydf)

# To avoid confusion and keep things running smoothly, let's remove the original 
# dataframe from your workspace with rm("mydf").
rm("mydf")

# Group cran by the package variable and store the result in a new object called 
# by_package.
by_package <- group_by(cran, package)

# Let's take a look at by_package. Print it to the console.
by_package

# Call summarize() with two arguments: by_package and mean(size).
summarize(by_package, mean(size))

# Compute four values, in the following order, from
# the grouped data:
#
# 1. count = n()
# 2. unique = n_distinct(ip_id)
# 3. countries = n_distinct(country)
# 4. avg_bytes = mean(size)
#
# The 'count' column, created with n(), contains the total number of rows 
# (i.e. downloads) for each package. The 'unique' column, created with 
# n_distinct(ip_id), gives the total number of unique downloads for each 
# package, as measured by the number of distinct ip_id's. The 'countries' 
# column, created with n_distinct(country), provides the number of countries in 
# which each package was downloaded. And finally, the 'avg_bytes' column, 
# created with mean(size), contains the mean download size (in bytes) for each 
# package.

# Naturally, we'd like to know which packages were most popular on the day these
# data were collected (July 8, 2014). Let's start by isolating the top 1% of 
# packages, based on the total number of downloads as measured by the 'count' 
# column.
# We need to know the value of 'count' that splits the data into the top 1% and 
# bottom 99% of packages based on total downloads. In statistics,this is called 
# the 0.99, or 99%, sample quantile.
quantile(pack_sum$count, probs = 0.99)

# Now we can isolate only those packages which had more than 679 total downloads. 
# Use filter() to select all rows from pack_sum for which 'count' is strictly 
# greater (>) than 679. Store the result in a new object called top_counts.
top_counts <- filter(pack_sum, count > 679)

# There are only 61 packages in our top 1%, so we'd like to see all of them. 
# Since dplyr only shows us the first 10 rows, we can use the View() function to
# see more rows on screen.
View(top_counts)

# arrange() the rows of top_counts based on the 'count' column and assign the 
# result to a new object called top_counts_sorted. We want the packages with the 
# highest number of downloads at the top, which means we want 'count' to be in 
# descending order. If you need help, check out ?arrange and/or ?desc.
top_counts_sorted <- arrange(top_counts, desc(count))

# use view() again to see all 61 rows of top_counts_sorted.
View(top_counts_sorted)

# Perhaps we're more interested in the number of *unique* downloads on this 
# particular day. In other words, if a package is downloaded ten times in one 
# day from the same computer, we may wish to count that as only one download. 
# That's what the 'unique' column will tell us.
quantile(pack_sum$unique, probs = 0.99)
top_unique <- filter(pack_sum, unique > 465)
View(top_unique)

# Arrange(top_unique, desc(unique)) will arrange the rows of top_unique based on
# the values of the 'unique' variable, in descending order. Assign the result to
# top_unique_sorted.
top_unique_sorted <- arrange(top_unique, desc(unique))
View(top_unique_sorted)

#
# Read the code below, but don't change anything. As
# you read it, you can pronounce the %>% operator as
# the word 'then'.
#
# Type submit() when you think you understand
# everything here.

# In this script, we've used a special chaining operator, %>%. You can pull up 
# the related documentation with ?chain. The benefit of %>% is that it allows us
# to chain the function calls in a linear fashion. The code to the right of %>% 
# operates on the result from the code to the left of %>%.
result3 <-
        cran %>%
        group_by(package) %>%
        summarize(count = n(),
                  unique = n_distinct(ip_id),
                  countries = n_distinct(country),
                  avg_bytes = mean(size)
        ) %>%
        filter(countries > 60) %>%
        arrange(desc(countries), avg_bytes)

# Print result to console
print(result3)
