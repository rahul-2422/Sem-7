library(readr)
dataset <- read.csv("/home/rahul/Drive-D/clg/7/ida/world_happiness_data_2021.csv")
# View(dataset)

numeric_cols <- sapply(dataset, is.numeric)

# for(i in names(dataset)[numeric_cols]){
#   boxplot(dataset[[i]],
#           main=i
#           )
#   print(i)
# }

quartiles <- quantile(dataset$Ladder.score, probs=c(.25, .75), na.rm=FALSE)
IQR <- IQR(dataset$Ladder.score)

Lower <- quartiles[1] - 1.5*IQR
Upper <- quartiles[2] + 1.5*IQR 

data_no_outlier <- subset(dataset, dataset$Ladder.score > Lower & dataset$Ladder.score < Upper)

for(i in names(dataset)[numeric_cols]){
  boxplot(dataset[[i]],
          main=i
  )
  print(i)
}

# print(names(dataset)[numeric_cols])
