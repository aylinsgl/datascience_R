library(tidyverse)
library(nycflights13)

arrange(flights, year, month, day)

'Use desc() to re-order by a column in descending order:'
  
arrange(flights, desc(dep_delay))

'Missing values are always sorted at the end:'

tail(arrange(flights, desc(dep_delay)))

'How could you use arrange() to sort all missing values to the start? (Hint: use is.na())'

arrange(flights, desc(is.na(dep_delay)))

'Sort flights to find the most delayed flights. Find the flights that left earliest'

arrange(flights, desc(dep_delay))
arrange(flights, dep_time)

'Sort flights to find the fastest flights. Which traveled the longest?'

arrange(flights, air_time)
arrange(flights, desc(air_time))

