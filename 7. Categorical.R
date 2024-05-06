df <- read.csv('grants.csv', stringsAsFactors = T)

str(df)

df$status <- factor(df$status, labels = c('Not funded', 'Funded'))


t1 <- table(df$status)
t1

dim(t1)


t2 <- table(df$status, df$field)
t2
t2 <- table(status = df$status, field = df$field)

dim(t2)

prop.table(t2) # пропорции по всей таблице
prop.table(t2, 1) # пропорции по строкам
prop.table(t2, 2) # пропорции по столцам

t3 <- table(Years = df$years_in_uni, Field = df$field, Status = df$status)
t3

dim(t3)

table(Status = df$status, Field = df$field, Years = df$years_in_uni)


barplot(t2)
barplot(t2, legend.text = T, args.legend = list(x = 'topright'))
barplot(t2, legend.text = T, args.legend = list(x = 'topright'), beside = T)

mosaicplot(t2)


binom.test(x = 5, n = 20, p = 0.5)
binom.test(t1)


chisq.test(t1)

chi <- chisq.test(t1)
chi$exp
chi$obs


t2
chisq.test(t2)


fisher.test(t2)
