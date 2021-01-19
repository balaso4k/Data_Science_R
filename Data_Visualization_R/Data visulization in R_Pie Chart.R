# Create data for the Graph

x <- c(44,12,39,53)

labels <- c("California","Paris","Moscow","Mumbai")

# Plot the chart

pie(x,labels)


#Pie chart with labels & respective percentage

x  <- c(32,12,30,45)

labels <- c("California","Paris","Moscow","Mumbai")

pct <- round(x/sum(x)*100)

lbls <- paste(labels, pct)  #add percents to labels

lbls <- paste(lbls, "%", sep="")  #ad % to lalels

pie(x,labels = lbls, col=rainbow(length(lbls)), main = "City_Pie_Chart")



# Pie Chart with Legends

pie(x,labels=lbls, col=rainbow(length(lbls)), main="City_Pie_Chart")

legend("topright", c("California", "Paris", "Moscow", "Mumbai"), cex=0.5, fill=rainbow(length(x)))


# 3D Pie Chart in R

install.packages("plotrix")

library(plotrix)

pie3D(x,labels=lbls,explode=0.1,main="City_Pie_Chart")
