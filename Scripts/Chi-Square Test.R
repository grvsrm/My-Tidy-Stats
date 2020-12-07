# Pre-requisites
library(tidyverse)
library(rstatix)
library(car)
library(here)
library(easystats)
library(janitor)


# data

dat <- iris %>% 
    as_tibble() %>% 
    mutate(size = case_when(Sepal.Length < median(Sepal.Length) ~ "Small",
                            TRUE ~ "Big"))

dat %>% 
    tabyl(Species, size) %>% 
    chisq.test()


dat %>% 
    tabyl(Species, size) %>% 
    fisher.test()


# End of script