sample_mean=0
sample_size=30
no_of_iter=1000

population_var = c(1,2,3,4,5.5,7.7,2.2,40,32,100)
#sample(population_var, sample_size, replace = TRUE)
for (i in 1:no_of_iter){
  sample_mean[i] <- mean(sample(population_var, sample_size, replace = TRUE))
}

plot(hist(sample_mean,breaks = 50,density=TRUE))




# runif(sample_size, min=-40, max=40)
# 
# for (i in 1:no_of_iter){
#   sample_mean[i] <- mean(runif(sample_size, min=-40, max=40))
# }
# # View(sample_mean)
# 
# plot(hist(sample_mean,breaks = 30,density=TRUE))



