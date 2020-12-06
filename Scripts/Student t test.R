
########### t-test ###############

# Pre-requisites

library(palmerpenguins)
library(tidyverse)
library(rstatix)
library(car)

# Data


dat3 <- data.frame(
    sample1 = c(0.9, -0.8, 0.1, -0.3, 0.2),
    sample2 = c(0.8, -0.9, -0.1, 0.4, 0.1)
)

dat3


# Check normality
