# mtcars. Сохраните в переменную логистическую регрессионную модель, где в 
# качестве зависимой переменной выступает тип коробки передач (am), в качестве 
# предикторов переменные disp, vs, mpg.
# Значения коэффициентов регрессии сохраните в переменную log_coef.

fit <- glm(am ~ disp + vs + mpg, mtcars, family = 'binomial')
log_coef <- fit$coefficients

# ---

library("ggplot2")


ggplot(ToothGrowth, aes(x = supp, y = len, fill = factor(dose)))+
  geom_boxplot()

# --- 

df <- read.csv(url('https://stepik.org/media/attachments/lesson/11478/data.csv'), stringsAsFactors = T)
df$admit <- factor(df$admit)
df$rank <- factor(df$rank)
str(df)

admit_na <- is.na(df$admit)

fit <- glm(admit ~ rank * gpa, df[!admit_na, ], family = 'binomial')
preds <- predict(fit, newdata = df[admit_na, ], type = 'response')
sum(preds > 0.4)
