# Exercise 4: DPLYR and flights data

# Install the nycflights13 package and read it in.  Require the dplyr package
install.packages("nycflights13")
library(nycflights13)
library(dplyr)

data("flights")
View(flights)
# The data.frame flights should now be accessible to you.  View it, 
# and get some basic information about the number of rows/columns
num.row <- nrow(flights)
num.col <- ncol(flights)


# Add a column that is the amount of time gained in the air (`arr_delay` - `dep_delay`)
flights <- mutate(flights, time.gained = arr_delay - dep_delay)


# Sort your data.frame desceding by the column you just created
flights <- arrange(flights, -time.gained)


# Try doing the last 2 steps in a single operation using the pipe operator
flights <- mutate(flights, time.gained = arr_delay - dep_delay) %>% arrange(-time.gained)


# Make a histogram of the amount of gain using the `hist` command
hist(flights$time.gained)


# On average, did flights gain or lose time?
mean(flights$time.gained, na.rm = TRUE)


# Create a data.frame that is of flights headed to seatac ('SEA'), 
seatac <- filter(flights, dest == "SEA")
View(seatac)

# On average, did flights to seatac gain or loose time?
mean(seatac$time.gained, na.rm = TRUE)

### Bonus ###
# Write a function that allows you to specify an origin, a destination, and a column of interest
# that returns a data.frame of flights from the origin to the destination and only the column of interest
<<<<<<< HEAD
## Hint: see slides on standard evaluation
get.needed.info <- function(my.origin, my.dest, my.interest) {
  return(filter(flights, origin == my.origin, dest == my.dest) %>% select_(my.interest))
}
=======
## Hint: see chapter 11 section on standard evaluation
>>>>>>> 9fda7081c3f0780c9b034b98bd91de45322f552f


# Retireve the air_time column for flights from JFK to SEA
air.time.JFK.SEA <- get.needed.info("JFK", "SEA", "air_time")
View(air.time.JFK.SEA)

# What was the average air time of those flights (in hours)?  


# What was the min/max average air time for the JFK to SEA flights?
