# Pre-requisites
library(tidyverse)
library(rstatix)
library(car)
library(here)
library(easystats)
library(janitor)


# data

dat <- tibble(Smoker = c(rep("Smoker", 7), rep("Non- Smoker", 7)),
              Athelete = c(rep("Non-Athlete", 5), rep("Athlete", 9)))




dat %>% 
    tabyl(Smoker, Athelete) %>% 
    fisher.test()

# End of script
