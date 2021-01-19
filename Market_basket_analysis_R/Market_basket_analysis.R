install.packages("arules")
library(arules)
data("Groceries")
head(Groceries)
View(Groceries)
summary(Groceries)

rules <- apriori(Groceries,parameter = list(supp=0.001,conf=0.8))
rules
summary(rules)
inspect(rules[1:15])
rules1 <- apriori(Groceries,parameter = list(supp=.001,conf=.8),appearance = list(rhs="other vegetables",default="lhs"))
rules1 
inspect(rules1)
rules2 <- apriori(Groceries,parameter = list(maxlen=3,supp=.001,conf=.8)) ##only those rules which have max of 3 txn
rules2
inspect(rules2)


#===========================================================================================



cos <- read.csv("Cosmetics.csv")
rules_cos <- apriori(cos,parameter = list(supp=0.7,conf=0.8))
inspect(rules_cos)


rules_cos2 <- apriori(cos,parameter = list(conf=0.6,minlen=3),appearance = list(rhs=c("Foundation=Yes"),default="lhs"))
summary(rules_cos2)
inspect(rules_cos2)



