
ctg <- read.csv("CTG.csv")
head(ctg)
ctg$NSP=as.factor(ctg$NSP)


set.seed(1111)
ctg_s <- sample( 2, nrow(ctg), replace = T, prob = c(0.8,0.2))
ctg_train <- ctg[ ctg_s == 1 , ]
ctg_test <- ctg[ ctg_s == 2 , ]

# Apply KNN 
library(class)

knn_ctg <- knn( train = ctg_train, test = ctg_test, cl = ctg_train$NSP, k=5)
knn_ctg


ctg_knn_DF  <- data.frame( knn_ctg , ctg_test$NSP)

predict_table <- table(knn_ctg, ctg_test$NSP)
predict_table

knn_DT_Accuracy <- sum(diag(predict_table))/ sum(predict_table) * 100
knn_DT_Accuracy




# create a for loop, run it for 1-50 
#create a empty list
# for i in run till 50
# plot the list 

# build the  
num <- seq(1:50)
list1 <- list()
for ( i in num ){
  knn_ctg <- knn( train = ctg_train, test = ctg_test, cl = ctg_train$NSP, k=i)
  pred_act_knn <- data.frame(knn_ctg,ctg_test$NSP)
  colnames(pred_act_knn) <- c("Pred","Actual")
  tab_knn <- table(pred_act_knn)
  list1 <- append(list1,sum(diag(tab_knn))/sum(tab_knn))
  }
aa = unlist(list1)
aa
plot(aa)

