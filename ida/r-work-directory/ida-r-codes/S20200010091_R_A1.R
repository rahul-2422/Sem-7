# Step 1
current_directory <- getwd()
print(current_directory)
data <- read.csv("world_happiness_data_2021.csv")
print(data)

# Step 2 & 3
n_cols <- ncol(data)
for (col_index in 3:n_cols) {
  row_index <- 1
  Min <- quantile(data[1:nrow(data), col_index], 0.25) - (1.5 * IQR(data[1:nrow(data), col_index]))
  Max <- quantile(data[1:nrow(data), col_index], 0.75) + (1.5 * IQR(data[1:nrow(data), col_index]))
  while (row_index <= nrow(data[col_index])) {
    if (data[row_index, col_index] < Min | data[row_index, col_index] > Max) {
      data <- data[!(data[col_index] == data[row_index, col_index]), ]
    }
    row_index <- row_index + 1
  }
}

for (col_index in 3:n_cols) {
  boxplot(data[col_index])
}

# Step 4
for (i in 3:n_cols) {
  if (sd(data[, i]) == 0) {
    print(data[i])
    drop_cols <- data[i]
  }
}

data <- data[!data %in% drop_cols]

correl_data <- cor(data[3:ncol(data)], use = "complete.obs")
high_crr <- 0
for (i in 3:ncol(data)) {
  for (j in 3:ncol(data)) {
    if (i != j) {
      corr_value <- cor(data[i], data[j])
      if (corr_value[1] > 0.90) {
        high_crr <- append(high_crr, j)
      }
    }
  }
}

drop_cols <- data[6]
data <- data[!data %in% drop_cols]
drop_cols <- data[5]
data <- data[!data %in% drop_cols]
drop_cols <- data[3]
data <- data[!data %in% drop_cols]

# Step 5
life_span <- data[, "Healthy.life.expectancy"]
low_lim <- 45
high_lim <- 80
min_val <- min(data[, "Healthy.life.expectancy"]) 
max_val <- max(data[, "Healthy.life.expectancy"])

for (i in 1:nrow(data)) {
  scaled <- (((life_span[i] - min_val) / (max_val - min_val)) * (high_lim - low_lim) + low_lim)
  life_span[i] <- scaled
}

hist(life_span, main = "Histogram-Plot", xlab = "Life Span")

# Step 6
new_dataframe <- data[1:3]
row_index <- 1
for (row_index in 1:nrow(data)) {
  sum_values <- (data[row_index, 4] + data[row_index, 5] + data[row_index, 6] + data[row_index, 7] + data[row_index, 8] + data[row_index, 9] - data[row_index, 16])
  new_dataframe[row_index, 3] <- sum_values
}
new_dataframe

regions <- c("Central and Eastern Europe", "Commonwealth of Independent States", "East Asia", "Latin America and Caribbean", "Middle East and North Africa", "South Asia", "Southeast Asia", "Sub-Saharan Africa", "Western Europe")
for (region_index in 1:length(regions)) {
  
  region_data <- data.frame(matrix(ncol = 3, nrow = 0))
  colnames(region_data) <- c('Country', 'Region', 'Rank')
  count <- 1
  for (row_index in 1:nrow(new_dataframe)) {
    if (new_dataframe[row_index, 2] == regions[region_index]) {
      region_data[count, ] <- c(new_dataframe[row_index, 1], new_dataframe[row_index, 2], new_dataframe[row_index, 3])
      count <- count + 1
    }
    row_index <- row_index + 1
  }
  region_data
  
  cat("Maximum happiness country in the region: ", regions[region_index], " is:\n")
  cat(region_data[which(region_data$Rank == max(region_data$Rank)), 1], "\n")
  
  cat("Minimum happiness country in the region: ", regions[region_index], " is:\n")
  cat(region_data[which(region_data$Rank == min(region_data$Rank)), 1], "\n")
  
  median_values <- 0
  for (i in 1:(length(region_data) - 1)) {
    median_values <- append(median_values, data[1, 3])
  }
  
  cat("Median happiness country in the region: ", regions[region_index], " is:\n")
  cat(region_data[which(region_data$Rank == median(region_data[2:(length(median_values) - 1), 3])), 1], "\n")
}
# 
