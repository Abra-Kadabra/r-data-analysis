?swiss

swiss <- data.frame(swiss)

str(swiss)

hist(swiss$Fertility, col = 'red')

fit <- lm(Fertility ~ Examination + Catholic, swiss)
summary(fit)

fit2 <- lm(Fertility ~ Examination * Catholic, swiss)
summary(fit2)

confint(fit2)

fit_cat <- lm(Fertility ~ Catholic, swiss)
summary(fit_cat) 

ggplot(swiss, aes(x = Catholic, y = Fertility)) + 
  geom_point() + geom_smooth(method = 'lm')


hist(swiss$Catholic, col = 'red')

swiss$Religious <- ifelse(swiss$Catholic > 60, 'Lots', 'Few')
swiss$Religious <- as.factor(swiss$Religious)

fit3 <- lm(Fertility ~ Examination + Religious, swiss)
summary(fit3)

fit4 <- lm(Fertility ~ Examination * Religious, swiss)
summary(fit4)


ggplot(swiss, aes(x = Examination, y = Fertility)) + 
  geom_point() + 
  geom_smooth(method = 'lm')


ggplot(swiss, aes(x = Examination, y = Fertility, col = Religious)) + 
  geom_point() + 
  geom_smooth(method = 'lm')


fit5 <- lm(Fertility ~ Examination * Infant.Mortality * Religious, swiss)
summary(fit5)
