data(swiss)

ggplot(swiss, aes(Examination, Education))+
  geom_point()+
  geom_smooth()

lm1 <- lm(Education ~ Examination, swiss)
summary(lm1)


swiss$Examination_squared <- (swiss$Examination)^2

lm2 <- lm(Education ~ Examination + Examination_squared, swiss)
summary(lm2)


anova(lm1, lm2)

swiss$lm1_fitted <- lm1$fitted.values
swiss$lm2_fitted <- lm2$fitted.values
swiss$lm1_resid <- lm1$residuals
swiss$lm2_resid <- lm2$residuals
swiss$obs_number <- 1:nrow(swiss)

ggplot(swiss, aes(x = Examination, y = Education))+
  geom_point()+
  geom_line(aes(x = Examination, y = lm1_fitted), col = 'red', lwd = 1)+
  geom_line(aes(x = Examination, y = lm2_fitted), col = 'blue', lwd = 1)

ggplot(swiss, aes(x = lm1_fitted, y = lm1_resid))+
  geom_point()+  
  geom_hline(yintercept = 0, col = 'red', lwd = 1)

ggplot(swiss, aes(x = lm2_fitted, y = lm1_resid))+
  geom_point()+  
  geom_hline(yintercept = 0, col = 'red', lwd = 1)


ggplot(swiss, aes(x = obs_number, y = lm1_resid))+
  geom_point()+
  geom_smooth()

ggplot(swiss, aes(x = obs_number, y = lm2_resid))+
  geom_point()+
  geom_smooth()


ggplot(swiss, aes(x = lm1_fitted, lm1_resid))+
  geom_point()

ggplot(swiss, aes(x = lm2_fitted, lm2_resid))+
  geom_point()


ggplot(swiss, aes(x = lm1_resid))+
  geom_histogram(binwidth = 4, fill = 'white', col = 'black')

qqnorm(lm1$residuals)
qqline(lm1$residuals)


ggplot(swiss, aes(x = lm2_resid))+
  geom_histogram(binwidth = 4, fill = 'white', col = 'black')

qqnorm(lm2$residuals)
qqline(lm2$residuals)


par(mfrow=c(2,2)) ; plot(lm1)
par(mfrow=c(2,2)) ; plot(lm2)
