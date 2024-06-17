#install package neuralnet

install.packages("neuralnet")
#load the dataset

library(readr)
mtcars <- read.csv("C:/Users/user1/OneDrive/Documents/DSCI 512 Predictive Modelling/Week 1/mtcars.csv", header=T)
View(mtcars)

#Standardize numerical data columns in R

scaled.mtcars =  scale(mtcars[, -1])
scaled.mtcars = as.data.frame(scaled.mtcars)
#split the traiing data and test data
set.seed(1)
index <- sample(1:nrow(scaled.mtcars),0.80*nrow(scaled.mtcars))
train <- scaled.mtcars[index,]
test <- scaled.mtcars[-index,]

#load the library
library(neuralnet)

nn.model <- neuralnet(mpg ~ cyl +disp+hp+drat +wt,data=train,hidden=c(5,3))
#plot the neural network
plot(nn.model)

#forecast the test dataset
#Do not pass any extra data when predicting. Otherwise you'll receive the error Error in neurons[[i]] %*% weights[[i]] 
predict.nn = compute(nn.model, test[, c("cyl", "disp","hp", "drat", "wt")])
#get the observation of mpg from test data set
observ.test = test$mpg
#compute the MSE
mean((observ.test- predict.nn$net.result)^2)



