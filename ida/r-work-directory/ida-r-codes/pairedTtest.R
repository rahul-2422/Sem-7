library("ggpubr")
library("gginference")
library("MASS")
library("dplyr")
before <- c(200, 190, 180, 140, 150, 195, 155, 165, 175, 180)
after <- c(210, 215, 195, 160, 160, 230, 180, 170, 180, 200)

my_data <- data.frame(
  group = rep(c("before", "after"), epoch = 10),
  weight = c(before, after)
)

print(my_data)

group_by(my_data, group)%>%
  summarise(
    count = n(),
    mean = mean(weight, na.rm = TRUE),
    sd = sd(weight, na.rm = TRUE)
  )

ggboxplot(my_data, x= "group", y = "weight",
          color = "group", palette = c("green", "magenta"),
          order = c("before", "after"),
          ylab = "weight", xlab = "groups"
          )

#compute difference
d <- with(my_data, weight[group=="before"] - weight[group=="after"])
#Shapiro-Wilk test
shapiro.test(d) #p>0.05 => implies normality in data

#compute t-test => 1st method => when given data is two seperate vectors
res <- t.test(before, after, paired=TRUE)
res

ggttest(t.test(before, after, paired=TRUE))

#Reject H0. The weight gain operation is working.

#compute t-test => if data is saved in a data frame
res <- t.test(weight=group, data=my_data, paired=TRUE)
res
ggttest(t.test(before, after, paired=TRUE))
#ttest_result <- t.test(before, after, paired = TRUE)
#ggttest(ttest_result, xlab = "Groups", ylab = "Weight") +
#  geom_vline(xintercept = 0, linetype = "dashed")





women_weight <- c(38.9, 51.3, 41.5, 61.2, 51.5, 46.5, 51, 55, 65, 60)
men_weight <- c(66, 75, 80, 65, 54, 76, 86, 64, 73, 83)


