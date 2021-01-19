sns <- read.csv("snsdata.csv",stringsAsFactors = T)

dim(sns)

summary(sns)

colSums((is.na(sns)))

table(sns$gender)
sns$gender[is.na(sns$gender)] <- "F"
sns$age[is.na(sns$age)] <-  mean(sns$age, na.rm = T)

sns$gender <- as.numeric(sns$gender)


# K-Means 

kmeans_sns <- kmeans(sns, 4, iter.max = 10, nstart = 1)

View(data.frame(kmeans_sns$centers))



num <- seq(1:8)
list1 <- list()
for ( i in num ){
  kmeans_sns <- kmeans(sns, i, iter.max = 10, nstart = 1)
  
  list1 <- append(list1,kmeans_sns$tot.withinss)
}
ab = unlist(list1)
ab
plot(ab, 
     col="red",
     type = "b",
     pch = "*" )


kmeans_sns$cluster

sns1 <- cbind(sns, kmeans_sns$cluster)
View(sns1)
