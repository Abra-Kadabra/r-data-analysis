df <- iris
str(df)

df1 <- subset(df, Species != 'setosa')
str(df1)
table(df1$Species)

hist(df1$Sepal.Length)

library(ggplot2)

ggplot(df1, aes(x = Sepal.Length))+
  geom_histogram(fill = 'white', col = 'black', binwidth = 0.4)+
  facet_grid(Species ~ .)

ggplot(df1, aes(Sepal.Length, fill = Species))+
  geom_density(alpha = 0.5)

ggplot(df1, aes(Species, Sepal.Length))+
  geom_boxplot()


shapiro.test(df1$Sepal.Length) # p-value = 0.1464 = norm

shapiro.test(df1$Sepal.Length[df1$Species == 'versicolor'])
shapiro.test(df1$Sepal.Length[df1$Species == 'virginica'])

bartlett.test(Sepal.Length ~ Species, df1)


t.test(Sepal.Length ~ Species, df1)
test1 <- t.test(Sepal.Length ~ Species, df1)

str(test1)
test1$p.value


t.test(Sepal.Length ~ Species, df1, var.equal = T)

mean(df1$Sepal.Length)
t.test(df1$Sepal.Length, mu = 8)


t.test(df1$Petal.Length, df1$Petal.Width, paired = T)

ggplot(df1, aes(Species, Sepal.Length))+
  stat_summary(fun.data = mean_cl_normal, geom = 'errorbar',
               width = 0.1)+
  stat_summary(fun.y = mean, geom = 'point', size = 4)

ggplot(df1, aes(Species, Sepal.Length))+
  stat_summary(fun.data = mean_cl_normal, geom = 'pointrange',
               size = 2)


test2 <- wilcox.test(Petal.Length ~ Species, df1)
test2$stat
test2$p.value

ggplot(df1, aes(Species, Petal.Length))+
  geom_boxplot()


paired_wtest <- wilcox.test(df1$Petal.Length, df1$Petal.Width, paired = T )
paired_wtest$statistic
