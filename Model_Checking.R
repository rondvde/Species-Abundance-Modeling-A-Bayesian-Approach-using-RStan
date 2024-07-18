#### Analysing the estimated parameters ####

list_of_draws_7 <- rstan::extract(fit_7)
list_of_draws_8 <- rstan::extract(fit_8)
list_of_draws_9 <- rstan::extract(fit_9)

y_pred_7 <- list_of_draws_7$y_sim
y_pred_8 <- list_of_draws_8$y_sim
y_pred_9 <- list_of_draws_9$y_sim

# Proportion of errors in 7
error_prop <- 0
for(i in 1:1000){
  ct <- table(Y[train, species[1]], as.matrix(y_pred_7[i,,1]))
  error1 <- (ct[1, 2] + ct[2, 1])
  ct <- table(Y[train, species[2]], as.matrix(y_pred_7[i,,2]))
  error2 <- (ct[1, 2] + ct[2, 1])
  ct <- table(Y[train, species[3]], as.matrix(y_pred_7[i,,3]))
  error3 <- (ct[1, 2] + ct[2, 1])
  error_prop[i] <- (error1 + error2 + error3) / (length(Y[train, species[1]]) * 3)
}
hist(error_prop, xlim = c(0.2, 0.3), col = "lightblue", 
     xlab = "Error proportion", main = "Histogram of the error proportion")

for(i in 1:1000){
  ct <- table(data_pooled[, 1], as.matrix(y_pred_8[i,]))
  error_prop[i] <- (ct[1, 2] + ct[2, 1]) / (nrow(data_pooled))
}
hist(error_prop, xlim = c(0.3, 0.4),col = "lightpink", 
     xlab = "Error proportion", main = "Histogram of the error proportion")

for(i in 1:1000){
  ct <- table(Y[train, species[1]], as.matrix(y_pred_9[i,,1]))
  error1 <- (ct[1, 2] + ct[2, 1])
  ct <- table(Y[train, species[2]], as.matrix(y_pred_9[i,,2]))
  error2 <- (ct[1, 2] + ct[2, 1])
  ct <- table(Y[train, species[3]], as.matrix(y_pred_9[i,,3]))
  error3 <- (ct[1, 2] + ct[2, 1])
  error_prop[i] <- (error1 + error2 + error3) / (length(Y[train, species[1]]) * 3)
}
hist(error_prop, xlim = c(0.2, 0.3), col = "lightgreen", 
     xlab = "Error proportion", main = "Histogram of the error proportion")


# Calculate the prediction of the data 

beta_7 <- list_of_draws_7$beta
beta_8 <- list_of_draws_8$beta
beta_9 <- list_of_draws_9$beta

beta_7_1 <- colMeans(beta_7[,1,])
beta_7_2 <- colMeans(beta_7[,2,])
beta_7_3 <- colMeans(beta_7[,3,])

beta_8 <- colMeans(beta_8)

beta_9_1 <- colMeans(beta_9[,1,])
beta_9_2 <- colMeans(beta_9[,2,])
beta_9_3 <- colMeans(beta_9[,3,])

pred_bayes_7_1 <- function(x){
  z <- 0
  for(i in 1:nrow(x)){
    z[i] <- sum(beta_7_1 * x[i, ])
  }
  z <- exp(z) / (1 + exp(z))
  return(ifelse(z > 0.5, 1, 0))
}

pred_bayes_7_2 <- function(x){
  z <- 0
  for(i in 1:nrow(x)){
    z[i] <- sum(beta_7_2 * x[i, ])
  }
  z <- exp(z) / (1 + exp(z))
  return(ifelse(z > 0.5, 1, 0))
}

pred_bayes_7_3 <- function(x){
  z <- 0
  for(i in 1:nrow(x)){
    z[i] <- sum(beta_7_3 * x[i, ])
  }
  z <- exp(z) / (1 + exp(z))
  return(ifelse(z > 0.5, 1, 0))
}

pred_bayes_8 <- function(x){
  z <- 0
  for(i in 1:nrow(x)){
    z[i] <- sum(beta_8 * x[i, ])
  }
  z <- exp(z) / (1 + exp(z))
  return(ifelse(z > 0.5, 1, 0))
}

pred_bayes_9_1 <- function(x){
  z <- 0
  for(i in 1:nrow(x)){
    z[i] <- sum(beta_9_1 * x[i, ])
  }
  z <- exp(z) / (1 + exp(z))
  return(ifelse(z > 0.5, 1, 0))
}

pred_bayes_9_2 <- function(x){
  z <- 0
  for(i in 1:nrow(x)){
    z[i] <- sum(beta_9_2 * x[i, ])
  }
  z <- exp(z) / (1 + exp(z))
  return(ifelse(z > 0.5, 1, 0))
}

pred_bayes_9_3 <- function(x){
  z <- 0
  for(i in 1:nrow(x)){
    z[i] <- sum(beta_9_3 * x[i, ])
  }
  z <- exp(z) / (1 + exp(z))
  return(ifelse(z > 0.5, 1, 0))
}

# Accuracy

ct_7_train <- table(Y[train, species[1]], pred_bayes_7_1(x[train,]))+
  table(Y[train, species[2]], pred_bayes_7_2(x[train,]))+
  table(Y[train, species[3]], pred_bayes_7_3(x[train,]))
ct_7_test <- table(Y[-train, species[1]], pred_bayes_7_1(x[-train,]))+
  table(Y[-train, species[2]], pred_bayes_7_2(x[-train,]))+
  table(Y[-train, species[3]], pred_bayes_7_3(x[-train,]))

prop_err_7_train <- sum(ct_7_train[1, 2], ct_7_train[2, 1]) / sum(colSums(ct_7_train))
prop_err_7_test <- sum(ct_7_test[1, 2], ct_7_test[2, 1]) / sum(colSums(ct_7_test))


ct_8_train <- table(Y[train, species[1]], pred_bayes_8(x[train,]))+
  table(Y[train, species[2]], pred_bayes_8(x[train,]))+
  table(Y[train, species[3]], pred_bayes_8(x[train,]))
ct_8_test <- table(Y[-train, species[1]], pred_bayes_8(x[-train,]))+
  table(Y[-train, species[2]], pred_bayes_8(x[-train,]))+
  table(Y[-train, species[3]], pred_bayes_8(x[-train,]))

prop_err_8_train <- sum(ct_8_train[1, 2], ct_8_train[2, 1]) / sum(colSums(ct_8_train))
prop_err_8_test <- sum(ct_8_test[1, 2], ct_8_test[2, 1]) / sum(colSums(ct_8_test))


ct_9_train <- table(Y[train, species[1]], pred_bayes_9_1(x[train,]))+
  table(Y[train, species[2]], pred_bayes_9_2(x[train,]))+
  table(Y[train, species[3]], pred_bayes_9_3(x[train,]))
ct_9_test <- table(Y[-train, species[1]], pred_bayes_9_1(x[-train,]))+
  table(Y[-train, species[2]], pred_bayes_9_2(x[-train,]))+
  table(Y[-train, species[3]], pred_bayes_9_3(x[-train,]))

prop_err_9_train <- sum(ct_9_train[1, 2], ct_9_train[2, 1]) / sum(colSums(ct_9_train))
prop_err_9_test <- sum(ct_9_test[1, 2], ct_9_test[2, 1]) / sum(colSums(ct_9_test))


# Traceplots
rstan::traceplot(fit_8, pars = c("beta[1]", "beta[50]", "beta[5]", "beta[14]", "beta[8]", "beta[65]"))
rstan::traceplot(fit_7, pars = c("beta[1,4]", "beta[2,1]", "beta[3,20]", "beta[1,3]", "beta[2,9]", "beta[3,49]"))
rstan::traceplot(fit_9, pars = c("beta[1,7]", "beta[2,60]", "beta[3,1]", "Omega[1,2]", "Omega[1,3]", "Omega[2,3]"))


# ESS

hist(summary_fit_8[,9], col = "lightpink", main = "ESS Pooled", xlab = "n_eff")
hist(summary_fit_7[,9], col = "lightblue", main = "ESS Separate", xlab = "n_eff")
hist(summary_fit_9[,9], col = "lightgreen", main = "ESS Hierarchical", xlab = "n_eff")
