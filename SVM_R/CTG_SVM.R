ctg <- read.csv("CTG.csv")
head(ctg)
ctg$NSP=as.factor(ctg$NSP)




set.seed(1111)
ctg_s <- sample( 2, nrow(ctg), replace = T, prob = c(0.8,0.2))
ctg_train <- ctg[ ctg_s == 1 , ]
ctg_test <- ctg[ ctg_s == 2 , ]

summary(ctg_train)

# apply naiveBayes

library(e1071)
model_ctg_svm <- svm(NSP ~ . , data = ctg_train)
model_ctg_svm

ctg_predict_svm <- predict( model_ctg_svm, ctg_test )
ctg_predict_svm

ctg_predict_svm_dt <- data.frame(ctg_predict_svm,ctg_test$NSP)
ctg_predict_svm_dt

ctg_predict_svm_table <- table(ctg_predict_svm,ctg_test$NSP)
ctg_predict_svm_table

nb_accuracy <- sum(diag(ctg_predict_svm_table))/ sum(ctg_predict_svm_table)*100
nb_accuracy
