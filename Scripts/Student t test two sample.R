########### t-test ###############

# Pre-requisites
library(tidyverse)
library(rstatix)
library(car)

# Data


dat1 <- data.frame(
    sample1 = c(0.9, -0.8, 0.1, -0.3, 0.2),
    sample2 = c(0.8, -0.9, -0.1, 0.4, 0.1)
)

dat1_tidy <- dat1 %>% 
    pivot_longer(sample1:sample2, names_to = "sample", values_to = "value")


# Check normality

dat1 %>% 
    shapiro_test(sample1)

# Can't reject the null hypothesis that the data is normal

dat1 %>% 
    shapiro_test(sample2)
# Can't reject the null hypothesis that the data is normal

# Hence to move forward we can do a t-test to compare the two populations

dat1_tidy %>% 
    t_test(value~sample, var.equal = T)
# Can't reject the null hypothesis that the two populations are similar


dat2 <- data.frame(
    sample1 = c(1.78, 1.5, 0.9, 0.6, 0.8, 1.9),
    sample2 = c(0.8, -0.7, -0.1, 0.4, 0.1, NA)
)

dat2 %>% 
    pivot_longer(sample1:sample2, names_to = "sample", values_to = "value") %>%
    # ggplot(aes(sample, value)) +
    # geom_boxplot()
    t_test(value~sample, var.equal = T, alternative = "greater")


dat3 <- data.frame(
    value = c(0.8, 0.7, 0.1, 0.4, 0.1, 1.78, 1.5, 0.9, 0.6, 0.8, 1.9),
    sample = c(rep("1", 5), rep("2", 6))
)

dat3 %>%
    # ggplot(aes(sample, value)) +
    # geom_boxplot()
    t_test(value~sample, alternative = "less")


dat4 <- data.frame(
    before = c(0.9, -0.8, 0.1, -0.3, 0.2),
    after = c(0.8, -0.9, -0.1, 0.4, 0.1)
)

dat4 %>%
    pivot_longer(before:after, names_to = "sample", values_to = "value") %>%
    # ggplot(aes(sample, value)) +
    # geom_boxplot() %>% 
    pairwise_t_test(value~sample)

# Can't reject the null hypothesis


dat5 <- data.frame(
    before = c(9, 8, 1, 3, 2),
    after = c(16, 11, 15, 12, 9)
)
dat5 %>%
    pivot_longer(before:after, names_to = "sample", values_to = "value") %>%
    # ggplot(aes(sample, value)) +
    # geom_boxplot() %>% 
    pairwise_t_test(value~sample, paired = T)


# End of script
