#install.packages("ggpubr")
library(ggpubr)
#Example 1
#Create a dataset with name and weight of 10 mice
#Test whether the average weight of mice differs from 25g
my_data <- data.frame(
  name = paste0(rep("M_", 20), 1:20),
  weight = round(rnorm(20, 20, 2), 2))

head(my_data, 5)

boxplot(my_data$weight, horizontal = TRUE)

#Density plot
ggdensity(my_data$weight,
              main='Density plot of mice weight',
              xlab = 'weight (g)')

#Q-Q plot
ggqqplot(my_data$weight)

shapiro.test(my_data$weight) # p > 0.05 Normal
#Since normality is proved, we will go for parametric test

#Example2 to show normality plots
studentData <- read.csv(file = "/Users/sreejarajagopal/R Programming/82_Data_File.csv", 
                        header = TRUE, sep = ",")
print(studentData)

# Visualise with Boxplots
boxplot(studentData$Mathematics, main = "Mathematics")
boxplot(studentData$History, main = "History")
boxplot(studentData$Geography, main = "Geography")
#
# Visualise with Histograms
hist(studentData$Mathematics, main = "Mathematics", xlab = "Score")
hist(studentData$History, main = "History", xlab = "Score")
hist(studentData$Geography, main = "Geography", xlab = "Score")
#
# Check Normality with Shapiro Wilk Test
shapiro.test(studentData$Mathematics)      # p < 0.05 Not normal
shapiro.test(studentData$History)          # p > 0.05 Normal
shapiro.test(studentData$Geography)        # p > 0.05 Normal

