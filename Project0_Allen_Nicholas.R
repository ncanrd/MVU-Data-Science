#############################################
#                                           #
# Author:     Nicholas Allen                #
# Date:       03/11/2024                    #
# Subject:    Project 0                     #
# Class:      DSCI 512                      #
# Section:    1W 24/SP2                     #         
# Instructor: Nengbing Tao                  #
# File Name:  Project0_Allen_Nicholas.R     #
#                                           #
#############################################

# 1.1 Read the dataset in titanic2.csv into R.
#     Call the loaded data titanic.
titanic <- read.csv("C:/Users/user1/OneDrive/Documents/DSCI 612 Predictive Modelling/Week 0/titanic2.csv", header=T)

# 1.2 Make sure that you have the directory set 
#     to the correct location for the data.
setwd("C:/Users/user1/OneDrive/Documents/DSCI 612 Predictive Modelling/Week 0")

# 2.1 How many rows are in the data frame?
#     Answer: 14
nrow(titanic)

# 2.2 How many columns? 
#     Answer: 5
ncol(titanic)
       
# 2.3 What do the rows and columns represent?
#     Answer: Each row represents all passengers that are part of a unique 
#     combination of the attributes. Three columns represent attributes for
#     the passengers, which include the class, Sex, Age. The last two columns
#     sum the number of passengers belonging to this grouping, that survived and
#     that died. 

# 3.1 Select the 1st, 5th, and 10th rows with
#     columns Class and Age.
#     Answer:
titanic[c(1,5,10),c("Class", "Age")]

# 4.1 Regress Survived and Died on the predictors Class, Sex and Ageusing 
#     logistic regression using the two-column form for the dependent variable.
#     Are any of the predictors associated with survival? If so, explain the
#     relationship based on the t-statistics. Explain the chances of survival in
#     terms of odds, giving the precise numbers and giving in terms a non-expert
#     can understand.
#fit <- glm(cbind(Survived, Died) ~ Class + Sex + Age,
#           family=binomial, 
#           data=titanic)
#
#summary(fit) 
#
#    I ran out of time to modify from linear to logisitc

# 4.2 Are any of the predictors associated with survival?
# 

# 4.3 If so, explain the relationship based on the t-statistics.
# A

# 4.4 Explain the chances of survival in terms of odds, giving the 
#     precise numbers and giving in terms a non-expert can understand.
#odds <- exp(fit$coefficients)[-1]
#odds
#

# 5.1 What are the odds of a male male 3rd-class child surviving the Titanic? 
#     Show the precise odds and explain in a way a non-expert can understand.
# 
# A third-class male child has 5 to 6 odds of surviving.
# 
# display data and calculate with numbers from the list.
titanic
p3 <- 76/(76+89)
p3.odds <- p3/(1 - p3)

results <- c(`3rd-class Male Child`=p3.odds)
round(results, 2)

# 6.1 Show a histogram of the Chi-Square distribution with 8 (upper) 
#     and 13 (lower) degrees of freedom.
cdist <- qchisq((1:999)/1000, 8,13)
hist(cdist, breaks=20, col="lavender", probability = T,
     xlab="Chi-square, with df=(8,13)",
     main="Histogram of Chi-Square Distribution\nWith 8, 13 degrees freedom")
points(density(cdist), col="blue", type="l", lwd=3)

# 6.2 On the same graphic, draw a vertical dotted line to
#     show the critical test value (0.05 significance level).
#     Make sure your graphic is properly titled and labeled.

critical.value <- qchisq(0.95, 8,13)
abline(v=critical.value, type="l",lty=2,col="green",lwd=3)
text(critical.value -4, 0.045, "0.95\nsignificance\nlevel")

# End assignment