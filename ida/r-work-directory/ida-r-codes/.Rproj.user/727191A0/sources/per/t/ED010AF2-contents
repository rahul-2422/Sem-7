#Given Data
mean <- 5818
n <- 24
S2 <- 7273809
mu <- 5800

# Test Statistic
t <- (mean - mu) / (S2 / n)^(1/2)

# DOF (degrees of freedom)
df <- (n - 1)

# Critical-t-value from table
tc <- abs(qt(0.1, df))

# Results
cat("Test Statistic = ", t)
cat("Degrees of Freedom = ", df)
cat("Critical-t-value = ", tc)

if(t < tc){
  cat("Failed to Reject the null Hypothesis meaning the mean is less than 5,800 tons")
}else {
  cat("Rejected the null hypothesis that the mean is less than 5,800 tons")
}


#question 2
# Given data
tar = c(14.5, 14.2, 14.4, 14.3, 14.6) 

# Sample size
n = length(tar)

# Sample mean
xbar = mean(tar)

# Claimed Population mean 
mu = 14.0

# Sample standard deviation
sd = sd(tar)

# Degrees of freedom
df = n - 1

# Test statistic
t = (xbar - mu) / (sd/sqrt(n))  

# Critical-t-value from table for two-tailed take given alpha/2
tc <- abs(qt(0.025, df))

# Report
cat("Sample mean (xbar): ", xbar)
cat("Claimed population mean (mu): ", mu)
cat("t-stat: ", t)
cat("Critical-t-value = ", tc)

if(t < tc){
  cat("Failed to Reject null hypothesis that population mean is 14.0") 
} else {
  cat("Reject null hypothesis that population mean is 14.0")
}

#Question 3b
# Paired t-test 
# Before data
before <- c(45, 73, 46, 124, 33, 57, 83, 34, 26, 17)

# Sample size
n = length(before)

# Degrees of freedom
df = n - 1

# After data 
after <- c(36, 60, 44, 119, 35, 51, 77, 29, 24, 11) 
t_test <- t.test(before, after, paired = TRUE)

# Critical-t-value from table for two-tailed take given alpha/2
tc <- abs(qt(0.025, df))

# Test statistic
t = t_test$statistic

# Report test at 0.05 level
cat("t-statistic = ", t) 
cat("Critical-t-value = ", tc)

if(t < tc){
  cat("Failed to reject null hypothesis that safety program had no effect")
} else {
  cat("Rejected null hypothesis that safety program had no effect")  
}

#question 3c
# Given Data
bfr <- c(45, 73, 46, 124, 33, 57, 83, 34, 26, 17)
afr <- c(36, 60, 44, 119, 35, 51, 77, 29, 24, 11)

# Sign test
sign_test <- wilcox.test(bfr, afr, paired = TRUE, exact = FALSE)

# Extract p-value
p_value <- sign_test$p.value 

# Report test at 0.05 level
cat("Number of negative differences =", sign_test$statistic)
cat("p-value =", p_value)

if(p_value < 0.05){
  cat("Rejected null hypothesis that safety program had no effect")
} else {
  cat("Failed to reject null hypothesis that safety program had no effect")
}

#question 4
# Given Data
data <- c(0.265, 0.263, 0.266, 0.267, 0.267, 0.265, 0.267, 0.267, 0.265, 0.268, 0.268, 0.263) 

# Claimed mean
mu <- 0.265

# Wilcoxon signed-rank test
wilcox_test <- wilcox.test(data, mu, alternative = "two.sided", exact = FALSE)

# Test statistic
t = wilcox_test$statistic

# Extract p-value
p_value <- wilcox_test$p.value 

# Output
cat("Test statistic = ", t) 
cat("p-value = ", p_value)

if(p_value < 0.05){
  cat("Rejected the claim that the mean diameter is 0.265 mm")
} else {
  cat("Failed to reject the claim that the mean diameter is 0.265 mm")
}
