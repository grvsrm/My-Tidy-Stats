
############### Wilcoxon-test ############

# Pre-requisites

library(palmerpenguins)
library(tidyverse)
library(rstatix)
library(car)

# Data

############

dat <- data.frame(
    Sex = as.factor(c(rep("Girl", 12), rep("Boy", 12))),
    Grade = c(
        19, 18, 9, 17, 8, 7, 16, 19, 20, 9, 11, 18,
        16, 5, 15, 2, 14, 15, 4, 7, 15, 6, 7, 14
    )
)

dat

# Test normality first

# By Histogram
dat %>% 
    ggplot(aes(Grade)) +
    geom_histogram() +
    facet_wrap(~Sex)

# Data is not normal

# By shapiro test
dat %>% 
    filter(Sex == "Girl") %>% 
    shapiro_test(Grade)

# Data is not normal


dat %>% 
    filter(Sex == "Boy") %>% 
    shapiro_test(Grade)
# Data is not normal


# Wilcoxon Test
# First Method
dat %>% 
    wilcox_test(Grade~Sex)

# Another Method
dat %>% 
    wilcox_test(Grade~Sex, alternative = "less")


# Paired Samples

dat2 <- data.frame(
    Beginning = c(16, 5, 15, 2, 14, 15, 4, 7, 15, 6, 7, 14),
    End = c(19, 18, 9, 17, 8, 7, 16, 19, 20, 9, 11, 18)
)

# Test Normality
dat2 %>% 
    pivot_longer(Beginning:End, names_to = "Spec", values_to = "value") %>% 
    ggplot(aes(value)) + 
    geom_histogram() +
    facet_wrap(~Spec)
# Data is not normal


dat2 %>% 
    shapiro_test(Beginning)
# Data is not normal

dat2 %>% 
    shapiro_test(End)
# Data is not normal


# Wilcoxon Test

dat2 %>% 
    pivot_longer(Beginning:End, names_to = "Spec", values_to = "value") %>% 
    wilcox_test(value~Spec, paired = T)

# Can't reject the null hypothesis


# End of Script

