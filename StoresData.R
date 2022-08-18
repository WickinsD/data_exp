######################################################################
##### STORES DATA ####################################################
######################################################################

#setwd("F:/Kaggle_Projects/Stores_data")
Stores <- read.csv("Stores.csv", header=TRUE)
#Check it's all here!
head(Stores)
str(Stores)
tail(Stores)
is.na(Stores)
#Looks good!

attach(Stores)
str(Stores)
#Fix up a couple of the factor variables
Store.ID <- as.factor(Store.ID)
Store_Area <- as.factor(Store_Area)
str(Stores)
Stores$Store.ID <- factor(Stores$Store.ID)
str(Stores)
Stores$Store_Area <- factor(Store_Area)

#Get a feel for summary data of sales and customers
str(Stores)
summary(Stores)
#Now check to see if there are any NA cases
Stores[!complete.cases(Stores),]
#Good, a clean data set!
#Now practice some filtering.
#Suppose we want to identify all of the high earning stores ie:
#those in the top quartile
Stores[which(Stores$Store_Sales >71873),]

#those in the bottom quartile?
Stores[which(Stores$Store_Sales < 46530),]

nrow(Stores[which(Stores$Store_Sales > 71873),])
nrow(Stores[which(Stores$Store_Sales < 46530),])
#That's why they're quartiles!

#Now let's do some plotting for visualisation
library(ggplot2)
#Now let's get a graphical feel for the distribution of sales per calendar year.
#A histogram is probably a good start!

t <- ggplot(data = Stores, aes(x=Store_Sales))
t + geom_histogram(bins = 30, fill = "White", colour = "Blue")
#Roughly bimodal, with most stores heaped between 40,000 and 80,000.

#Now let's look at the distribution of customers through the doors.
r  <- ggplot(data = Stores, aes(x=Daily_Customer_Count))
r + geom_histogram(bins = 30, fill = "White", colour = "Red")
#Also somewhat bimodal, but perhaps a little more kurtosis.

#Now to see if customer count correlates with store sales.
j <- ggplot(data = Stores, aes(x = Daily_Customer_Count,
                               y = Store_Sales))
j + geom_point()


unique(Stores$Store_Area)
#I was hoping to get less unique values for Store_Area than that. 
#My intention is now to break the data up by quartiles into a list with 4 
#elements, perform separate visualisations and then explore them via a 
#facet grid!