#############################################
#                                           #
# Author:     Nicholas Allen                #
# Date:       03/17/2024                    #
# Subject:    Project 1                     #
# Class:      DSCI 512                      #
# Section:    1W 24/SP2                     #         
# Instructor: Nengbing Tao                  #
# File Name:  Project1_Allen_Nicholas.R     #
#                                           #
#############################################

# 1.1 Read the in Boston.csv Download Boston.csv into R.
Boston <- read.csv("C:/Users/user1/OneDrive/Documents/DSCI 512 Predictive Modelling/Week 1/Bostonnew.csv", header=T)

# 1.2 Call the loaded data Boston.
Boston

# 1.2 Make sure that you have the directory set 
#     to the correct location for the data.
setwd("C:/Users/user1/OneDrive/Documents/DSCI 512 Predictive Modelling/Week 1")

# 2.1 How many rows are in the data frame?
#     Answer: 506
nrow(Boston)

# 2.2 How many columns? 
#     Answer: 13
ncol(Boston)
       
# 2.3 What do the rows and columns represent?
#     Answer: c.	Each row represents a single observation. They appear to be 
#                 unique neighborhoods of Boston. Each column is an attribute of
#                 the neighborhood, for instance crime rate or median home value  

# 3. Select the 1st, 100th, and 500th rows with columns tax and medv.
#     Answer:
Boston[c(1,100, 500),c("tax", "medv")]

# 4. Look at the data using cor function. Are any of the predictors associated 
#     with per capita crime rate? If so, explain the relationship based on 
#     correlation coefficients.
cor(Boston)

# 5. Make some pairwise scatterplots of the predictors, crim, rad, tax, indus, 
#    and lstat in this data set. Describe your findings.
plot(Boston$crim, Boston$rad)
plot(Boston$crim, Boston$tax)
plot(Boston$crim, Boston$indus)
plot(Boston$crim, Boston$lstat)

plot(Boston$rad, Boston$tax)
plot(Boston$rad, Boston$indus)
plot(Boston$rad, Boston$lstat)

plot(Boston$tax, Boston$indus)
plot(Boston$tax, Boston$lstat)

plot(Boston$indus, Boston$lstat)

# 6. Do any of the suburbs of Boston appear to have particularly high crime 
#    rates by looking at the histogram of crim? What is the range of crim by 
#    using range() function in R?
hist(Boston$crim)
range(Boston$crim)

# 7. How many of the suburbs in this dataset bound the Charles River?
sum(Boston$chas)

# 8. What is the median pupil-teach ratio among the towns in this dataset? 
#    What’s the mean?
median(Boston$ptratio)
mean(Boston$ptratio)

# 9. In this dataset, how many of the suburbs average more than seven rooms per 
#    dwelling? More than eight rooms per dwelling? Comment on the suburbs that 
#    average more than eight rooms per dwelling.
Boston_7rm = Boston[Boston$rm>7,]
nrow(Boston_7rm)
Boston_8rm = Boston[Boston$rm>8,]
nrow(Boston_8rm)
Boston_8rm
median(Boston$medv)

# 10. Convert chas to a factor. Boxplot the medv against chas. Are houses around
#     the Charles River more expensive?
Boston$chas = factor(Boston$chas)
plot(Boston$chas, Boston$medv, xlab = "By Charles River", ylab = 
       "Median Home Value ($1000s)")

# End assignment

#Experimentation 
Boston_rm = Boston[,c("crim", "rad", "tax", "indus", "lstat")]
pairs(Boston_rm)
