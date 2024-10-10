#how to calculate the density of individuals in a population

#installing the spatstat package
install.packages("spatstat")

#recalling the package
library(spatstat)

#dataset
bei 


plot(bei)

plot(bei, pch=19)

plot(bei, pch=19, cex=5)

bei.extra
plot(bei.extra)

#extracting data
elevation <- bei.extra$elev
plot(elevation)

elevation <- bei.extra[[1]] #same extraction thing but without using the dollar 

#density map starting from individual points
densitymap <- density(bei)
densitymap   #i can just write this because i have already assign

plot(densitymap)  
points(bei)
points(bei, col="green")

