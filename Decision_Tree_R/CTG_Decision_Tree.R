install.packages("party")
library(party)
ctg <- read.csv("CTG.csv")
head(ctg)
ctg$NSP=as.factor(ctg$NSP)


View(ctg)
set.seed(1111)
ctg_s <- sample( 2, nrow(ctg), replace = T, prob = c(0.8,0.2))
ctg_train <- ctg[ ctg_s == 1 , ]
ctg_test <- ctg[ ctg_s == 2 , ]

summary(ctg_train)


ctg_dt <- ctree( NSP ~ . , data = ctg_train, controls = ctree_control(mincriterion = .90, minsplit = 300))
plot(ctg_dt)

ctg_dt_predict <- predict( ctg_dt, ctg_test , type = "response")
ctg_dt_predict

ctg_DT_DF  <- data.frame( ctg_dt_predict , ctg_test$NSP)

predict_table <- table(ctg_dt_predict, ctg_test$NSP)
predict_table

DT_Accuracy <- sum(diag(predict_table))/ sum(predict_table) * 100
DT_Accuracy


# over sampling 
table(ctg_train$NSP)

# do samlping increase the records for class which is under represented 
# (only on the train data)
# do prediction on test data 

aa <- ctg_train[ ctg_train$NSP == 3 , ]   # Contains the records only for the class 3
aa

bb <- ctg_train[ ctg_train$NSP == 2 , ]   # Contains the records only for the class 2
bb

ctg_train1 <- rbind(ctg_train, aa,aa,aa,aa,aa,aa,bb,bb)
table(ctg_train1$NSP)

# Again apply dT

ctg_dt <- ctree( NSP ~ . , data = ctg_train1, controls = ctree_control(mincriterion = .90, minsplit = 300))
plot(ctg_dt)

ctg_dt_predict <- predict( ctg_dt, ctg_test , type = "response")
ctg_dt_predict

ctg_DT_DF  <- data.frame( ctg_dt_predict , ctg_test$NSP)

predict_table <- table(ctg_dt_predict, ctg_test$NSP)
predict_table

DT_Accuracy <- sum(diag(predict_table))/ sum(predict_table) * 100
DT_Accuracy

