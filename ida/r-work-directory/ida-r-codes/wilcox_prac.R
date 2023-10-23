if(!require(psych)){install.packages("psych")}
if(!require(FSA)){install.packages("FSA")}
if(!require(lattice)){install.packages("lattice")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(coin)){install.packages("coin")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(effsize)){install.packages("effsize")}

library(gginference)
library(MASS)
library("dplyr")
library("ggpubr")

Input =("
 Before  After
 85       75
 70       50
 40       50
 65       40
 80       20
 75       65
 55       40
 20       25
        ")

textConnection(Input)

Data = read.table(textConnection(Input),header=TRUE)
print(Data)
str(Data)

#ggboxplot(Data, x = "Before", y = "After", 
#          color = "Before", 
#          ylab = "Values", xlab = "Before")

wilcox.test(After ~ Before, data=Data)
