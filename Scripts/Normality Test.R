# Pre requisites
library(tidyverse)
library(rstatix)
library(car)


# Data

pnorm(1, 
      mean = 0, 
      sd = 1,
      lower.tail = F)

pnorm(70, 
      mean = 67, 
      sd = 9,
      lower.tail = F) - 
pnorm(80, 
      mean = 67, 
      sd = 9,
      lower.tail = F)



dat <- rnorm(1000, 5, 2) %>% as_tibble()

# Histogram
dat %>% 
    ggplot(aes(value)) +
    geom_histogram()

dat %>% 
    ggplot(aes(value)) +
    geom_density()


## QQ Plot
qqPlot(dat$value)


# Shapiro Test

shapiro_test(dat$value)

# Can't reject the null hypothesis. Data is normal

# End of script


