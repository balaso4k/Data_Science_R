# -----------------------Feature importance can also done by the rf
library(randomForest)
ctg <- read.csv("CTG.csv")
head(ctg)
ctg$NSP=as.factor(ctg$NSP)


View(ctg)
set.seed(1111)
ctg_s <- sample( 2, nrow(ctg), replace = T, prob = c(0.8,0.2))
ctg_train <- ctg[ ctg_s == 1 , ]
ctg_test <- ctg[ ctg_s == 2 , ]

summary(ctg_train)


ctg_rf <- randomForest(NSP ~ . , data = ctg_train , ntree = 750)
ctg_rf

pred_rf <- predict( ctg_rf , ctg_test )

tab_rf <- table(pred_rf , ctg_test$NSP)
tab_rf


importance(ctg_rf)






