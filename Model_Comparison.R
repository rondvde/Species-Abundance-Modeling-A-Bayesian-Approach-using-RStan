# Visualization of the splines

# Spiny dogfish - Depth
curve(beta_7_1[1] + beta_7_1[2] * x + beta_7_1[3] * x^2 + beta_7_1[4] * x^3, main = "Spiny dogfish",
      xlim = c(min(data_scaled$DEPTH), max(data_scaled$DEPTH)), col = "lightblue", ylim = c(-5, 30), ylab = "Splines", xlab = "Depth")
curve(beta_9_1[1] + beta_9_1[2] * x + beta_9_1[3] * x^2 + beta_9_1[4] * x^3, col = "lightgreen", add = T)
curve(beta_8[1] + beta_8[2] * x + beta_8[3] * x^2 + beta_8[4] * x^3, col = "lightpink", add = T)
abline(v = 0, h = 0, col = "grey", lty = 2)
legend("topleft", legend = c("Pooled", "Separate", "Hierarchical"), 
       col = c("lightpink", "lightblue", "lightgreen"), pch = c(1, 1, 1))

# Haddock - Depth
curve(beta_7_2[1] + beta_7_2[2] * x + beta_7_2[3] * x^2 + beta_7_2[4] * x^3, main = "Haddock",
      xlim = c(min(data_scaled$DEPTH), max(data_scaled$DEPTH)), col = "lightblue", ylim = c(-5, 30), ylab = "Splines", xlab = "Depth")
curve(beta_9_1[1] + beta_9_1[2] * x + beta_9_1[3] * x^2 + beta_9_1[4] * x^3, col = "lightgreen", add = T)
curve(beta_8[1] + beta_8[2] * x + beta_8[3] * x^2 + beta_8[4] * x^3, col = "lightpink", add = T)
abline(v = 0, h = 0, col = "grey", lty = 2)
legend("topleft", legend = c("Pooled", "Separate", "Hierarchical"), 
       col = c("lightpink", "lightblue", "lightgreen"), pch = c(1, 1, 1))
