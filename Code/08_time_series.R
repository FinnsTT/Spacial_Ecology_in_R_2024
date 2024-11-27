# time series analysis

library(imageRy) #all the files that comes out of imageRy starts with "im."
library(terra)

im.list() #listing all the available files. #EN 

# import the data
EN01 <- im.import("EN_01.png")  #directly plotted, downloaded by esa
EN13 <- im.import("EN_13.png")

par(mfrow=c(2,1)) 
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN13)

# using the first element (band) of images #overlapping and making a difference ????
difEN = EN01[[1]] - EN13[[1]]   #= instead of <- because it's math?

# palette
cldifEN <- colorRampPalette(c("blue", "white", "red")) (100)
plot(difEN, col=cldif)


## EXAMPLE 2: temperature in Greenland
# how to import severla files altogether, by using part of the name of the data that is common to all of them
gr <- im.import("greenland") #we can now see the differences

plot(gr)

par(mfrow=c(1,2))
plot(gr[[1]])
plot(gr[[4]])

difgr <- gr[[1]] - gr [[4]]  #to see them toghether
dev.off()
plot(difgr) #make the differencxe between the first and the final elemnts of the stack

# Exercise: make a RGB plot using different years
im.plotRGB(green, r=1, g=2, b=3) #if you have higher temperature in 2005 the imagines will be of the first colors while if it's hotter in 2015 they will be green
