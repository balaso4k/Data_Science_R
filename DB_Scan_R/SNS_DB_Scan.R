install.packages("dbscan")
library(dbscan)

sns <- read.csv("snsdata.csv",stringsAsFactors = T)

summary(sns)

colSums((is.na(sns)))

table(sns$gender)
sns$gender[is.na(sns$gender)] <- "F"
sns$age[is.na(sns$age)] <-  mean(sns$age, na.rm = T)

sns$gender <- as.numeric(sns$gender)

sns <- na.omit(sns)

normalize <- function(x) {
  return((x - min(x))/(max(x) - min(x)))
}

sns1 <- apply(sns, 2, normalize)

sns_dbscan1 <- dbscan(sns1, eps = 0.5, minPts = 5)
sns_dbscan1


sns_dbscan2 <- dbscan(sns1, eps = 0.4, minPts = 5)
sns_dbscan2

sns_dbscan3 <- dbscan(sns1, eps = 0.3, minPts = 5)
sns_dbscan3


system.time(dbscan(sns1, eps = 0.5, minPts = 5)) # For knowing how much time required for the getting output because it takes extra time

