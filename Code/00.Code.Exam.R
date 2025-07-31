

# Packages
library (terra)      # geospatial data analysis for raster data
library (viridis)    # inclusive color palette for color blind people
library (ggplot2)    # to create appropriate graphs 
library (tidyterra)  # interface between terra and tidyverse
                     # to avoid issues with ggplot, error in fortify

setwd("C:/Users/Dell/Desktop/foto Duccio")

install.packages("tidyterra")
install.packages("terra")

# Packages
library (terra)      # geospatial data analysis for raster data
library (viridis)    # inclusive color palette for color blind people
library (ggplot2)    # to create appropriate graphs 
library (tidyterra)  # interface between terra and tidyverse
# to avoid issues with ggplot, error in fortify

setwd("C:/Users/Dell/Desktop/foto Duccio")

#Cerca bande B2-B10 in tutte le sottocartelle
tif_files <- list.files(path = ".", pattern = "SR_B(10|[2-9])\\.TIF$", recursive = TRUE, full.names = TRUE)
tif_files  # verifica

#Importa e crea stack per ciascuna data
prestag_stack <- rast(list.files(pattern = "20170925.*SR_B(10|[2-9])\\.TIF$", recursive = TRUE, full.names = TRUE))
pre_stack     <- rast(list.files(pattern = "20180710.*SR_B(10|[2-9])\\.TIF$", recursive = TRUE, full.names = TRUE))
post_stack    <- rast(list.files(pattern = "20181030.*SR_B(10|[2-9])\\.TIF$", recursive = TRUE, full.names = TRUE))
rec_stack     <- rast(list.files(pattern = "20190611.*SR_B(10|[2-9])\\.TIF$", recursive = TRUE, full.names = TRUE))
recent_stack  <- rast(list.files(pattern = "20250518.*SR_B(10|[2-9])\\.TIF$", recursive = TRUE, full.names = TRUE))

#Verifica l’ordine delle bande per sicurezza
names(pre_stack)

#RGB PLOT con plotRGB (terra)
plotRGB(prestag_stack, r = 3, g = 2, b = 1, stretch = "lin", main = "Pre-incendio stagionale (2017)")
plotRGB(pre_stack,     r = 3, g = 2, b = 1, stretch = "lin", main = "Pre-incendio (luglio 2018)")
plotRGB(post_stack,    r = 3, g = 2, b = 1, stretch = "lin", main = "Post-incendio (ottobre 2018)")
plotRGB(rec_stack,     r = 3, g = 2, b = 1, stretch = "lin", main = "Recupero vegetazione (giugno 2019)")
plotRGB(recent_stack,  r = 3, g = 2, b = 1, stretch = "lin", main = "Immagine più recente (maggio 2025)")


