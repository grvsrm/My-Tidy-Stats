# Pre requisites
library(tidyverse)
library(rstatix)
library(car)


# Data
dat1 <- data.frame(
    value = c(7.9, 5.8, 6.3, 7.3, 6.7)
)
 

# t-test

# First method
t.test(dat1$value, mu = 5)

# Second method
dat1 %>% 
    t_test(value~1, mu = 5)


dat1 %>% 
    t_test(value~1, mu = 5, alternative = "greater")

# We can reject the null hypothesis. Mean is not equal to 5


# End of script
