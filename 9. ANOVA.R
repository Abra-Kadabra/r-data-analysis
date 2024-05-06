mydata <- read.csv('shops.csv', stringsAsFactors = T)

str(mydata)

boxplot(price ~ origin, data = mydata)

ggplot(mydata, aes(x = origin, y = price))+
  geom_boxplot()


fit <- aov(price ~ origin, data = mydata)
summary(fit)


fit1 <- aov(price ~ origin + store, data = mydata)
summary(fit1)

model.tables(fit1, 'means')


pd = position_dodge(0.1)
ggplot(mydata, aes(x = store, y = price, color = origin, group = origin)) + 
  stat_summary(fun.data = mean_cl_boot, geom = 'errorbar', width = 0.2, lwd = 0.8, position = pd)+  
  stat_summary(fun.data = mean_cl_boot, geom = 'line', size = 1.5, position = pd) +
  stat_summary(fun.data = mean_cl_boot, geom = 'point', size = 5, position = pd, pch=15) +
  theme_bw()


fit3 <- aov(price ~ origin * store, data = mydata)
summary(fit3)


ggplot(mydata, aes(x=food, y=price))+
  geom_boxplot()

fit4 <- aov(price ~ food, data = mydata)
summary(fit4)

TukeyHSD(fit4)


mydata2 <- read.csv('therapy_data.csv', stringsAsFactors = T)
str(mydata2)

mydata2$subject <- as.factor(mydata2$subject)

fit7 <- aov(well_being ~ therapy, data = mydata2)
summary(fit7)

fit7b <- aov(well_being ~ therapy + Error(subject/therapy), data = mydata2)
summary(fit7b)

fit8 <- aov(well_being ~therapy * price, data = mydata2)
summary(fit8)

ggplot(mydata2, aes(x = price, y = well_being))+
  geom_boxplot()

fit8b <- aov(well_being ~therapy * price 
             + Error(subject/(therapy*price)), data = mydata2)
summary(fit8b)

ggplot(mydata2, aes(x = price, y = well_being))+
  geom_boxplot()+
  facet_grid(~subject)


fit9 <- aov(well_being ~ therapy*price*sex, data = mydata2)
summary(fit9)

fit9b <- aov(well_being ~ therapy*price*sex
             + Error(subject/(therapy*price)), data = mydata2)
summary(fit9b)
