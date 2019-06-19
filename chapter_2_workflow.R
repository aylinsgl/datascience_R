library(tidyverse)

'
i_use_snake_case
otherPeopleUseCamelCase
some.people.use.periods
And_aFew.People_RENOUNCEconvention
'

library(nycflights13)

'
int stands for integers.

dbl stands for doubles, or real numbers.

chr stands for character vectors, or strings.

dttm stands for date-times (a date + a time).

lgl stands for logical, vectors that contain only TRUE or FALSE.

fctr stands for factors, which R uses to represent categorical variables with fixed possible values.

date stands for dates.

'

# the dplyr verbs:
'
Pick observations by their values (filter()).
Reorder the rows (arrange()).
Pick variables by their names (select()).
Create new variables with functions of existing variables (mutate()).
Collapse many values down to a single summary (summarise()).
'

filter(flights, month == 1, day == 1)
(dec25 <- filter(flights, month == 12, day == 25))

'
Had an arrival delay of two or more hours
'
filter(flights, arr_delay > 2)
'
Flew to Houston (IAH or HOU)
'
(houston <- filter(flights, dest %in% c("IAH","HOU")))
'
Were operated by United, American, or Delta
'
filter(flights, carrier %in% c("UA","AA","DL"))
'
Departed in summer (July, August, and September)
'
filter(flights, month %in% c(7,8,9))
'
Arrived more than two hours late, but didn’t leave late
'
filter(flights, arr_delay > 2 & dep_delay == 0)
'
Were delayed by at least an hour, but made up over 30 minutes in flight
'
filter(flights, dep_delay > 1 & arr_delay <= dep_delay-1)
'
Departed between midnight and 6am (inclusive)
'
filter(flights, dep_time > 000 & dep_time < 600)
