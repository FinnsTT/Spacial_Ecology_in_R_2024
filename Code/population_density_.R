#how to calculate the density of individuals in a population

#installing the spatstat package
install.packages("spatstat")

#recalling the package
library(spatstat)

# let's use the bei data:
# data description:
# https://CRAN.R-project.org/package=spatstat  #non ho capito come si trova bei

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


plot(bei)
densitymap <- density(bei)
plot(densitymap)
plot(bei)
plot(densitymap)
plot(bei)  #non ho capito cosa sta succedendo 15 mins into the recording

plot(densitymap)
points(bei, col=green, cex=.5) #per cambiare dimensione e colore 

elev <- bei.extrs [[1]] #posso anche scrivere elev<-bei.extra$elev ma almeno così non devo ricordarmi il nome ma boh non funziona

#passing to points to a counting surface
#par function r to build multifraim to maps one besides the other 
par(mfrow=c(1,2))  #mf = multiframe, row = how many rows, ne ho due perchè elevation e density li devo mettere sulla stessa fila. I have now, and 2 for the 2 colors. i can use C for concatenate the elemenents
#devo scrivere questo codice e poi i due plot sotto
plot(elev)
plot(densitymap)

#esercizio, make a multiframe with maps one non top of the other 
par(mfrow=c(2,1))
plot(elev)
plot(densitymap)

dev.off() #one frined to clear graphs

#canging colors to maps  #http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
cl <- colorRampPalette(c("black", "blue", "red")) (3) #esempio metto tre colori, " per i colori. tutti concatenati in c 
plot(densitymap, col=cl)   

cl <- colorRampPalette(c("black", "blue", "red")) (100) #per renderlo più smooth
plot(densitymap, col=cl)   #non ho capito perchè questo va specificato

#ESERCIZIO cambia color palette
cl <- colorRampPalette(c("palegreen1", "darkorchid4", "darkorchid3")) (100) 
plot(densitymap, col=cl) 

#ESERCIZIO build a multiframe and plot the densitymap with two different color ramp palette next to each other 

par(mfrow=c(2,1)) #for the multiframe 
cl <- colorRampPalette(c("darkseagreen1", "bisque4", "darkorchid4")) (100) #for the colors


par(mfrow=c(1,2)) #1 row and 2 colors
cl <- colorRampPalette(c("darkseagreen1", "bisque4", "darkorchid4")) (100)
plot(densitymap, col=cl) 
clg <- colorRampPalette(c("coral4", "cornflowerblue", "cornsilk2")) (100)
plot(densitymap, col=clg) 

dev.off()  


#i needed all of this to use packages outside R, using vector files and then coordinating them 
