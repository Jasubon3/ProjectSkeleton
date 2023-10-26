#### Indian Weather Repo

library(readr)
IndianWeatherRepository <- read_csv("~/Desktop/ProjectSkeleton/IndianWeatherRepository.csv")
IndianWeather <- IndianWeatherRepository

# Temperature trend
library(ggplot2)
ggplot(IndianWeather, aes(x = last_updated, y = temperature_celsius)) +
  geom_line() +
  labs(title = "Temperature Trends over Time", x = "Date", y = "Temperature (°C)")

# Weather Conditions
library(ggplot2)
ggplot(IndianWeather, aes(x = condition_text)) +
  geom_bar() +
  coord_flip() +
  labs(title = "Weather Conditions", x = "Count", y = "Condition")

# Detecting Outliers
z_scores_temperature <- scale(IndianWeather$temperature_fahrenheit)
  # Define the threshold
threshold <- 2
outliers_temperature <- which(abs(z_scores_temperature) > threshold)
outliers_data <- IndianWeather[outliers_temperature, ]


library(ggplot2)

ggplot(data = IndianWeather, aes(x = longitude, y = latitude, color = temperature_celsius)) +
  geom_point() +
  scale_color_gradient(low = "blue", high = "red", name = "Temperature (Celsius)") +
  labs(title = "Temperature Variation by Location in India")

# Principal Component Analysis
selected_variables <- IndianWeather[, c("temperature_celsius", "humidity", "wind_mph")]
scaled_data <- scale(selected_variables) 

pca_result <- princomp(scaled_data)
# View the loadings for the first two principal components
loadings(pca_result)[, 1:2]

# Extract PC scores
pc_scores <- pca_result$scores

# Create scatter plot of PC1 vs. PC2
plot(pc_scores[, 1], pc_scores[, 2], 
     xlab = "Principal Component 1", ylab = "Principal Component 2",
     main = "Scatter Plot of PC1 vs. PC2")





# Clustering

num_clusters <- 3
kmeans_result <- kmeans(scaled_data, centers = num_clusters)

cluster_assignments <- kmeans_result$cluster
table(cluster_assignments)

# Assuming PC1 and PC2 are the first two principal components
plot(pc_scores[, 1], pc_scores[, 2], 
     col = cluster_assignments, pch = 16,
     xlab = "Principal Component 1", ylab = "Principal Component 2",
     main = "Clustered Data (PC1 vs. PC2)")
legend("topright", legend = unique(cluster_assignments), col = 1:length(unique(cluster_assignments)), pch = 16)





#Hierarchical Clustering

hc_result <- hclust(dist(scaled_data, method = "euclidean"), method = "complete")
plot(hc_result, main = "Dendrogram for Hierarchical Clustering", xlab = "Index", ylab = "Distance")
cluster_assignments <- cutree(hc_result, k = num_clusters)






