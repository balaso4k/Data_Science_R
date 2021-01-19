
b_cancer <- read.csv("BreastCancer.csv", stringsAsFactors = T)
head(b_cancer) ; dim(b_cancer)
summary(b_cancer)

b_cancer$Bare.nuclei[ is.na(b_cancer$Bare.nuclei)] <- "0"

library(dplyr)

b_cancer <- mutate( b_cancer, Class1 = ifelse( Class == "malignant",1,0) )

b_cancer1 <- b_cancer[ ,c(3,4,5,6,7,8,9,10,11,13)]

b_cancer1$Class1 <- factor(b_cancer1$Class1)    


dim(b_cancer1)


set.seed(1111) # it dosent changes the sampling every time sampling fix any time regenerate same test and train sample & 1111 is only random no which ever we want take 
canc <- sample( 2, nrow(b_cancer1), replace = T, prob = c(0.8,0.2))
b_cancer1_train <- b_cancer1[canc == 1 , ]
b_cancer1_test <- b_cancer1[canc == 2 , ]

dim(b_cancer1_train)
dim(b_cancer1_test)

# Model Building
# function =  glm( y ~ . , data = DF)

model_canc <- glm( Class1 ~ . , data = b_cancer1_train ,family = binomial)
summary(model_canc)

table(b_cancer1_train$Class1,b_cancer1_train$Bl.cromatin  )

pred_val_canc <- predict(model_canc , b_cancer1_test, type = "response")
pred_val_canc

# Create the data frame of output
df_canc <- data.frame(pred_val_canc, b_cancer1_test$Class1)  
df_canc
colnames(df_canc)[2] <- "Actual_Value"

df_canc <- mutate( df_canc , Predicted = ifelse(pred_val_canc >= 0.5,1,0))
df_canc

tab1_canc <- table(df_canc$Predicted, df_canc$Actual_Value)
tab1_canc

sum(diag(tab1_canc)) / sum(tab1_canc) * 100 # gives the accuracy of the model

tpr <- 48/(48+9)
fpr <- 87/(87+2)
tpr
fpr

predict.glm_canc<- predict(model_canc, b_cancer1_train, type = "response") # prediction of train
pred_actual_canc <- data.frame(predict.glm_canc, b_cancer1_train$Class1)

pred_actual_canc <- mutate(pred_actual_canc, pred_val = ifelse(predict.glm_canc > 0.5,1,0))
colnames(pred_actual_canc)[2] <- "Actual"
pred_actual_canc <- na.omit(pred_actual_canc)

install.packages("ROSE")
library(ROSE)

roc.curve(pred_actual_canc$Actual, predict.glm_canc)


