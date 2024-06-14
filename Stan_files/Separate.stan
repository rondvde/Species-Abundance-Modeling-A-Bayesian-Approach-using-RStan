data {
  int<lower=0> N;// number of observations
  int<lower=0> K;// number of species
  int<lower=0> P; // number of covariates
  int<lower=0, upper=1> y[N,K];   // response variable
  vector[P] x[N]; // covariates
}

transformed data{
  vector[K] sigma;
  for (k in 1:K)
    sigma[k] = 1;
}

parameters {
  matrix[K, P] beta; // coefficients for covariates (and intercept)
}

transformed parameters {
  vector[K] x_beta[N];
  for (n in 1:N)
    x_beta[n] = beta * x[n];
}

model {
  to_vector(beta) ~ normal(0, 5);

  for (i in 1:K)
    y[,i] ~ bernoulli_logit(x_beta[,i]);
}

generated quantities {
  int y_sim[N,K];
  for (n in 1:N){
    for (k in 1:K){
      y_sim[n,k] = bernoulli_logit_rng(x_beta[n,k]);
    }
  }
      
  real log_lik[N,K];
  for(n in 1:N){
    for(k in 1:K){
      log_lik[n,k] = bernoulli_logit_lpmf(y[n,k] | x_beta[n,k]);
    }
  }
}
