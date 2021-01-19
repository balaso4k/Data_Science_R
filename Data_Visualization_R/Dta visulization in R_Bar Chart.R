# Create he Data For the chart

H  <- c(43,12,25,7,51)

# Plot the bar chart 

barplot(H)


# BAr with labels, titles & colours
 
H <- c(20,12,70,55)

M <- c("Delhi", "Beiging", "Tokyo", "Moscow")

barplot(H, xlab = "Month", ylab = "Happiness Index", col = "red", names.arg = M, main = "Happiness Index", border = "red")


# Horizontal R bar chart 

barplot(H,xlab = "Month", ylab = "Happiness Index",horiz = TRUE , col = "red", names.arg = M,main = "Happiness Index",border = "red")



# Stacked Bar plot with color & legend 

counts <- table(mtcars$vs, mtcars$gear)
counts
 
barplot ( counts,  main = "Cars Distribution By Gears & VS", xlab = "No of Gears", col =c("darkblue","red") ,legend = rownames(counts))



#Grouped Bar Plot with color & legend

counts<- table(mtcars$gear,mtcars$vs)

barplot(counts, main = "Cars Distribution By Gears & VS", xlab = "No of Gears",col = c("darkblue","red"), legend=rownames(counts), beside = T) 
