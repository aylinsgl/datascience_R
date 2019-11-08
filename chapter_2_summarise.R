library(tidyverse)
library(nycflights13)
library(Lahman)
rm(list=ls())

summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

#--now using group by
by_day <- group_by(flights, year, month, day)
summarise(by_day, delay=mean(dep_delay, na.rm=TRUE))

#--combining multiple operations with pipe

# 1) Group flights by destination.
# 2) Summarise to compute distance, average delay, and number of flights.
# 3) Filter to remove noisy points and Honolulu airport, which is almost twice as far away as the next closest airport.

dist_delay <- flights %>% 
  group_by(dest) %>%
  summarise(
    count = n(),
    dist = mean(distance, na.rm=TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  filter(count > 20, dest != "HNL")

ggplot(dist_delay, aes(x=dist, y=delay))+
  geom_point(aes(size=count), alpha=1/3)+
  geom_smooth(se=FALSE)

not_cancelled <- flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))

#--let’s look at the planes (identified by their tail number) that have the highest average delays:
delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarise(
    delay = mean(arr_delay)
  )

ggplot(delays, aes(x=delay))+
  geom_freqpoly(binwidth=10)

#-- We can get more insight if we draw a scatterplot of number of flights vs. average delay:
delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarise(
    delay = mean(arr_delay),
    n = n()
  )

ggplot(delays, aes(x=n, y=delay))+
  geom_point(alpha=1/10)

#--filtering out small n
delays %>%
  filter(n>25) %>%
  ggplot(aes(x=n, y=delay))+
  geom_point(alpha=1/10)

#--Let’s look at how the average performance of batters in baseball is related to the number 
#--of times they’re at bat
# plot the skill of the batter (measured by the batting average, ba) 
# against the number of opportunities to hit the ball (measured by at bat, ab)
batting <- as_tibble(Lahman::Batting)

avg_betting <- batting %>%
  group_by(playerID) %>%
  summarise(
    ba = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE),
    n = sum(AB, na.rm=TRUE)
  )

