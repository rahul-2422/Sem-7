install.packages("gginference")
library(gginference)
library(MASS)

# One sample T-test 
#Example 1

mu0=3  #Tennis ball historical mean
sample_ob = c(3,5,4,6,2,3,4,5,5,4)
#sample_ob = c(2,3,3,4,3,3,3,2,3,4)

t_obs=(mean(sample_ob)-mu0)/(sd(sample_ob)/sqrt(length(sample_ob)))
t_obs

t.test(sample_ob,mu=3,conf.level = 0.95)
ggttest(t.test(sample_ob,mu=3))


#Example 2

View(survey)
h=na.omit(survey$Height)
pop.mean=mean(h) 
#pop.mean=160

h.sample = sample(h,30)
t.test(h.sample,mu=pop.mean, conf.level = 0.95)

ggttest(t.test(h.sample,mu=pop.mean, conf.level = 0.95))


#Example 3
hard = c(7.65,	7.60,	7.65,	7.70,	7.55,
         7.55,	7.40,	7.40,	7.50,	7.50)
popu_mean=7.5
t.test(hard,mu=7.5,conf.level = 0.95)
ggttest(t.test(hard,mu=7.5, conf.level = 0.95))

hard = c(8.41, 8.19, 8.18, 8.12, 8.58, 8.53, 8.48, 8.27, 7.98, 8.73 )
popu_mean=8.2
t.test(hard,mu=8.2,conf.level = 0.99)
ggttest(t.test(hard,mu=8.2,conf.level = 0.99))


