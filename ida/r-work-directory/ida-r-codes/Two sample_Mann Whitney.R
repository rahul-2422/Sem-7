if(!require(psych)){install.packages("psych")}
if(!require(FSA)){install.packages("FSA")}
if(!require(lattice)){install.packages("lattice")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(coin)){install.packages("coin")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(effsize)){install.packages("effsize")}


Input =("
 Cartoon  Likert
 Pooh      3 
 Pooh      5
 Pooh      4
 Pooh      4
 Pooh      4
 Pooh      4 
 Pooh      4
 Pooh      4
 Pooh      5
 Pooh      5
 Piglet    2
 Piglet    4
 Piglet    2
 Piglet    2
 Piglet    1
 Piglet    2
 Piglet    3
 Piglet    2
 Piglet    2
 Piglet    3
")

#Since no information on the user, consider the data as independent

#Hypothesis
#H0: The two populations are equal
#H1: The two populations are not equal

textConnection(Input)

Data = read.table(textConnection(Input),header=TRUE)
print(Data)
str(Data)

ggboxplot(Data, x = "Cartoon", y = "Likert", 
        color = "Cartoon", palette = c("blue", "red"),
        ylab = "Values", xlab = "Cartoon")


Data$Likert[Data$Cartoon == "Pooh"]


par(mfrow=c(2,2))
hist(Data$Likert[Data$Cartoon == "Pooh"], main= "watching Pooh", xlab = (1))
hist(Data$Likert[Data$Cartoon == "Piglet"], main= "watching Piglet", xlab = (2))
qqnorm(Data$Likert[Data$Cartoon == "Pooh"], main= "QQ-plot for Pooh", xlab = (3))
qqnorm(Data$Likert[Data$Cartoon == "Piglet"], main= "QQ-plot for Piglet", xlab = (4))


#Mann Whitney U test

wilcox.test(Likert ~ Cartoon, data=Data)    # p < 0.05, H0 is rejected


wilcox.test(Likert ~ Cartoon, data=Data, 
            exact = F, paired = F,
            conf.int = TRUE,
            conf.level = 0.95)     # p < 0.05, H0 is rejected



