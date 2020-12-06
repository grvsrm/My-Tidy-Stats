# Pre-requisites

library(palmerpenguins)
library(tidyverse)
library(rstatix)
library(car)

# Data

dat <- penguins %>% 
    select(species, flipper_length_mm) %>% 
    drop_na()

dat %>% 
    ggplot(aes(species, flipper_length_mm, color = species)) +
    geom_jitter()



# Test Independence
durbinWatsonTest(dat$flipper_length_mm)

# Results of durbin watson test is almost equal to 0 which indicates zero auto correlation

# Test Normality of Residuals

# For that lets perform anova first
penguin_anova <- aov(flipper_length_mm~species, data = penguins)

# Histogram
penguin_anova$residuals %>% as_tibble() %>% 
    ggplot(aes(value)) + 
    geom_histogram()

# Q-Q Plot
qqPlot(penguin_anova$residuals,id = F)

# From the histogram and QQ-plot above, we can already see that the normality assumption seems to be met. 
# Still it would be good to perform a shapiro wilk statistical test for normality.

# Shapiro-Wilk Test

shapiro.test(penguin_anova$residuals)

# We can't reject the null hypothesis, hence the data is normal.

# There is another test to check normality
# Kolmogorov-Smirnov test
ks.test(penguin_anova$residuals, "pnorm")

# We can also test the normality on raw data rather than the residuals.

dat %>% 
    ggplot(aes(flipper_length_mm, fill = species)) +
    geom_histogram() +
    facet_wrap(~species, scales = "free")

# Visuals suggest that the data is normal at group level also. Hence we will assume normality.


# Testing homogenity or in other words homoscedasticity

dat %>% 
    ggplot(aes(species, flipper_length_mm, color  = species)) +
    geom_boxplot(show.legend = F)

dat %>% 
    ggplot(aes(species, flipper_length_mm)) +
    geom_jitter()

# We see in these plots that dispersion for all the groups is more or less same, hence
# it is safe to assume that they have almost equal variance. 
# Still it would be a good idea to test homogenity using a statistical test called levene test

leveneTest(flipper_length_mm ~ species, data = dat)

# p-value is high, We can't reject the null hypothesis, hence the data is normal.


dat %>% 
    group_by(species) %>% 
    summarise(mean = mean(flipper_length_mm),
              sd = sd(flipper_length_mm))


# Now let's perform ANOVA

# We will use two methods

# One wat ANOVA

anova_1 <- oneway.test(flipper_length_mm~species, data = dat, var.equal = T)

# p-valueis too small, we have to reject the null hypothesis, means these three group are not same.

anova_2 <- aov(flipper_length_mm~species, data = dat)

anova_2 %>% 
    summary()

anova_3 <- anova_test(flipper_length_mm~species, data = dat)

# results are significant. p-value is too small, we can reject the null hypothesis, hence these three groups are not same.



# Post hoc tests

TukeyHSD(anova_3)
tukey_hsd(anova_2)

dunn_test(anova_1)





