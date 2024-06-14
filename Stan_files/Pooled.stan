data {
  int<lower=0> N;// number of observations
  int<lower=0> P; // number of covariates
  int<lower=0, upper=1> y[N];   // response variable
  vector[P] x[N]; // covariates
}

parameters {
  vector[P] beta; // coefficients for covariates (and intercept)
}

transformed parameters {
  vector[N] x_beta;
  for (n in 1:N){
    x_beta[n] = beta' * x[n,];
  }
}

model {
  beta ~ normal(0, 5);
    y ~ bernoulli_logit(x_beta);
}

generated quantities {
  int y_sim[N];
    y_sim = bernoulli_logit_rng(x_beta);
    
  real log_lik[N];
  for(n in 1:N){
    log_lik[n] = bernoulli_logit_lpmf(y[n] | x_beta[n]);
  }
}
