# Load the ToothGrowth data and perform some basic exploratory data analyses
library(datasets)
library(ggplot2)
data(ToothGrowth)
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
# coplot(len ~ dose | supp, data = ToothGrowth, panel = panel.smooth, xlab="ToothGrowth data: length vs dose, given type of supplement")

# Provide a basic summary of the data
# Use confidence intervals and/or hypothesis tests to compare tooth growth by supp and dose


# State your conclusions and the assumptions needed for your conclusions
