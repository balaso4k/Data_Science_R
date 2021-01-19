library(e1071)

ctg <- read.csv("CTG.csv")
head(ctg)
ctg$NSP=as.factor(ctg$NSP)




set.seed(1111)
ctg_s <- sample( 2, nrow(ctg), replace = T, prob = c(0.8,0.2))
ctg_train <- ctg[ ctg_s == 1 , ]
ctg_test <- ctg[ ctg_s == 2 , ]

summary(ctg_train)

# apply naiveBayes

model_ctg_nb <- naiveBayes(NSP ~ . , data = ctg_train)
model_ctg_nb

ctg_predict_nb <- predict( model_ctg_nb, ctg_test )
ctg_predict_nb

ctg_predict_nb_dt <- data.frame(ctg_predict_nb,ctg_test$NSP)
ctg_predict_nb_dt

ctg_predict_nb_table <- table(ctg_predict_nb,ctg_test$NSP)
ctg_predict_nb_table

nb_accuracy <- sum(diag(ctg_predict_nb_table))/ sum(ctg_predict_nb_table)*100
nb_accuracy


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


# Again apply naiveBayes


model_ctg_nb <- naiveBayes(NSP ~ . , data = ctg_train1)
model_ctg_nb

ctg_predict_nb <- predict( model_ctg_nb, ctg_test )
ctg_predict_nb

ctg_predict_nb_dt <- data.frame(ctg_predict_nb,ctg_test$NSP)
ctg_predict_nb_dt

ctg_predict_nb_table <- table(ctg_predict_nb,ctg_test$NSP)
ctg_predict_nb_table

nb_accuracy <- sum(diag(ctg_predict_nb_table))/ sum(ctg_predict_nb_table)*100
nb_accuracy

