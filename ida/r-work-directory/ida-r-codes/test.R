library(gginference)
library(MASS)

mu = 3
sample_ob = c(3,5,4,5,3,3,4,5,5,4)

t_obs = (mean(sample_ob)-mu)/(sd(sample_ob))/sqrt(length(sample_ob))
t_obs

t.test(sample_ob, mu=3, conf.level = 0.95)
ggttest(t.test(sample_ob, mu=3))

studentData <- read.csv(file = "~/Drive-D/clg/7/ida/r-work-directory/ida-r-codes/82_Data_File.csv",
                        header = TRUE,
                        sep = ","
                        )

print(studentData)

mu = 3
sample_ob = c(3,5,4,5,3,3,4,5,5,4)

t_obs = (mean(sample_ob)-mu)/(sd(sample_ob))/sqrt(length(sample_ob))
t_obs

t.test(sample_ob, mu=3, conf.level = 0.95)
ggttest(t.test(sample_ob, mu=3))

library(MASS)
View(survey)
new_column <- survey$`Height`
h = na.omit(new_column)
#pop.mean = mean(h)
pop.mean = 160

h.sample = sample(h, 30)
t.test(h.sample, mu=pop.mean, conf.level=0.95)
ggttest(t.test(h.sample, mu=pop.mean, conf.level=0.95))

install.packages("ggpubr")
library(ggpubr)

my_data <- data.frame(
  name = paste0(rep("M_", 20), 1:20),
  weight = round(rnorm(20, 20, 2), 2)
  #last 2 represents how many digits you want after decimal
)

#head(my_data, 5)
boxplot(my_data$`weight`, horizontal=TRUE)

#Density plot
ggdensity(my_data$`weight`,
          main="Density plot of mice weight",
          x_lab = "weight(g)"
)

ggqqplot(my_data$`weight`)
#Do AD test yourself
shapiro.test(my_data$`weight`) # if p>0.05, data is Normal
#Since normality is proved, we will go for parametric test - AD test or Shapiro-Wilk test

stud <- read.csv(file="C:/Users/sudha/OneDrive/Desktop/82_Data_File.csv", header=TRUE, sep=",")
print(stud)

boxplot(stud$Mathematics, horizontal=TRUE)
ggdensity(stud$Mathematics)
ggqqplot(stud$Mathematics)
shapiro.test(stud$Mathematics) #p<0.05 => Not Normal

boxplot(stud$History, horizontal=TRUE)
ggdensity(stud$History)
ggqqplot(stud$History)
shapiro.test(stud$History) #p>0.05 => Normal

boxplot(stud$Geography, horizontal=TRUE)
ggdensity(stud$Geography)
ggqqplot(stud$Geography)
shapiro.test(stud$Geography) #p>0.05 => Normal
