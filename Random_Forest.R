install.packages("randomForest")
library(randomForest) 
library(tree)
library(ISLR)

A = data.frame(Hitters)
A = na.omit(A)
A$Salary1 = log(A$Salary)
fivenum(A$Salary1)
HighSal = ifelse(A$Salary1 < 6.05,"No","Yes")

A = data.frame(A,HighSal)

set.seed(123)
divfun = sample(2,nrow(A),replace = T,prob = c(0.7,0.3))
trd = A[divfun == 1,]
tsd = A[divfun == 2,]

str(A)

model1 = randomForest(HighSal~.-Salary-Salary1,data=A,ntree=500, mtry=19,importance=TRUE)

model2 = randomForest(Species ~ .,data = iris)
?randomForest

model2

tsp = predict(model1,newdata=tsd,type="Class")

trp = predict(model1,newdata=trd,type="Class")

plot(model1)

model1$confusion

varImpPlot(model1)

## mtry = Number of variables randomly sampled as candidates at each split

## mtry = p for Bagging (all variables)

## For random forest, recommended mtry ~ sqrt(p) for classification, p/3 for regression   

## ntree = Number of trees to grow