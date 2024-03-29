library(tidyverse)

# loading the mgp dataset to visualise some data 
data <- mpg
ggplot(data = data, aes(x = displ, y = hwy)) + 
  geom_point()
#or
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

?mpg

# Make a scatterplot of hwy vs cyl

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y = hwy))

# What happens if you make a scatterplot of class vs drv? Why is the plot not useful?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv))

# adding aesthetics

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# Which variables in mpg are categorical? Which variables are continuous?
?mpg
str(data)
# Map a continuous variable to color, size, and shape
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = year, size = cty))

# What happens if you map the same variable to multiple aesthetics?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = cty, size = cty))

# What does the stroke aesthetic do? What shapes does it work with? (Hint: use ?geom_point)
?geom_point
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, stroke = cty))

# What happens if you map an aesthetic to something other than a variable name, 
# like aes(colour = displ < 5)? Note, you’ll also need to specify x and y.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))

# Facets:
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# To facet your plot on the combination of two variables, add facet_grid() to your plot call. 
# The first argument of facet_grid() is also a formula. This time the formula should contain 
# two variable names separated by a ~
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

# If you prefer to not facet in the rows or columns dimension, use a . instead of a variable name
# e.g. + facet_grid(. ~ cyl).
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(. ~ cyl)

# faceting on continuous variable
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(.~ year)

# what happens here 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

# When using facet_grid() you should usually put the variable with more unique levels in the columns!!!

# different geoms:
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))
  #geom_point(mapping = aes(x=displ, y=hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE)

# making it easier to change the code, changing global and local mapping:
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes(color=class)) + 
  geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

# what will this look like?
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

# creating code from image
#1. 
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes(color=displ>5)) + 
  geom_smooth(se=FALSE, color="blue", show.legend = FALSE)


#2.
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth(se=FALSE, color="blue", aes(group=drv), show.legend = FALSE)

#3.
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes(color=drv)) + 
  geom_smooth(se=FALSE, color="blue")

#4.
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes(color=drv)) + 
  geom_smooth(se=FALSE, aes(linetype=drv))

#5.
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes(color=drv)) + 
  geom_smooth(se=FALSE, aes(linetype=drv))

## statistical transformations 
# bar plots. default stat for barplots is "count"
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

# changing stat to identity (frequency in this case)
demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)
ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")

# using stat summary
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

ggplot(data = diamonds) + 
  geom_col(mapping = aes(x = cut, y=depth))

# adding jitter to improve scatter plots (adds random noise for each point)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")

# see the difference between the next two plots:
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point(position="jitter", stat="identity")

# using coord polar:
bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()

# Turn a stacked bar chart into a pie chart using coord_polar() -> TAKES LONG TO COMPUTE.
ggplot(data = mpg, aes(x=year, y=hwy, fill=drv)) + 
  geom_bar(stat="identity")+
  coord_polar()

# What’s the difference between coord_quickmap() and coord_map()
ggplot(data = mpg, aes(x=cyl, y=hwy, fill=drv)) + 
  geom_bar(stat="identity")+
  coord_map()
ggplot(data = mpg, aes(x=cyl, y=hwy, fill=drv)) + 
  geom_bar(stat="identity")+
  coord_quickmap()

# What does the plot below tell you about the relationship between city and highway mpg? 
# Why is coord_fixed() important? What does geom_abline() do?
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()+

# lets play around more: this is the grammar of graphics
'ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(
    mapping = aes(<MAPPINGS>),
    stat = <STAT>, 
    position = <POSITION>
  ) +
  <COORDINATE_FUNCTION> +
  <FACET_FUNCTION>'