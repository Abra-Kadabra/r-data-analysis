?mtcars

df <- mtcars

str(df)

df$vs <- factor(df$vs, labels=c('V', 'S'))
df$am <- factor(df$am, labels=c('Auto', 'Manual'))

median(df$mpg)
mean(df$disp)
sd(df$hp)
range(df$cyl)

mean_disp <- mean(df$disp)

mean(df$mpg[df$cyl == 6])

mean(df$mpg[df$cyl == 6 & df$vs == 'V'])

sd(df$hp[df$cyl != 3 & df$am == 'Auto'])


?aggregate

mean_hp_vs <- aggregate(x = df$hp, by = list(df$vs), FUN = mean)
colnames(mean_hp_vs) <- c('VS', 'Mean HP')

aggregate(hp ~ vs, df, mean)

aggregate(hp ~ vs + am, df, mean)
aggregate(x= df$hp, by = list (df$vs, df$am), FUN = mean)

aggregate(x=df[, -c(8,9)], by = list (df$am), FUN = median)

aggregate(x=df[, c(1,3)], by = list(df$am, df$vs), FUN = sd)
aggregate(cbind(mpg, disp) ~ am + vs, df, sd)

cbind(df$mpg, df$disp)


library(psych)

descr <- describe(x = df)
descr2 <- describeBy(x = df, group = df$vs, mat = T, digits = 1)

describeBy(df$qsec, group = list(df$vs, df$am), mat = T, 
           digits = 1, fast = T)


sum(is.na(df))


df$mpg[1:10] <- NA


aggregate(mpg ~ am, df, sd)
