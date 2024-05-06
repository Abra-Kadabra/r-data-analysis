library(xtable)
library(stargazer)

fit1 <- lm(mpg ~ cyl + disp, mtcars)
fit2 <- aov(mpg ~ am * vs, mtcars)
summary(fit1)

fit_table1 <- xtable(fit1)
fit_table2 <- xtable(fit2)

stargazer(fit1, type = 'html',
          dep.var.labels = 'mpg',
          covariate.labels = c('cyl', 'disp'), out = 'models1.html')
