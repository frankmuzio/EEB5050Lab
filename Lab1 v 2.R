# setwd
setwd("C:/Users/frank/OneDrive/Desktop/EEB 5050")

library(MASS)

#1. use rnorm(), smulate 3 different samples of 10 numbers with mean 50 and sd 20

x1 <- rnorm(10, 50, 20)
x2 <- rnorm(10, 50, 20)
x3 <- rnorm(10, 50, 20)

print(x1)
print(x2)
print(x3)

# what is the object class of these stored values?
class(x1)
class(x2)
class(x3)

# what are the means of the three samples?
mean(x1)
mean(x2)
mean(x3)

# standard deviations of each sample?
sd(x1)
sd(x2)
sd(x3)

#dnorm() with x=50, mean=50, sd=20
dnorm(50,50,20)

# create and store a seq of numbers from 0-100 by 0.5
x <- seq(0,100,0.5)
print(x)


# estimate probability density for each number in seq given normal distribution
y <- dnorm(x, 50, 20)
print(y)

#plot sequence x by probability density y
plot(x, y, type="l")
#add red line at the mean for 3 samples
abline(v=x1, col="red" )
abline(v=x2, col="red")
abline(v=x3, col="red")


# 10. Create a for-loop that draws 500 samples of 10 numbers from the distribution in #1. For each sample, have the for-loop calculate the mean for the sample, store the mean into a storage object.
a <- rnorm(10,50,20)
vary <- numeric(500)

for(vary in a){
  print(mean(vary))
  }

# 11.

#12.





##########################################
### Exploring Data########################
##########################################

# 1. read worldflora.csv
flora <- read.csv("worldfloras.csv")
flora

# 2. what type of object is this
class(flora)  #data.frame

# 3. What class are each columns
head(flora)
class(flora$Country)
#character
class(flora$Latitude)
#integer
class(flora$Area)
#numeric
class(flora$Population)
#numeric
class(flora$Flora)
#integer
class(flora$Endemism)
#numeric
class(flora$Continent)
#character

# 4. How many countries have greater or equal to 5000 plant species?
x <- flora$Flora
y <- flora$Country

length(y[x>=5000])


# which country has the highest rate of endemism
e <- flora$Endemism
max(e)
y[e>=0.98]

# Of Asian countries, how many have >10% endemism and >3000 species?
asia <-subset(flora, Continent=="Asia"|Continent=="SE.Asia")
species <- subset(asia, Endemism>0.10 & Flora>3000)
print(species)
length(species)
nrow(species)

#7. What is the average lattitude of countries in 6
mean(species$Latitude) #17.5833

#8. use tapply()
tapply(X=flora$Flora, INDEX = list(flora$Continent), FUN=median)

#9. What is the sum of the population within each continent-group
tapply(X=flora$Flora, INDEX = list(flora$Continent), FUN=sum)

#10 How many countries are in this database for each continent?
tapply(X=flora$Country, INDEX = list(flora$Continent), FUN=length)
