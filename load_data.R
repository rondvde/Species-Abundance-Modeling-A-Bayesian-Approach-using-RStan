library(mgcv)
library(dplyr)
library(FRK)
library(autoFRK)
library(splines)
library(tidyr)
library(tidyverse)

load("Data/Hui_et_al_2022_NMFS_BTS.RData")
# Removing variables that are not needed
rm(numtest)
rm(numtrain)
rm(sel_all_units)
rm(sel_test_units)
rm(test_years)
rm(train_years)
rm(sel_training_units)

# Merging XData and Y
data <- cbind(Y, XData)

# # Adding a month column
data$MONTH <- format(data$UTC_TOWDATE, "%Y-%m")
data$MONTH <- as.Date(paste0(data$MONTH, "-01"), format = "%Y-%m-%d")

# Creatig indicator data for svvesselhb, svvesselpc
data$SVVESSEL_HB <- as.numeric(data$SVVESSEL == "HB")
data$SVVESSEL_PC <- as.numeric(data$SVVESSEL == "PC")

# Creating standardized data
data_scaled <- data
data_scaled[, 49:53] <- scale(data_scaled[, 49:53])

# Creating splines
intercept <- rep(1, nrow(data_scaled))
DEPTH_spl <- ns(data_scaled$DEPTH, df=3)
SURFTEMP_spl <- ns(data_scaled$SURFTEMP, df=3)
BOTTEMP_spl <- ns(data_scaled$BOTTEMP, df=3)
SURFSALIN_spl <- ns(data_scaled$SURFSALIN, df=3)
BOTSALIN_spl <- ns(data_scaled$BOTSALIN, df=3)

# Creating basis functions
# adaptive thin-plate splines constructed via the autoFRK package
nsplines_s <- 50
basis_s <- mrts(data_scaled[,which(colnames(data)==c("UTM_X","UTM_Y"))], 
                k = nsplines_s) %>% as.matrix %>% {.[,-(1)]}

# gaussian basis functions for time
time_dat <- data.frame(year = XData$YEAR, y = 0)
table(time_dat$year)
sp::coordinates(time_dat) <- ~ year + y

basis_t <- local_basis(manifold = real_line(), loc = matrix(seq(2000,2019,by=3), ncol = 1), 
                       type = "Gaussian", scale = rep(5,seq(2000,2019,by=3) %>% length))

basis_t <- eval_basis(basis_t, time_dat@coords) %>% as.matrix %>% {.[,-(1)]}

