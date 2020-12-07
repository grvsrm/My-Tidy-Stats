# Pre-requisites
library(tidyverse)
library(rstatix)
library(car)
library(here)
library(easystats)
library(janitor)


# One proportion and goodness of fit test




# One prop test
dat <- iris %>% 
    as_tibble() %>% 
    mutate(size = case_when(Sepal.Length < median(Sepal.Length) ~ "Small",
                            TRUE ~ "Big"))


prop_test(x = 77,
          n = 150,
          p = 0.5)

prop.test(x = 77,
          n = 150,
          p = 0.5)

# Can't reject the null hypothesis


# prop.test works when sample size > 30, if not use binom.test

# Binom Test
binom_test(x = 12,
          n = 17,
          p = 0.5)


# here there were two proportions and we were comparing two of them. What if there were three categories in the qualititive variable
# In such cases we use chi sq goodness of fit test

iris %>% 
    count(Species)

chisq.test(table(dat$Species), # observed proportions
           p = c(1 / 3, 1 / 3, 1 / 3) # expected proportions
)


chisq_test(table(dat$Species), # observed proportions
           p = c(1 / 3, 1 / 3, 1 / 3) # expected proportions
)


# Because chi square works on more than two categories, hence it can also help in answering questions such as the data follows 
# binomial distribution or not


# End of script