vehicle <- read.csv("vehicle .csv")

head(vehicle)

pairs(vehicle[3:5])

# Multiple liner regression

results <- lm( lc ~ Mileage + lh, vehicle)
results

summary(results)




results <- lm( lc ~ lh, vehicle)
results

summary(results)
# Prediction

predict(results,data.frame( lh = 10), interval = "confidence")
