swiss <- data.frame(swiss)

fit_full <- lm(Fertility ~ ., swiss)
summary(fit_full)

fit_reduced1 <- lm(Fertility ~ . -Agriculture, swiss)
summary(fit_reduced1)

anova(fit_full, fit_reduced1)


fit_reduced2 <- lm(Fertility ~ . -Examination, swiss)
summary(fit_reduced2)

anova(fit_full, fit_reduced2)


optimal_fit <- step(fit_full, direction = 'backward')
summary(optimal_fit)
