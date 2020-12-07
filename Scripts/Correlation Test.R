# Pre-requisites
library(tidyverse)
library(rstatix)
library(car)
library(here)
library(easystats)


mtcars %>% str()


cor(mtcars$disp, mtcars$mpg)


mtcars %>% names()

cor(mtcars$drat, mtcars$qsec)

cor.test(mtcars$drat, mtcars$qsec)

mtcars %>% 
    correlation::correlation()


# End os script