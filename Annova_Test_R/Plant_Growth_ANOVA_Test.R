#--------------------- Test of normality------------------------------

library(dplyr)
install.packages("ggpubr")
library(ggpubr)

# Import your data

plantgrowth <- read.csv("plantgrowth.csv", header = T, stringsAsFactors = T)
attach(plantgrowth)
View(plantgrowth)


# Normality can be checked by visual inspection [normal plots (histogram),Q-Q plot (quantile-quantile plot)] or 
# by significance tests].                                             


#  Visual methods
#  Density plot and Q-Q plot can be used to check normality visually.

# 1. Density plot: the density plot provides a visual judgment about whether the distribution is bell shaped.

ggdensity( plantgrowth$Weight , main = "Density of weight", xlab = "Weight" )


# 2. Q-Q plot: Q-Q plot (or quantile-quantile plot) draws the correlation between 
#    a given sample and the normal distribution. A 45-degree reference line is also plotted.

ggqqplot(plantgrowth$Weight)



# Normality test
# Visual inspection, described in the previous section, is usually unreliable.
# It's possible to use a significance test comparing the sample distribution to a normal
# one in order to ascertain whether data show or not a serious deviation from normality.

# There are several methods for normality test 

#  1. Kolmogorov-Smirnov (K-S) normality test 
#  2. Shapiro-Wilk's test.

# Shapiro-Wilk's method is widely recommended for normality test and it provides 
# better power than K-S. It is based on the correlation between the data and the 
# corresponding normal scores

# The R function shapiro.test() can be used to perform the Shapiro-Wilk test of
# normality for one variable (univariate):

shapiro.test(plantgrowth$Weight)

# From the output, the p-value > 0.05 (p-value = 0.8915) implying that the distribution of the data
# are not significantly different from normal distribution.
# In other words, we can assume the normality.




#----------------Test of Homogeneity----------------------------------------------------------

library(dplyr)
install.packages("ggpubr")
library(ggpubr)

# Import your data

plantgrowth <- read.csv("plantgrowth.csv", header = T, stringsAsFactors = T)

View(plantgrowth)

# Equal variances across samples is called homogeneity of variances.

#There are different variance tests that can be used to assess the equality of variances.
# These include: 
# 1. F-test: Compare the variances of two groups. The data must be normally distributed.
# 2. Bartlett's test: Compare the variances of two or more groups. The data must be normally distributed.
# 3. Levene's test: A robust alternative to the Bartlett's test that is less sensitive to departures from normality.
# 4. Fligner-Killeen's test: a non-parametric test which is very robust against departures from normality.
 
# Here we use Bartlett's test, because the data having more than 2 groups and normally distributed

# The R function bartlett.test() can be used to compute Barlett's test

bartlett.test(Weight ~ Group, data = plantgrowth)

# From the output, the p-value > 0.05 (p-value = 0.2371)  is not less than the significance level of 0.05.
# It implying that the no variance in plant growth 
# Plant growth is statistically significantly different for the three treatment groups.





#--------- One-Way ANOVA test --------------------------------------------------------------


install.packages("ggpubr")
library(ggpubr)


# Import your data

plantgrowth <- read.csv("plantgrowth.csv", header = T, stringsAsFactors = T)

View(plantgrowth)

# Checking the levels of data

levels(plantgrowth$Group)  # levels are in order

# Checking the summary statistics by count,mean & standard deviation

 
group_by(plantgrowth, Group) %>%
  summarise( count = n(),
           mean = mean( Weight, na.rm = T),
           sd = sd(Weight, na.rm = T) )

# Data-visulizaton 
 
ggboxplot( plantgrowth, x = "Group", y = "Weight",
           color = "Group", palette = c("red", "blue","green"),
           order = c("control", "treatment1","treatment2"),
           xlab = "Treatment", ylab = "Weight")

# Mean plot 

ggline(plantgrowth, x = "Group", y = "Weight",
        add = c( mean_se, "jitter"),
                 order = c('control', "treatment1","treatment2"),
                 xlab = "Treatment", ylab = "Weight")
        
       
# Analysis of variance by One-way ANOVA

analysis1 <- aov(Weight ~ Group, data = plantgrowth)

# Summary of the analysis

summary(analysis1)   

# p-value is less than the significance level 0.05,
# we can conclude that there are significant 
# differences between the groups highlighted with "*" in the model summary   
