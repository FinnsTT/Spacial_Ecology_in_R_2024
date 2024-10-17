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

press <- rana[rana$Occurrence==1] #rana is the dataset, the elements #from rana go to occurrence and send all the dataset wher occurence = 1 select all the dataset in line with this condition. this is called press

#ESERCIZIO plot in a multiframe the rana dataset beside the press dataset
par(mfrow=c(1,2))
plot(rana)
plot(press) 


