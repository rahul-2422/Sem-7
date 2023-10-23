library(MASS)
library(gginference)

help(Boston)
attach(Boston)

summary(dis)


#Plots to check the normality of the data 
par(mfrow=c(2,2))
plot(dis)
hist(dis, main= "Histogram of number of Rooms")
qqnorm(dis, main= "QQ-plot for number of Rooms")
qqline(dis)
boxplot(dis)

shapiro.test(dis) # If p-value (< 0.05), not normally distributed.

#Just do a test with t-test
t.test(dis, mu=3.7)
ggttest(t.test(dis,mu=3.7))

#Non-parametric Test
# H0: mu = 3.7
# H1: mu != 3.7

# One-sample wilcoxon Test

wilcox.test(dis, mu=3.7, exact = F, paired = F)
wilcox.test(dis, mu = 3.7, alternative="less")
wilcox.test(dis, mu=3.7, alternative= "greater")

#if p-value < 0.05, Reject H0
#if p-value > 0.05, do not reject H0

