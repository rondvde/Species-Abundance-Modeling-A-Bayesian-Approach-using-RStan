# Exploratory analysis and investigation of the variable types
str(XData)
class(XData)
summary(XData)

# DEPTH is the depth of the sea
# SURFTEMP is the surface temperature of the sea
# BOTTEMP is the bottom temperature of the sea
# SURFSALIN is the surface salinity of the sea
# BOTSALIN is the bottom salinity of the sea

# The response variable Y is the abundance of the species (presence/absence)

hist_list <- list()
for (i in 10:14) {
  hist_list[[i]] <- ggplot(XData, aes_string(x = colnames(XData)[i])) +
    geom_histogram(binwidth = 0.5, fill = "skyblue", color = "black") +
    labs(title = paste("Histogram of", colnames(XData)[i]))
}

# Display the histograms
gridExtra::grid.arrange(grobs = hist_list, ncol = 3)

hist(XData$DEPTH, col = "lightblue", main = "Histogram of DEPTH")
hist(XData$SURFTEMP, col = "lightblue", main = "Histogram of SURFTEMP")
hist(XData$BOTTEMP, col = "lightblue", main = "Histogram of BOTTEMP")
hist(XData$SURFSALIN, col = "lightblue", main = "Histogram of SURFSALIN")
hist(XData$BOTSALIN, col = "lightblue", main = "Histogram of BOTSALIN")

# Checking the range of the months in the data
range(format(XData$UTC_TOWDATE, "%m"))

# Correlation between the taxa and corrplot, decreasing axys labels size
cor(Y)
corrplot::corrplot(cor(Y), tl.cex = 0.6)

# Summary of data
summary(XData)
summary(Y)

# Exploratory analysis of the covariates
data$MONTH <- round_date(XData$UTC_TOWDATE, unit = "month")
plot_data <- data.frame(Y, 
                        data %>% dplyr::select(YEAR, MONTH, UTM_X, UTM_Y, LON, LAT, DEPTH, SURFTEMP, BOTTEMP, SURFSALIN, BOTSALIN)) %>% pivot_longer(-c(YEAR,MONTH,LON,LAT,UTM_X,UTM_Y), values_to = "value")

DEPTH_plot <- ggplot(plot_data %>% dplyr::filter(name == "DEPTH"), aes(x = LON, y = LAT, color = value)) +
  borders("world", xlim = c(-82,-60), ylim = c(30,48), fill = "lightgreen") + # From <https://onlinelibrary.wiley.com/doi/full/10.1002/ece3.7150>
  coord_map(xlim = c(-82,-60), ylim = c(30,48)) +
  geom_point(size = 0.8, alpha = 0.5) +
  #facet_wrap(. ~ year, nrow = 4) +
  scale_color_viridis_c() +
  labs(x = "Longitude", y = "Latitude", title = "Depth", color = "Value") +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
DEPTH_plot
ggsave(file = "plots/depth_space.pdf", width = 12, height = 8)

SURFTEMP_plot <- ggplot(plot_data %>% dplyr::filter(name == "SURFTEMP"), aes(x = LON, y = LAT, color = value)) +
  borders("world", xlim = c(-82,-60), ylim = c(30,48), fill = "lightgreen") + # From <https://onlinelibrary.wiley.com/doi/full/10.1002/ece3.7150>
  coord_map(xlim = c(-82,-60), ylim = c(30,48)) +
  geom_point(size = 0.8, alpha = 0.5) +
  #facet_wrap(. ~ year, nrow = 4) +
  scale_color_viridis_c() +
  labs(x = "Longitude", y = "Latitude", title = "Surface temp.", color = "Value") +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
SURFTEMP_plot
ggsave(file = "plots/surftemp_space.pdf", width = 12, height = 8)

BOTTEMP_plot <- ggplot(plot_data %>% dplyr::filter(name == "BOTTEMP"), aes(x = LON, y = LAT, color = value)) +
  borders("world", xlim = c(-82,-60), ylim = c(30,48), fill = "lightgreen") + # From <https://onlinelibrary.wiley.com/doi/full/10.1002/ece3.7150>
  coord_map(xlim = c(-82,-60), ylim = c(30,48)) +
  geom_point(size = 0.8, alpha = 0.5) +
  #facet_wrap(. ~ year, nrow = 4) +
  scale_color_viridis_c() +
  labs(x = "Longitude", y = "Latitude", title = "Bottom temp.", color = "Value") +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
BOTTEMP_plot
ggsave(file = "plots/bottemp_space.pdf", width = 12, height = 8)

SURFSALIN_plot <- ggplot(plot_data %>% dplyr::filter(name == "SURFSALIN"), aes(x = LON, y = LAT, color = value)) +
  borders("world", xlim = c(-82,-60), ylim = c(30,48), fill = "lightgreen") + # From <https://onlinelibrary.wiley.com/doi/full/10.1002/ece3.7150>
  coord_map(xlim = c(-82,-60), ylim = c(30,48)) +
  geom_point(size = 0.8, alpha = 0.5) +
  #facet_wrap(. ~ year, nrow = 4) +
  scale_color_viridis_c() +
  labs(x = "Longitude", y = "Latitude", title = "Surface salinity", color = "Value") +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
SURFSALIN_plot
ggsave(file = "plots/surfsalin_space.pdf", width = 12, height = 8)

BOTSALIN_plot <- ggplot(plot_data %>% dplyr::filter(name == "BOTSALIN"), aes(x = LON, y = LAT, color = value)) +
  borders("world", xlim = c(-82,-60), ylim = c(30,48), fill = "lightgreen") + # From <https://onlinelibrary.wiley.com/doi/full/10.1002/ece3.7150>
  coord_map(xlim = c(-82,-60), ylim = c(30,48)) +
  geom_point(size = 0.8, alpha = 0.5) +
  #facet_wrap(. ~ year, nrow = 4) +
  scale_color_viridis_c() +
  labs(x = "Longitude", y = "Latitude", title = "Bottom salinity", color = "Value") +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
BOTSALIN_plot
ggsave(file = "plots/bottom_space.pdf", width = 12, height = 8)

time_dat <- plot_data %>% 
  dplyr::filter(name == "DEPTH") %>% 
  group_by(MONTH) %>%
  summarise(n = length(value))
time_dat$MONTH <- ymd(time_dat$MONTH)

ggplot(time_dat, aes(x = MONTH, y = n)) +
  scale_x_date(date_labels = "%Y") +
  geom_bar(stat = "identity") +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  labs(x = "Time", y = "Number of observations")
ggsave(file = "plots/ndata_time.pdf", width = 12, height = 8)

colors <- c(
  "#1f78b4", "#33a02c", "#e31a1c", "#ff7f00", "#6a3d9a",
  "#b15928", "#a6cee3", "#b2df8a", "#fb9a99", "#fdbf6f",
  "#cab2d6", "#ffff99", "#8c6bb1", "#fdae61", "#b8e186",
  "#f46d43", "#9e0142", "#f7fcf0", "#4575b4", "#b15928"
)
ggplot(data, aes(x = 1:nrow(data), y = DEPTH, color = as.factor(YEAR))) +
  geom_line() + 
  labs(title = "Depth",
       x = "Time",
       y = "Depth",
       color = "Month") + 
  theme_minimal() +
  scale_color_manual(values = colors)
# Depth doesn't change over years

ggplot(data, aes(x = 1:nrow(data), y = SURFTEMP, color = as.factor(YEAR))) +
  geom_line() + 
  labs(title = "Surface temperature",
       x = "Time",
       y = "Temperature",
       color = "Month") + 
  theme_minimal() +
  scale_color_manual(values = colors)
# Surface temperature doesn't change over years

ggplot(data, aes(x = 1:nrow(data), y = BOTTEMP, color = as.factor(YEAR))) +
  geom_line() + 
  labs(title = "Bottom temperature",
       x = "Time",
       y = "Temperature",
       color = "Month") + 
  theme_minimal() +
  scale_color_manual(values = colors)
# Bottom temperature change a bit over years

ggplot(data, aes(x = 1:nrow(data), y = SURFSALIN, color = as.factor(YEAR))) +
  geom_line() + 
  labs(title = "Surface salinity",
       x = "Time",
       y = "Salinity",
       color = "Month") + 
  theme_minimal() +
  scale_color_manual(values = colors)
# Surface salinity doesn't change over years

ggplot(data, aes(x = 1:nrow(data), y = BOTSALIN, color = as.factor(YEAR))) +
  geom_line() + 
  labs(title = "Bottom salinity",
       x = "Time",
       y = "Salinity",
       color = "Month") + 
  theme_minimal() +
  scale_color_manual(values = colors)
# Bottom salinity doesn't change over years


