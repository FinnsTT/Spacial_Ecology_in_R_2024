install.packages("terra")
library(terra)

install.packages("sdm")
library(sdm)

#let's learn how to make a subset of a subject
#once you have the packages, instal some dataset

file <- system.file("external/species.shp", package="sdm")  #going inside the sdm folder what's the / fror #what package are we using #and than name of the object
file #it will open i vari passaggi per arrivare al pacchetto

#there is a fanction to translate the file to a tipe of file that R can use and it's call 
#spatvector, the fanction is called vect
vect 

rana <- vect(file) #mi raccomando è vect non vector viene fuori una serie di data recorders, riascolta la registrazione a circa 30 minuti 

rana$Occurrence #different point in which i have the frog. occurence = or you have the species or not 

plot(rana) #let's plot

#now let's plot only the data that contain 1
#sequel --> sql from the datasat with 0 and one we want to select only the one with 1, 
#occurrence =1 
#! = it will not equal to

pres <- rana[rana$Occurrence==1] #rana is the dataset, the elements #from rana go to occurrence and send all the dataset wher occurence = 1 select all the dataset in line with this condition. this is called press

#ESERCIZIO 1 plot in a multiframe the rana dataset beside the press dataset
par(mfrow=c(1,2))
plot(rana)
plot(pres) 

#ESERCIZIO 2 select data from rana with only absences
abse <- rana[rana$Occurrence==0]
abse$Occurrence #to see the absence obcurrence  #there may be an error called observer byassed, potresti non aver visto l'animale

plot(abse)

#ESERCIZIO 3 #plot in a multiframe presence beside absence
par(mfrow=c(1,2))
plot(pres)
plot(abse) 

#ESERCIZIO 4 #plot in a multiframe presence on top of absence
par(mfrow=c(2,1))
plot(pres)
plot(abse) 

#ESERCIZIO 5 #plot the presence in blue toghether with absences in red
plot(pres, col="blue4")
points(abse, col="red3")

plot(pres, col="blue4", pch=19, cex=1)
points(abse, col="red3", pch=19, cex=1)


#we can now try to undestand ecologically why frogs are somewhere and not somewhere else 
#let's take the previous function (change the name) and use it to understand that

elev <- system.file("external/elevation.asc", package="sdm") #elevation.asc perchè è una funzione non un vettore
elevmap <- rast(elev)    #map of the elevation map 

#ESERCIZIO6 #change the colors
colorRampPalette (c("blue4","mediumseagreen","mistyrose3")) (100) 
cl <- colorRampPalette (c("blue4","mediumseagreen","mistyrose3")) (100) 
plot(elevmap, col=cl)
points(pres, pch=19)

