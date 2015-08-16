# Solution Part1
rm(list = ls())

library(ggplot2)
set.seed(123)
lambda <- 0.2
n <- 40
runs <- 1000
sim <- matrix(rexp(runs*n, rate=lambda), runs)
sim_means <- rowMeans(sim)

# mean of the simulation
sim_mean = mean(sim_means)
# mean of the distribution
exp_mean = 1/lambda

# plot histogram
# hist(sim_means, breaks=40, probability=TRUE, main="Distribution of Simulation", xlab="")

# density of the simulation
# lines(density(sim_means), col="green")

# theoretical center of distribution
# abline(v=exp_mean, col="red")

# theoretical density of the simulation
# xfit <- seq(min(sim_means), max(sim_means), length=100)
# yfit <- dnorm(xfit, mean=exp_mean, sd=(exp_mean/sqrt(n)))

# lines(xfit, yfit, pch=22, col="red")

# add legend
# legend('topright', c("Simulated", "Theoretical"), col=c("green", "red"), lty=c(1,1))

# calculate standard deviation and variance
exp_sd <- 1/lambda/sqrt(n)
exp_var <- exp_sd*exp_sd
sim_sd <- sd(sim_means)
sim_var <- sim_sd*sim_sd

##
# qqnorm(sim_means, col="green")
# qqline(sim_means, col="red")

# check confidence
vals <- seq(4, 6, by=0.01)
coverage <- sapply(vals, function(l) {
  mu_hats <- rowMeans(matrix(rexp(runs*n, rate=lambda),
                             runs, n))
  ll <- mu_hats - qnorm(0.975) * exp_sd
  ul <- mu_hats + qnorm(0.975) * exp_sd
  mean(ll < l & ul > l)
})

qplot(vals, coverage) + geom_hline(yintercept=0.95)