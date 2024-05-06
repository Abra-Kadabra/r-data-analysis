df <- mtcars

fit <- cor.test(x = df$mpg, y = df$hp)

str(fit)

fit$p.value

fit1 <- cor.test(~ mpg + hp, df)


plot(x = df$mpg, y = df$hp)

ggplot(df, aes(x= mpg, y = hp))+
  geom_point(size = 3)

df_numeric <- df[,c(1,3:7)]
pairs(df_numeric)

cor(df_numeric)

library(psych)
fit2 <- corr.test(df_numeric)


df <- mtcars
df_numeric <- df[,c(1, 3:7)]

fit3 <- lm(mpg ~ hp, df)
summary(fit3)

library(ggplot2)
ggplot(df, aes(hp, mpg))+
  geom_point(size = 3)+
  geom_smooth(method = 'lm')+
  facet_grid(.~cyl)


ggplot(df, aes(hp, mpg))+
  geom_smooth(method = 'lm', se = F)+
  facet_grid(.~cyl)


fitted_values_mpg <- data.frame(mpg = df$mpg, fitted = fit3$fitted.values)

ggplot(fitted_values_mpg, aes( mpg, fitted)) +
  geom_point(size=3)+
  geom_smooth(method = 'lm')


new_hp <- data.frame(hp = c(100, 150, 129, 300))
new_hp$mpg <- predict(fit3, new_hp)


my_df <- mtcars
my_df$cyl <- factor(my_df$cyl, labels = c('four', 'six', 'eight'))

fit4 <- lm(mpg ~ cyl, my_df)
summary(fit4)

aggregate(mpg ~ cyl, my_df, mean)
