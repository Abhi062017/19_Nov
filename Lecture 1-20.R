#19_Nov: Lecture1-20: From Data to Decisions - Chris Mack
getwd()
y <- as.array(c(5.5, 5L, 2.2,5.1,8.8, 55L,7.36, 61.02))
class(y)
typeof(y)
x <- 4:14
x
class(x)
typeof(x)

x <- seq(0,14,2)
x
plot(y~x)
lines(x)
model <- lm(y~x)
summary(model)

#building histogram using rnorm function for data input
#note, histograms work best when we have large amount of data
y <- rnorm(100, 0, 1) #if n>100, we'd have better histogram
y
hist(y,10) #bins = sqrt(n)

y <- rnorm(10000, 0, 1) #Std Norm Dist, as mean=0 sd=1
hist(y, 100) #bins = sqrt(10000)

#**********************************************************
#Reading dataset
data <- read.csv('NBS Weight Data.csv', header = T)
str(data)
View(data)
summary(data) #note NA's
data[,c(3,4)] <- 0 #impute NA's

#Plots
hist(data[,2], breaks = 12)
boxplot(data$Result, horizontal = T)
#Quantile-Quantile plot
qqnorm(data$Result, col = 'orange') #creates a normal probability plot
qqline(data$Result, col = 'blue') #runs a straight line thru the normal prob plot

install.packages('psych', dependencies = T)
library(psych)
pairs.panels(data)
sapply(data, typeof) #shows the type of each variable
cor(data$Trial, data$Result)

#Outliers treatment: Discarding outliers
new_data <- c(sample(x = 1:20, size = 40, replace = T), 65, 80)
new_data
length(new_data)
boxplot(new_data, horizontal = T)
summary(new_data) #note: 3rd quartile value, Q3 = 15.75
benchmark <- 15.75 + 1.5*IQR(new_data) #note: Q1-1.5IQR > Outliers > Q3+1.5IQR
#Q1-1.5IQR: Lowest point of a boxplot
#Q3+1.5IQR: Highest point of a boxplot
benchmark
#subsetting new_data
new_data2 <- new_data[new_data<benchmark]
boxplot(new_data2) #no outliers
