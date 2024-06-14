library(rstan)
library(mgcv)
library(dplyr)
library(FRK)
library(autoFRK)
library(splines)
library(TMB)
library(brms)
library(bayesplot)

species <- colnames(data)[c(3, 13, 21)]


x <- as.matrix(data.frame(intercept,
                          DEPTH_spl,
                          SURFTEMP_spl,
                          BOTTEMP_spl,
                          SURFSALIN_spl,
                          BOTSALIN_spl,
                          data_scaled$SVVESSEL_PC,
                          data_scaled$SVVESSEL_HB,
                          basis_s))

colnames(x) <- c("intercept",
                 "DEPTH_spl1",
                 "DEPTH_spl2",
                 "DEPTH_spl3",
                 "SURFTEMP_spl1",
                 "SURFTEMP_spl2",
                 "SURFTEMP_spl3",
                 "BOTTEMP_spl1",
                 "BOTTEMP_spl2",
                 "BOTTEMP_spl3",
                 "SURFSALIN_spl1",
                 "SURFSALIN_spl2",
                 "SURFSALIN_spl3",
                 "BOTSALIN_spl1",
                 "BOTSALIN_spl2",
                 "BOTSALIN_spl3",
                 "SVVESSEL_PC",
                 "SVVESSEL_HB",
                 paste("basis_s", 1:49, sep = "_"))


set.seed(678)
train <- sample(1:nrow(data), 0.66*nrow(data))

n <- nrow(data[train,])
p <- length(species)
k <- ncol(x)

stan_data_6 <- list(y = Y[train, species],
                    K = p,
                    P = k,
                    N = n,
                    x = x[train,]
)


model_11 <- stan_model('Stan_files/Separate.stan')

fit_7 <- sampling(model_11, data = stan_data_6, chains = 4, 
                  iter = 3000, warmup = 1200, cores=4)
save(fit_7, file = "fit_7.RData")
# load("fit_7.RData")

summary_fit_7 <- summary(fit_7)$summary



# model_12 <- stan_model('Stan_files/Hierachical_low_variance.stan')
# 
# fit_8 <- sampling(model_12, data = stan_data_6, chains = 4, 
#                   iter = 3000, warmup = 1200, cores=4)
# save(fit_8, file = "fit_8.RData")
# # load("fit_8.RData")
# 
# summary_fit_8 <- summary(fit_8)$summary



model_13 <- stan_model('Stan_files/Hierarchical.stan')

fit_9 <- sampling(model_13, data = stan_data_6, chains = 4, 
                  iter = 3000, warmup = 1200, cores=4)
save(fit_9, file = "fit_9.RData")
# load("fit_9.RData")

summary_fit_9 <- summary(fit_9)$summary


# Constructing the dataset for the pooled model
data_pooled_3 <- cbind(Y[,3], x)[train,]
data_pooled_13 <- cbind(Y[,13], x)[train,]
data_pooled_21 <- cbind(Y[,21], x)[train,]

data_pooled <- rbind(data_pooled_3, data_pooled_13, data_pooled_21)

n <- nrow(data_pooled)
stan_data_7 <- list(y = data_pooled[, 1],
                    P = k,
                    N = n,
                    x = data_pooled[, -1]
)

model_12 <- stan_model('Stan_files/Pooled.stan')

fit_8 <- sampling(model_12, data = stan_data_7, chains = 4, 
                  iter = 3000, warmup = 1200, cores=4)
save(fit_8, file = "fit_8.RData")
# load("fit_8.RData")

summary_fit_8 <- summary(fit_8)$summary

