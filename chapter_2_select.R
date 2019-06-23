library(tidyverse)
library(nycflights13)

select(flights, year, month, day)

select(flights, year:day)

select(flights, -(year:day))

'starts_with("abc"): matches names that begin with “abc”.

ends_with("xyz"): matches names that end with “xyz”.

contains("ijk"): matches names that contain “ijk”.

matches("(.)\\1"): selects variables that match a regular expression. 
This one matches any variables that contain repeated characters. 
You’ll learn more about regular expressions in strings.

num_range("x", 1:3): matches x1, x2 and x3.'

rename(flights, tail_num = tailnum)

select(flights, time_hour, air_time, everything())

'Brainstorm as many ways as possible to select dep_time, dep_delay, arr_time, and arr_delay from flights.'
select(flights, dep_time, dep_delay, arr_time, arr_delay)
select(flights, one_of(c("dep_time", "dep_delay", "arr_time", "arr_delay")))

vars <- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights, one_of(vars))

'what happens here?'
select(flights, contains("TIME"))
select(flights, contains("TIME", ignore.case = FALSE))
