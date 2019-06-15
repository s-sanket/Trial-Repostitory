#too many Variables ==> few Principal components

#PC --> represent --> Underlying structure

#Multiple lines accross spaces
library(ISLR)

library(devtools)
install_github("vqv/ggbiplot")
library(ggbiplot)

A = data.frame(Wage)
str(A)
nums = unlist(lapply(A, is.numeric))  
nums
B = A[ , nums]
B1 = na.omit(B)

model2 = prcomp(B1)
model2
str(model2)

ggbiplot(model2,ellipse = TRUE)
plot(model2)

#------------USING ADE-------------

install.packages("ade4")
library(ade4)
model1 = dudi.pca(B1)
