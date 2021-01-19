#Simple Line Plot

v <- c(8,14,26,5,43)
plot(v, type = "o")


# Line Plot with title, color & labels 

v <- c(12,1,25,42,56,10,20)

plot(v, type = "o", xlab = "Month", ylab = "Rain Fall", col= "red", main = "Rain Fall Chart")



# Line Plot With Multiple Lines

v <- c(12,15,19,29,30,45)

t <- c(14,16,18,25,34,40)

f <- c(16,17,25,29,18,22)
 
plot(v , type = "o",xlab = "Month", ylab = "Rain Fall", col = "red", main = "Rain Fall Chart")

lines(t, type = "o", col = "blue")

lines(f, type = "o", col = "green")
     