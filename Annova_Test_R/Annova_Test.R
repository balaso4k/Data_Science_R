### Example  a food chain is testing and want to introduce 3 new items(samosa,vada, PauBaji) in the market
## they want to know that if all the 3 items are equally popular. for this they pickup
## 21 diffrent resturant. each item is made avilaible at 7 diffrent resturants


RT <- read.csv("restuarnt.csv")

RT_stack <- stack(RT) 
names(RT_stack) <- c("Salecount", "Dishname")

RT_Annova <- aov(Salecount ~ Dishname, data = RT_stack)
summary(RT_Annova)
