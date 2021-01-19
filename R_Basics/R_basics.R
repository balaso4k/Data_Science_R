

#-----------------------------Entering Input & Print-------------------------------------


xx <- 48      
print(xx)            # Explicit Printing

xy <- 48      
xy                   # Auto Printing 


  

#------------------------------Data Types----------------------------------------

# Numeric Data type
xxx <- 56     
xxx

# Integer data type

xyz <- as.integer(4)
xyz

pq <- as.integer(12.7)
pq                       # Print the integer of numeric value passed


# Complex Data type

bc <- 1+2i 
bc

# Logical Data type 

pm <- 9 ; qm <- 12
wz = pm > qm
wz


# Character Data type

mn <- "Good Morning"      # In Double Quote 
mn

ln <- 'INDIA'             # In single Quote 
ln




#---------------------------Vector--------------------------------------

#Creating Vectors Using c() function

A <- c( 4,2,43,45,32,53,23 )                     
A


#Creating a vector using : operator

ab<- 45:65
ab

# Types of vector

# 1) Numeric Vector

a <- c( 4,2,43,45,32,53,23 )                     
a

typeof(a)               #  see the type of  vector


# 2) Logical Vector

b <- c( TRUE, FALSE,FALSE,TRUE,FALSE )         
b

typeof(b)
     
# OR

d <- c( T,F,T,T,F,T,F,F,T )
d

typeof(d)


# 3) Character Vector 

e <- c( "Mechanical","Computer","Electrical","Civil" )
e

typeof(e)


# 4) Integer Vector

f <- 14:22
f

typeof(f)

# 5) Complex Vector

ff <-  c( 1+6i, 1+4i, 4+7i )
ff

typeof(ff)

#----------------------Mixing Objects-------------------------------------------

g <- c( 74, "B", 65, "G")       # Numeric & Character
g


h <- c( TRUE, 52, 97, FALSE)    # Numeric & Logical
h

i <- c( "A", TRUE, "K", FALSE)  # Logical & Character
i

j <- c( FALSE, "W", 25, 1:5 )  # Logical,Character, Numeric & Integer 
j


#----------------------Explicit Coercion----------------------------------------

k <- 0:3
k

class(k)

as.numeric(k)

as.logical(k)

as.character(k)


#-----------------------Matricrs------------------------------------------------

# Matrix creation by providing No of Rows & No of columns

l <- matrix( 11:20, nrow = 2, ncol = 5)
l


# Matrix creates by column wise i.e default

m<- matrix(c( 14:25 ), nrow = 3 )    
m

# Matrix creates by Row wise

n<- matrix( c( 35:46 ), nrow = 3, byrow = TRUE )
n
 
# Naming Matrix rows & columns

column.names <- c( "Col.1","Col.2","Col.3", "Col.4" )

row.names <- c( "Row 1","Row 2","Row 3" )

matrix.result <- matrix(c(35:46),   nrow = 3,   byrow = TRUE,  dimnames = list(row.names,column.names))
matrix.result




# Matrices can also be created directly from vectors by adding a dimension attribute.

o <- 40:49
o

dim(o) <- c( 2,5 )
o

#Matrices can be created by column-binding or row-binding with the cbind() and rbind() functions.

p <- 14:16
q <- 24:26

cbind(p,q)      

rbind(p,q)

#----------------------------Array------------------------------------------------------------------------------------------


pp <- c(7,10,25)
qq <- 20:30                                           # Create two vectors of different lengths.

array1 <- array(c(pp,qq))                             # Take these vectors as input to create an array.
array1                                                   
array2 <- array(c(pp,qq), dim = c (2,7))
array2

array3 <- array(c(pp,qq), dim = c (2,7,2))            # Create an array of two 2×7 matrices each with 2 rows and 7 columns
array3 


#-------------------------Data Frames---------------------------------------------------------------------------------------

employee <- c( "Suresh","Ganesh","Dinesh" )

salary <- c(18000, 20000, 35000)

startdate <- as.Date(c("2017/04/11","2018/05/05","2014/10/09"))

employ_data <- data.frame(employee, salary, startdate)
employ_data

View(employ_data)

str(employ_data)

dim(employ_data)

nrow(employ_data)

ncol(employ_data)


#-----------------------List------------------------------------------------------------------------

list.data <-list("orange", TRUE, 12.6, 1+10i)
list.data

#-------------------Factors------------------------------------------------------------------

r <- factor( c("Apple", "Mango", "Apple", "Orange","Apple", "Orange"))
r                                      #Levels are put in alphabetical order

table(r)                               #Gives quantity wise distribution

unclass(r)


#--------------------------Handling Missing Values------------------------------------------------------------

s<- c( 4,45,65,23,NA,42 )                     # Return a logical vector which elements are NA
is.na(s)



t <- c( 25,45,7,8,4,8,2,8,5 )                # Return a logical vector which elements are NaN
is.nan(t)


u <- c( 45,374,7289,99,3632,NaN,NA,63 )      # Return a logical vector which elements are NA & NaN
is.na(u)


w <- c( 46,93,23,45,38,NaN,43,NA )           # Return a logical vector which elements are NA & NaN
is.nan(w)





#------------------------------Data Frame-----------------------------------------------------


x<- data.frame( A = 12:15, B = c( "Red", "Blue", "Black", "Green")) 
x

nrow(x)

ncol(x)



#----------------------------Name Assigning-------------------------------------------------------------------

# Name assigning names to an integer vector.

y <- 4:6
names(y) <- c("Four", "Five", "Six") 
y



# Name assigning names to an Lists 

x <- list(Pen = 6, Pencil = 10, Rubber = 13 ) 
x

 
# Name assigning names to an Matrices

a1<- matrix( c( 35:46 ), nrow = 3, byrow = TRUE )
a1

column.names <- c( "Col.1","Col.2","Col.3", "Col.4" )

row.names <- c( "Row 1","Row 2","Row 3" )

matrix.result <- matrix(c(35:46),   nrow = 3,   byrow = TRUE,  dimnames = list(row.names,column.names))
matrix.result



#------------Getting Data In and Out of R-----------------------


getwd() # get the working directory and paste the files which we want to read




data1 <- read.csv("LungCapData.csv")
data1

#Reading in Larger Datasets with read.table()

initial <- read.csv("LungCapData.csv", nrows = 30)
initial

classes <- sapply(initial, class)
classes

tabAll <- read.csv("LungCapData.csv", colClasses = classes)
tabAll


# Using the readr Package replacements for functions like read.table() and read.csv()

library(readr)

data2 <- read_csv("LungCapData.csv")
data2


data3 <- read_csv("LungCapData.csv", col_types = "ccc")  # No of c gives the no of columns
data3

data4 <- read_csv("LungCapData.csv", n_max = 15)        # n_max  gives the no of rows 
data4



#-----------Using Textual and Binary Formats for Storing Data-------------------------------------------

#Using Textual/Using dput() and dump()

b1 <- data.frame( a = 1, b = "a" )   # Create a Data Frame
dput( b1 )                          

dput( b1, file = "b1.R" )            # Send dput output to file

new.b1 <- dget( "b1.R" )              # Read in dput output from a file
new.b1

# Multiple objects can be deparsed at once using the dump function and read back in using source.

c1 <- "Apple"
d1 <- data.frame( a = 1L, b = "G" ) 

# We can dump() R objects to a file by passing a character vector of their names.

dump( c( "c1", "d1" ), file = "data.R" ) 
rm( c1, d1 )

#The inverse of dump() is source().

source( "data.R" )
str( d1 )
c1
#-------------------------------------


# Using Binary Formats

e1 <- data.frame(x = rnorm(50), y = runif(50))
f1 <- c( 9, 5.6 , 8 /7 )

# Save 'e1' and 'f1' to a file
save(e1, f1, file = "mydata.rda") 
 
# Load 'e1' and 'f1' into your workspace
load("mydata.rda")              

#----------------------------------------------------------------


#If you have a lot of objects that you want to save to a file, you can save all objects in your workspace using the save.image() function.

# Save everything to a file

save.image(file = "mydata.RData")   
 
# load all objects in this file

load("mydata.RData")                


#--------------------------------------------------------------------------

#When you call serialize() on an R object, the output will be a raw vector coded in hexadecimal format.

g1 <- list(1, 2, 3)
serialize(x, NULL)




#-------------------Subsetting R Objects--------------------------

# Subsetting Vectors 

# Using Positive integer

h1 <- c(51,52,53,54,55,56,57,58,59,60)
h1

h1[c(7)]                # Gives 7th value from x

h1[c(8,4)]              # Gives the 8th & 4 th value from x

h1[c(9,9)]              # For duplicate indies

h1[c(6.1,5.7)]          # Real no. slightly truncated to integers



#Using Negative integer 

i1 <- c(41,42,43,44,45,46,47,48,49,50)
i1

i1[-c(4)]              # Skip 4th value from a

i1[-c(5,2)]            # Skip 5th && 2nd value from a


# Using logical Operator method

j1 <- c(21,22,23,24,25,26,27,28,29,30)

j1[c(TRUE,FALSE,TRUE,FALSE)]


# Based on Condition

k1 <- c(11,12,13,14,15,16,117,18,19,20)

k1[d<14]            # Values less than 14

k1[d>16]            # Values greater than 16

k1[d==15]           # Values equal to 15

k1[d<6]             # Values less than 6

k1[]                # With nothing 

k1[0]               # With zero   



# Matrix Subsetting


l1 <- matrix(c(14:25), nrow = 3, byrow = TRUE)
l1

column.names <- c("Col.1","Col.2","Col.3", "Col.4")

row.names <- c("Row 1","Row 2","Row 3")

matrix.result <- matrix(c(14:25),   nrow = 3,   byrow = TRUE,  dimnames = list(row.names,column.names))
matrix.result




print(matrix.result[2,4])                        # Access the 2nd row & 4th column value

print(matrix.result[3, ])                        # Access only 3rd row & all columns

print(matrix.result[,1])                         # Access only 1st column & all rows

print(matrix.result[1,2, drop = FALSE])          # dropping matrix dimensions, Access the 1st row & 2nd column value 

print(matrix.result[ ,3 , drop = FALSE])         # dropping matrix dimensions, Access  3rd column  




#Data Frame/List subsetting


subject <- c("English", "Maths", "Chemistry", "Physics")
percentage <- c(60,70,75,90)
students_df <- data.frame(subject,percentage)
students_df


students_df[["subject"]]

# or

students_df$subject


students_df[["percentage"]]

# or

students_df$percentage


students_df[[c(2,4)]]        # Nested element from list


students_df[c(1,2)]          # Extracting multiple elements of list


#------------------------Removing NA Values---------------------------

# From Simple R object 

m1 <- c(6,5,34,7,NA,23,45,NA,93,95,98,NaN)

bad <- is.na(m1)

print(bad)

m1[!bad]

# From Multiple R objests using complete.cases ()

n1 <- c( 55,NA, 4, NA, 12, 23, NaN )
o1 <- c("INDIA", NA, "JAPAN", NA, "USA", "NEPAL", NaN )

good <- complete.cases(n1, o1)
good

n1[good]

o1[good]


# From Data frames using complete.cases()


p1<- head(airquality)
View(p1)

good <- is.na(p1)

print(good)

p1[!good]



#--------------------------Manipulation--------------------------------------------

# Vector Manipulation 

q1 <- c(12,3,6,7,8)
r1 <- c(23,4,7,9,2)

add <- q1+r1         # Addition
add

sub <- q1-r1         # Subtraction
sub

mult <- q1*r1        # Multiplication
mult

div <- q1/r1         # Division
div


# Matrix Manipulation

s1 <- matrix(c(31:34), nrow = 2 )
t1 <- matrix(c(21:24), nrow = 2 )

add <- s1+t1             # Matrix addition
add


sub <- s1-t1             # Matrix subtraction
sub


mult <- s1*t1            # Matrix multiplication
mult


div <- s1/t1             # Matrix division
div


#------------------Date Handling in R----------------------------


u1 <- 365
class(u1) <- "Date"                 # Note - R takes initial date for date handling 01-01-1970 by default
u1

v1 <- -365
class(v1) <- "Date"
v1

# create date variable with as.date()

w1 <- as.Date( 1000, origin = as.Date("2020-11-04"))
w1

x1 <- as.Date( -1000, origin = as.Date("2020-11-04"))
x1


# Extracting year from a date variable

y1 <- 460
class(y1) <- "Date"
y1

as.numeric( format( y1, "%y" ))    # Lower Case of y returns 2 digit year

as.numeric( format( y1, "%Y" ))    # Upper Case of Y returns 4 digit year


# Extracting Month from a date variable

z1 <- 15648
class(z1) <- "Date"
z1

as.numeric( format( z1, "%m"))     # Print the No. of month 

format( z1, "%b")                  # Print the short character of month

format( z1, "%B")                  # Print the full character of month


# Extracting Week No. from a date variable

a2 <- 2356
class(a2) <- "Date"
a2

format( a2, "%W")                  # case of W is capital Print the week no.


# Character to date type

b2 <- "04 Nov 1994"
class(b2)  

mydateb2 <- as.Date( b2, format = "%d-%m-%y")
class(mydateb2)


# Comparing Dates

c2 <- as.Date( "01/01/2019", format = "%d/%m/%y")
d2 <- as.Date( "02/01/2019", format = "%d/%m/%y")
 
c2-d2                                  # Print Time difference in days 

c2>d2

c2<d2

c2==d2



#---------------------Managing Data Frames-------------------------------------

install.packages(dplyr)

library(dplyr)

data <- mtcars
data


dim( data )                                     # Shows basic characteristics of data                     

str( data )                                     # Shows basic characteristics of data                     
 
names( data )[ 2:5 ]                            # Shows 2,3,4,5 columns from data 

# Select Function

subdata <- select( data, wt:am )                # Shows columns from wt - am only
subdata

subdata1 <- select( data, -(cyl:drat))          # Omits the columns cyl - drat
subdata1

head(data)                                      # Shows top 6 Rows only
 
tail(data)                                      # Shows bottom 6 rows only

                                                    
e2 <- match( "mpg", names(data))                # Include the variables expect the variables mpg & wt        
f2 <- match( "wt", names (data))
head(data [ , -( e2:f2)]) 

# Filter function

airquality

airquality1 <- filter( airquality, Temp < 70 )
airquality1

airquality2 <- filter( airquality, Ozone < 40 , Solar.R >150)
select( airquality2, Ozone, Solar.R)

# Summary Function

summary( airquality2 )

# Arrange Function

airquality3 <- arrange( airquality, Temp )       # Arrange the data set by temp from low to high i.e. ascending order
airquality3

airquality4 <- arrange(airquality, desc(Temp))   # Arrange the data set by temp from high to low i.e. descending order
airquality4

# Rename function

airquality5 <- rename( airquality,  Layer = Ozone, Radiation = Solar.R   )
airquality5

# Mutate Function

airquality6 <- mutate( airquality, Ozone1 = Ozone - mean( Ozone, na.rm = TRUE))
head(airquality6)


airquality7 <- transmute(  airquality, New_Wind = Wind - mean(Wind, na.rm = T ),New_Temp = Temp - mean(Temp, na.rm = T) ) 
airquality7                          
                

# Grouped_by Function

data <- mtcars
data

dim(data)

str(data)

names(data)


cyl <- group_by(data, cyl)      # Group the data frame by the cyl variable.

summarise(cyl, mean(disp), mean(hp))


# %>% function

data <- swiss
swiss
 
dim(swiss)

str(swiss)

names(swiss)

swiss %>%
select( Agriculture, Examination ) %>% head  #elect two columns (Agriculture  and Examination) and then pipe the new data frame to the function head() 



#------------------------Control Structure-----------------------------------------------------------------------------------------

# if Statement

g2 <- 36
if (g2>0)
{  print ( "This is positive number")}


# if else ststement

h2 <- -23

if (h2>=0)
  
{print(" This is Positive value")
  
}else{
  
  print("This is Negative value")}



# ifelse() Function

i2 <- 41:48

ifelse( i2 > 45, "Greater","Smaller")



# Nested if else statement

j2 <- -13

if (j2<0) {print("Negative Value")
  
}else if (j2>0) {print("Positive Value")
  
}else print("This is Zero")


# For Loops 

for(i in 1:10) {
  print(i)
}

k2 <- c("a", "b", "c", "d", "e", "f", "g", "h", "i")
for(i in 1:7) {
  print(k2[i])
}

for(letter in k2) {
  print(letter)
}

for(i in 3:9) print(k2[i])


# Nested for loops

l2 <- matrix(1:6, 2,3)

for (i in seq_len(nrow(l2))){
  
  for (j in seq_len(ncol(l2))){ print(l2[i,j])
    
  }
  
}


# while loop statement

m2 <- 1

while (m2 <=10) {
  
  print(m2*m2)
  
  m2=m2+1
  
}


# Switch Statement

n2 <- switch( 4 ,"First","Second","Third","Fourth")
n2


# Repeat loop

o2 <- 17

repeat {
  print(o2)
  o2 = o2+1
  if (o2 == 23){
    break
  }
}


# next   

for(p2 in 27:39) {
  
  if(p2 <= 33) {
    
    next
  }
  print(p2)
}

#break

for(q2 in 90:200) {
  
  print(q2)
  
  if(q2 > 119) {
    
    print(q2)
    
    break
  }
}



#-------------------Loop Functions-------------------------------------------------------------------------



# lapply

r2 <- list( x = 39:49, y = rep(4,8), c = rnorm(25))
r2

lapply(r2, sum)                # Result of lapply() was a list where each element had length 1

lapply(r2, mean)                

# sapply

s2 <- list( x = 39:49, y = rep(4,8), c = rnorm(25))
s2

sapply(s2, sum)              # Result of sapply() collapsed the output into a numeric vector

sapply(s2, mean)


# tapply

data(iris)
str(iris)

tapply( iris$Sepal.Length, iris$Species, mean )


# vapply

t2 <- c(71:82)
u2 <- c(24:36)
v2 <- c(42:53)

my_list <- list(t2,u2,v2)

vapply(my_list, median, numeric(1))

# mapply

list(rep(1, 5), rep(2, 4), rep(3, 3), rep(4, 2), rep(5,1))

mapply(rep, 1:5, 5:1)               #  First argument varies from 1 to 5, and the second argument varies from 5 to 1


# split

my_data <- mtcars
my_data

split(mtcars, mtcars$cyl)           # Split  mtcars data frame by the cyl variable 

# apply

w2 <- matrix(1:20, 4, 5)
w2

apply(w2, 2, sum)                   # Take the mean of each column. 2 means column here

apply(w2, 1, sum)                   # Take the mean of each row. 1 means row here.




