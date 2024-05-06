df <- mtcars

df$vs <- factor(df$vs, labels=c('V', 'S'))
df$am <- factor(df$am, labels=c('Auto', 'Manual'))

hist(df$mpg, breaks = 20, xlab = "MPG")

boxplot(mpg ~ am, df, ylab = "MPG")

plot(df$mpg, df$hp)

library(ggplot2)

ggplot(df, aes(x = mpg, fill = am))+
  geom_dotplot()

ggplot(df, aes(x = mpg))+
  geom_density(fill = 'red')

ggplot(df, aes(x = mpg, fill = am))+
  geom_density(alpha = 0.5)

ggplot(df, aes(x = am, y = hp, col = vs))+
  geom_boxplot()

ggplot(df, aes(x = mpg, y = hp, col = vs, size = qsec))+
  geom_point()

my_plot <- ggplot(df, aes(x = mpg, y = hp, col = vs, size = qsec))+
  geom_point()

my_plot2 <- ggplot(df, aes(x = am, y = hp, col = vs))

my_plot2 + geom_boxplot()
