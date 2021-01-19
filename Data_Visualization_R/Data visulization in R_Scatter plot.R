# Creating Scatter Plot

#Plot the chart for cars with Weight between 3.5 to 5 & mileage between 15 to 30.

input <- mtcars[ , c('wt', 'mpg')] 


plot( x=input$wt, y=input$mpg, xlab = "Weight", ylab = "Mileage", xlim = c(3.5,5), ylim = c(15,30), main = "Weight vs Mileage")


#Scatter Plot Matrix In R


input <- mtcars[ , c('wt','disp', 'cyl', 'mpg')]

pairs(  formula = ~wt+mpg+disp+cyl, data=mtcars, main = "Scatterplot Matrix")
