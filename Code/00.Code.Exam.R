

install.packages("tidyterra")
install.packages("terra")
# Packages
library (terra)      # geospatial data analysis for raster data
library (viridis)    # inclusive color palette for color blind people
library (ggplot2)    # to create appropriate graphs 
library (tidyterra)  # interface between terra and tidyverse
                     # to avoid issues with ggplot, error in fortify

#Imposta la working directory
setwd("C:/Users/Dell/Desktop/foto Duccio")

#Importare le immagini Landsat (stack multibanda da B2 a B10)

# Pre-incendio vicino alla data (10 luglio 2018)
pre_stack <- rast(list.files(pattern = "20180710.*SR_B(10|[2-9])\\.TIF$", recursive = TRUE, full.names = TRUE))

# Post-incendio (30 ottobre 2018)
post_stack <- rast(list.files(pattern = "20181030.*SR_B(10|[2-9])\\.TIF$", recursive = TRUE, full.names = TRUE))

# Pre-incendio, stessa stagione del post (25 settembre 2017)
prestag_stack <- rast(list.files(pattern = "20170925.*SR_B(10|[2-9])\\.TIF$", recursive = TRUE, full.names = TRUE))

# Recupero vegetazione breve termine (11 giugno 2019)
rec_stack <- rast(list.files(pattern = "20190611.*SR_B(10|[2-9])\\.TIF$", recursive = TRUE, full.names = TRUE))

# Recupero vegetazione lungo termine (18 maggio 2025)
recent_stack <- rast(list.files(pattern = "20250518.*SR_B(10|[2-9])\\.TIF$", recursive = TRUE, full.names = TRUE))

#Controllare i nomi delle bande nei tuoi stack
names(pre_stack)

#Visualizzare le immagini in RGB 
plotRGB(prestag_stack, r = 3, g = 2, b = 1, stretch = "lin", main = "Pre-incendio stagionale (2017)")
plotRGB(pre_stack,     r = 3, g = 2, b = 1, stretch = "lin", main = "Pre-incendio (luglio 2018)")
plotRGB(post_stack,    r = 3, g = 2, b = 1, stretch = "lin", main = "Post-incendio (ottobre 2018)")
plotRGB(rec_stack,     r = 3, g = 2, b = 1, stretch = "lin", main = "Recupero vegetazione (giugno 2019)")
plotRGB(recent_stack,  r = 3, g = 2, b = 1, stretch = "lin", main = "Recupero vegetazione lungo termine (maggio 2025)")

#Calcolo NDVI per ciascuna data
# NDVI = (NIR - RED) / (NIR + RED)
# NIR = banda 5, RED = banda 4

ndvi_2017pre  <- (prestag_stack[[5]] - prestag_stack[[4]]) / (prestag_stack[[5]] + prestag_stack[[4]])
ndvi_2018pre  <- (pre_stack[[5]]     - pre_stack[[4]])     / (pre_stack[[5]]     + pre_stack[[4]])
ndvi_2018post <- (post_stack[[5]]    - post_stack[[4]])    / (post_stack[[5]]    + post_stack[[4]])
ndvi_2019rec  <- (rec_stack[[5]]     - rec_stack[[4]])     / (rec_stack[[5]]     + rec_stack[[4]])
ndvi_2025     <- (recent_stack[[5]]  - recent_stack[[4]])  / (recent_stack[[5]]  + recent_stack[[4]])

#Calcolo differenze NDVI (confronti)

# Allinea ndvi_2017pre sull'estensione e la risoluzione di ndvi_2018post
ndvi_2017pre_resampled <- resample(ndvi_2017pre, ndvi_2018post, method = "bilinear")
#Perdita di vegetazione stagionale causata da incendio
diff_seasonal <- ndvi_2018post - ndvi_2017pre_resampled

#Recupero vegetazione breve termine (2019 vs 2018 pre)
ndvi_2018pre_resampled <- resample(ndvi_2018pre, ndvi_2019rec, method = "bilinear")
diff_yearly <- ndvi_2019rec - ndvi_2018pre_resampled

#Recupero vegetazione lungo termine (2025 vs 2017)
ndvi_2017pre_resampled_long <- resample(ndvi_2017pre, ndvi_2025, method = "bilinear")
diff_long <- ndvi_2025 - ndvi_2017pre_resampled_long

#Visualizzare NDVI e differenze con viridis
plot(ndvi_2017pre,  col = viridis(100), main = "NDVI Pre-incendio (2017)")
plot(ndvi_2018pre,  col = viridis(100), main = "NDVI Pre-incendio (2018)")
plot(ndvi_2018post, col = viridis(100), main = "NDVI Post-incendio (2018)")
plot(ndvi_2019rec,  col = viridis(100), main = "NDVI Recupero breve (2019)")
plot(ndvi_2025,     col = viridis(100), main = "NDVI Recupero lungo termine (2025)")

plot(diff_seasonal, col = viridis(100), main = "Differenza NDVI Post(2018) - Pre(2017)")
plot(diff_yearly,   col = viridis(100), main = "Recupero vegetazione 2019 - Pre 2018")
plot(diff_long,     col = viridis(100), main = "Recupero vegetazione lungo termine (2025 - 2017)")

