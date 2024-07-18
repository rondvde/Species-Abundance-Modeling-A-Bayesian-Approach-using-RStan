# Visualization of the splines

# Spiny dogfish - Depth
curve(beta_7_1[1] + beta_7_1[2] * x + beta_7_1[3] * x^2 + beta_7_1[4] * x^3, main = "Spiny dogfish", lwd = 4,
      xlim = c(min(data_scaled$DEPTH), max(data_scaled$DEPTH)), col = "lightblue", ylim = c(-5, 30), ylab = "Splines", xlab = "Depth")
curve(beta_9_1[1] + beta_9_1[2] * x + beta_9_1[3] * x^2 + beta_9_1[4] * x^3, col = "lightgreen", add = T, lwd = 4)
curve(beta_8[1] + beta_8[2] * x + beta_8[3] * x^2 + beta_8[4] * x^3, col = "lightpink", add = T, lwd = 4)
abline(v = 0, h = 0, col = "grey", lty = 2)
legend("topleft", legend = c("Pooled", "Separate", "Hierarchical"), 
       col = c("lightpink", "lightblue", "lightgreen"), pch = c(1, 1, 1))

# Spiny dogfish - Surftemp
curve(beta_7_1[1] + beta_7_1[5] * x + beta_7_1[6] * x^2 + beta_7_1[7] * x^3, main = "Spiny dogfish", lwd = 4,
      xlim = c(min(data_scaled$SURFTEMP), max(data_scaled$SURFTEMP)), col = "lightblue", ylab = "Splines", xlab = "Surftemp")
curve(beta_9_1[1] + beta_9_1[5] * x + beta_9_1[6] * x^2 + beta_9_1[7] * x^3, col = "lightgreen", add = T, lwd = 4)
curve(beta_8[1] + beta_8[5] * x + beta_8[6] * x^2 + beta_8[7] * x^3, col = "lightpink", add = T, lwd = 4)
abline(v = 0, h = 0, col = "grey", lty = 2)

# Spiny dogfish - Bottemp
curve(beta_7_1[1] + beta_7_1[8] * x + beta_7_1[9] * x^2 + beta_7_1[10] * x^3, main = "Spiny dogfish", lwd = 4,
      xlim = c(min(data_scaled$BOTTEMP), max(data_scaled$BOTTEMP)), col = "lightblue", ylab = "Splines", xlab = "Bottemp")
curve(beta_9_1[1] + beta_9_1[8] * x + beta_9_1[9] * x^2 + beta_9_1[10] * x^3, col = "lightgreen", add = T, lwd = 4)
curve(beta_8[1] + beta_8[8] * x + beta_8[9] * x^2 + beta_8[10] * x^3, col = "lightpink", add = T, lwd = 4)
abline(v = 0, h = 0, col = "grey", lty = 2)

# Spiny dogfish - Surfsalin
curve(beta_7_1[1] + beta_7_1[11] * x + beta_7_1[12] * x^2 + beta_7_1[13] * x^3, main = "Spiny dogfish", lwd = 4, ylim = c(-180, 50),
      xlim = c(min(data_scaled$SURFSALIN), max(data_scaled$SURFSALIN)), col = "lightblue", ylab = "Splines", xlab = "Surfsalin")
curve(beta_9_1[1] + beta_9_1[11] * x + beta_9_1[12] * x^2 + beta_9_1[13] * x^3, col = "lightgreen", add = T, lwd = 4)
curve(beta_8[1] + beta_8[11] * x + beta_8[12] * x^2 + beta_8[13] * x^3, col = "lightpink", add = T, lwd = 4)
abline(v = 0, h = 0, col = "grey", lty = 2)

# Spiny dogfish - Botsalin
curve(beta_7_1[1] + beta_7_1[14] * x + beta_7_1[15] * x^2 + beta_7_1[16] * x^3, main = "Spiny dogfish", lwd = 4,
      xlim = c(min(data_scaled$BOTSALIN), max(data_scaled$BOTSALIN)), col = "lightblue", ylab = "Splines", xlab = "Botsalin")
curve(beta_9_1[1] + beta_9_1[14] * x + beta_9_1[15] * x^2 + beta_9_1[16] * x^3, col = "lightgreen", add = T, lwd = 4)
curve(beta_8[1] + beta_8[14] * x + beta_8[15] * x^2 + beta_8[16] * x^3, col = "lightpink", add = T, lwd = 4)
abline(v = 0, h = 0, col = "grey", lty = 2)

# Haddock - Depth
curve(beta_7_2[1] + beta_7_2[2] * x + beta_7_2[3] * x^2 + beta_7_2[4] * x^3, main = "Haddock", lwd = 4, ylim = c(-430, 300),
      xlim = c(min(data_scaled$DEPTH), max(data_scaled$DEPTH)), col = "lightblue", ylab = "Splines", xlab = "Depth")
curve(beta_9_2[1] + beta_9_2[2] * x + beta_9_2[3] * x^2 + beta_9_2[4] * x^3, col = "lightgreen", add = T, lwd = 4)
curve(beta_8[1] + beta_8[2] * x + beta_8[3] * x^2 + beta_8[4] * x^3, col = "lightpink", add = T, lwd = 4)
abline(v = 0, h = 0, col = "grey", lty = 2)
legend("topleft", legend = c("Pooled", "Separate", "Hierarchical"), 
       col = c("lightpink", "lightblue", "lightgreen"), pch = c(1, 1, 1))

# Haddock - Surftemp
curve(beta_7_2[1] + beta_7_2[5] * x + beta_7_2[6] * x^2 + beta_7_2[7] * x^3, main = "Haddock", lwd = 4, ylim = c(-10, 10),
      xlim = c(min(data_scaled$SURFTEMP), max(data_scaled$SURFTEMP)), col = "lightblue", ylab = "Splines", xlab = "Surftemp")
curve(beta_9_2[1] + beta_9_2[5] * x + beta_9_2[6] * x^2 + beta_9_2[7] * x^3, col = "lightgreen", add = T, lwd = 4)
curve(beta_8[1] + beta_8[5] * x + beta_8[6] * x^2 + beta_8[7] * x^3, col = "lightpink", add = T, lwd = 4)
abline(v = 0, h = 0, col = "grey", lty = 2)

# Haddock - Bottemp
curve(beta_7_2[1] + beta_7_2[8] * x + beta_7_2[9] * x^2 + beta_7_2[10] * x^3, main = "Haddock", lwd = 4,
      xlim = c(min(data_scaled$BOTTEMP), max(data_scaled$BOTTEMP)), col = "lightblue", ylab = "Splines", xlab = "Bottemp")
curve(beta_9_2[1] + beta_9_2[8] * x + beta_9_2[9] * x^2 + beta_9_2[10] * x^3, col = "lightgreen", add = T, lwd = 4)
curve(beta_8[1] + beta_8[8] * x + beta_8[9] * x^2 + beta_8[10] * x^3, col = "lightpink", add = T, lwd = 4)
abline(v = 0, h = 0, col = "grey", lty = 2)

# Haddock - Surfsalin
curve(beta_7_2[1] + beta_7_2[11] * x + beta_7_2[12] * x^2 + beta_7_2[13] * x^3, main = "Haddock", lwd = 4, ylim = c(-510, 50),
      xlim = c(min(data_scaled$SURFSALIN), max(data_scaled$SURFSALIN)), col = "lightblue", ylab = "Splines", xlab = "Surfsalin")
curve(beta_9_2[1] + beta_9_2[11] * x + beta_9_2[12] * x^2 + beta_9_2[13] * x^3, col = "lightgreen", add = T, lwd = 4)
curve(beta_8[1] + beta_8[11] * x + beta_8[12] * x^2 + beta_8[13] * x^3, col = "lightpink", add = T, lwd = 4)
abline(v = 0, h = 0, col = "grey", lty = 2)

# Haddock - Botsalin
curve(beta_7_2[1] + beta_7_2[14] * x + beta_7_2[15] * x^2 + beta_7_2[16] * x^3, main = "Haddock", lwd = 4,
      xlim = c(min(data_scaled$BOTSALIN), max(data_scaled$BOTSALIN)), col = "lightblue", ylab = "Splines", xlab = "Botsalin")
curve(beta_9_2[1] + beta_9_2[14] * x + beta_9_2[15] * x^2 + beta_9_2[16] * x^3, col = "lightgreen", add = T, lwd = 4)
curve(beta_8[1] + beta_8[14] * x + beta_8[15] * x^2 + beta_8[16] * x^3, col = "lightpink", add = T, lwd = 4)
abline(v = 0, h = 0, col = "grey", lty = 2)

# Fourspot flounder - Depth
curve(beta_7_3[1] + beta_7_3[2] * x + beta_7_3[3] * x^2 + beta_7_3[4] * x^3, main = "Fourspot flounder", lwd = 4, ylim = c(-100, 300),
      xlim = c(min(data_scaled$DEPTH), max(data_scaled$DEPTH)), col = "lightblue", ylab = "Splines", xlab = "Depth")
curve(beta_9_3[1] + beta_9_3[2] * x + beta_9_3[3] * x^2 + beta_9_3[4] * x^3, col = "lightgreen", add = T, lwd = 4)
curve(beta_8[1] + beta_8[2] * x + beta_8[3] * x^2 + beta_8[4] * x^3, col = "lightpink", add = T, lwd = 4)
abline(v = 0, h = 0, col = "grey", lty = 2)
legend("topleft", legend = c("Pooled", "Separate", "Hierarchical"), 
       col = c("lightpink", "lightblue", "lightgreen"), pch = c(1, 1, 1))

# Fourspot flounder - Surftemp
curve(beta_7_3[1] + beta_7_3[5] * x + beta_7_3[6] * x^2 + beta_7_3[7] * x^3, main = "Fourspot flounder", lwd = 4, ylim = c(-8, 5),
      xlim = c(min(data_scaled$SURFTEMP), max(data_scaled$SURFTEMP)), col = "lightblue", ylab = "Splines", xlab = "Surftemp")
curve(beta_9_3[1] + beta_9_3[5] * x + beta_9_3[6] * x^2 + beta_9_3[7] * x^3, col = "lightgreen", add = T, lwd = 4)
curve(beta_8[1] + beta_8[5] * x + beta_8[6] * x^2 + beta_8[7] * x^3, col = "lightpink", add = T, lwd = 4)
abline(v = 0, h = 0, col = "grey", lty = 2)

# Fourspot flounder - Bottemp
curve(beta_7_3[1] + beta_7_3[8] * x + beta_7_3[9] * x^2 + beta_7_3[10] * x^3, main = "Fourspot flounder", lwd = 4, ylim = c(-30, 7),
      xlim = c(min(data_scaled$BOTTEMP), max(data_scaled$BOTTEMP)), col = "lightblue", ylab = "Splines", xlab = "Bottemp")
curve(beta_9_3[1] + beta_9_3[8] * x + beta_9_3[9] * x^2 + beta_9_3[10] * x^3, col = "lightgreen", add = T, lwd = 4)
curve(beta_8[1] + beta_8[8] * x + beta_8[9] * x^2 + beta_8[10] * x^3, col = "lightpink", add = T, lwd = 4)
abline(v = 0, h = 0, col = "grey", lty = 2)

# Fourspot flounder - Surfsalin
curve(beta_7_3[1] + beta_7_3[11] * x + beta_7_3[12] * x^2 + beta_7_3[13] * x^3, main = "Fourspot flounder", lwd = 4,
      xlim = c(min(data_scaled$SURFSALIN), max(data_scaled$SURFSALIN)), col = "lightblue", ylab = "Splines", xlab = "Surfsalin")
curve(beta_9_3[1] + beta_9_3[11] * x + beta_9_3[12] * x^2 + beta_9_3[13] * x^3, col = "lightgreen", add = T, lwd = 4)
curve(beta_8[1] + beta_8[11] * x + beta_8[12] * x^2 + beta_8[13] * x^3, col = "lightpink", add = T, lwd = 4)
abline(v = 0, h = 0, col = "grey", lty = 2)

# Fourspot flounder - Botsalin
curve(beta_7_3[1] + beta_7_3[14] * x + beta_7_3[15] * x^2 + beta_7_3[16] * x^3, main = "Fourspot flounder", lwd = 4,
      xlim = c(min(data_scaled$BOTSALIN), max(data_scaled$BOTSALIN)), col = "lightblue", ylab = "Splines", xlab = "Botsalin")
curve(beta_9_3[1] + beta_9_3[14] * x + beta_9_3[15] * x^2 + beta_9_3[16] * x^3, col = "lightgreen", add = T, lwd = 4)
curve(beta_8[1] + beta_8[14] * x + beta_8[15] * x^2 + beta_8[16] * x^3, col = "lightpink", add = T, lwd = 4)
abline(v = 0, h = 0, col = "grey", lty = 2)

######################################################

# Caricare i pacchetti necessari
library(autoFRK)
library(ggplot2)
library(dplyr)

# Numero di splines
nsplines_s <- 50

# Generare una griglia
x_range <- seq(min(data_scaled$UTM_X), max(data_scaled$UTM_X), length.out = 100)
y_range <- seq(min(data_scaled$UTM_Y), max(data_scaled$UTM_Y), length.out = 100)
grid <- expand.grid(UTM_X = x_range, UTM_Y = y_range)

# Calcolare i valori dei splines sulla griglia
grid_splines <- mrts(grid, k = nsplines_s) %>% as.matrix()

# Spiny dogfish - Separate model
grid$Spline_Value <- grid_splines[, -1] %*% beta_7_1[-c(1:18)]

# Visualizzare la superficie spline
ggplot() +
  geom_contour_filled(data = grid, aes(x = UTM_X, y = UTM_Y, z = Spline_Value), alpha = 0.8) +
  geom_point(data = data_scaled, aes(x = UTM_X, y = UTM_Y), color = 'black', size = 0.5, shape = 3, alpha = 0.05) +
  labs(title = "Separate model Spiny dogfish", x = "UTM_X", y = "UTM_Y") +
  theme_minimal()

# Haddock - Separate model
grid$Spline_Value <- grid_splines[, -1] %*% beta_7_2[-c(1:18)]

# Visualizzare la superficie spline
ggplot() +
  geom_contour_filled(data = grid, aes(x = UTM_X, y = UTM_Y, z = Spline_Value), alpha = 0.8) +
  geom_point(data = data_scaled, aes(x = UTM_X, y = UTM_Y), color = 'black', size = 0.5, shape = 3, alpha = 0.05) +
  labs(title = "Separate model Haddock", x = "UTM_X", y = "UTM_Y") +
  theme_minimal()

# Fourspot flounder - Separate model
grid$Spline_Value <- grid_splines[, -1] %*% beta_7_3[-c(1:18)]

# Visualizzare la superficie spline
ggplot() +
  geom_contour_filled(data = grid, aes(x = UTM_X, y = UTM_Y, z = Spline_Value), alpha = 0.8) +
  geom_point(data = data_scaled, aes(x = UTM_X, y = UTM_Y), color = 'black', size = 0.5, shape = 3, alpha = 0.05) +
  labs(title = "Separate model Fourspot flounder", x = "UTM_X", y = "UTM_Y") +
  theme_minimal()

# All fishes - Pooled model
grid$Spline_Value <- grid_splines[, -1] %*% beta_8[-c(1:18)]

# Visualizzare la superficie spline
ggplot() +
  geom_contour_filled(data = grid, aes(x = UTM_X, y = UTM_Y, z = Spline_Value), alpha = 0.8) +
  geom_point(data = data_scaled, aes(x = UTM_X, y = UTM_Y), color = 'black', size = 0.5, shape = 3, alpha = 0.05) +
  labs(title = "Pooled model", x = "UTM_X", y = "UTM_Y") +
  theme_minimal()

# Spiny dogfish - Hierarchical model
grid$Spline_Value <- grid_splines[, -1] %*% beta_9_1[-c(1:18)]

# Visualizzare la superficie spline
ggplot() +
  geom_contour_filled(data = grid, aes(x = UTM_X, y = UTM_Y, z = Spline_Value), alpha = 0.8) +
  geom_point(data = data_scaled, aes(x = UTM_X, y = UTM_Y), color = 'black', size = 0.5, shape = 3, alpha = 0.05) +
  labs(title = "Hierarchical model Spiny dogfish", x = "UTM_X", y = "UTM_Y") +
  theme_minimal()

# Haddock - Hierarchical model
grid$Spline_Value <- grid_splines[, -1] %*% beta_9_2[-c(1:18)]

# Visualizzare la superficie spline
ggplot() +
  geom_contour_filled(data = grid, aes(x = UTM_X, y = UTM_Y, z = Spline_Value), alpha = 0.8) +
  geom_point(data = data_scaled, aes(x = UTM_X, y = UTM_Y), color = 'black', size = 0.5, shape = 3, alpha = 0.05) +
  labs(title = "Hierarchical model Haddock", x = "UTM_X", y = "UTM_Y") +
  theme_minimal()

# Fourspot flounder - Hierarchical model
grid$Spline_Value <- grid_splines[, -1] %*% beta_9_3[-c(1:18)]

# Visualizzare la superficie spline
ggplot() +
  geom_contour_filled(data = grid, aes(x = UTM_X, y = UTM_Y, z = Spline_Value), alpha = 0.8) +
  geom_point(data = data_scaled, aes(x = UTM_X, y = UTM_Y), color = 'black', size = 0.5, shape = 3, alpha = 0.05) +
  labs(title = "Hierarchical model Fourspot flounder", x = "UTM_X", y = "UTM_Y") +
  theme_minimal()


#### LOO ####
loo_pooled <- loo(fit_8, cores = 4)
save(loo_pooled, file = "loo_pooled.RData")
load("loo_pooled.RData")

loo_separate <- loo(fit_7, cores = 4)
save(loo_separate, file = "loo_separate.RData")
load("loo_separate.RData")

loo_hierarchical <- loo(fit_9, cores = 4)
save(loo_hierarchical, file = "loo_hierarchical.RData")
load("loo_hierarchical.RData")

loo_compare(loo_pooled, loo_separate, loo_hierarchical)

