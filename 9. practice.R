df <- npk

str(df)

fit <- aov(yield ~ N + P + N:P, df)
summary(fit)


fit1 <- aov(yield ~ N + P + K, df)
summary(fit1)


# Проведите однофакторный дисперсионный анализ на встроенных данных iris. 
# Зависимая переменная - ширина чашелистика (Sepal.Width), независимая 
# переменная - вид (Species). Затем проведите попарные сравнения видов. 
# Какие виды статистически значимо различаются по ширине чашелистика (p < 0.05)?

TukeyHSD(aov(Sepal.Width ~ Species, iris))

# Проведите однофакторный дисперсионный анализ с повторными измерениями: 
# влияние типа таблетки (pill) на температуру (temperature) с учётом 
# испытуемого (patient). Каково p-value для влияния типа таблеток на температуру?

data <- read.csv('Pillulkin.csv', stringsAsFactors = T)
data$patient <- as.factor(data$patient)

fit2 <- aov(temperature ~ pill + Error(patient/pill), data)
summary(fit2)


# провести двухфакторный дисперсионный анализ с повторными измерениями: 
# влияние факторов doctor, влияние фактора pill и их взаимодействие на 
# temperature. Учтите обе внутригрупповые переменные: и тот факт, что один и 
# тот же больной принимает разные таблетки, и тот факт, что  один и тот же 
# больной лечится у разных врачей! Каково F-значение для взаимодействия 
# факторов доктора (doctor) и типа таблеток (pill)?

fit3 <- aov(temperature ~ pill * doctor + Error(patient/(pill * doctor)), data)
summary(fit3)


# ---
library(ggplot2)
ggplot(ToothGrowth, aes(x = as.factor(dose), y = len, col = supp, group = supp))+
  stat_summary(fun.data = mean_cl_boot, geom = 'errorbar', width = 0.1, position = position_dodge(0.2))+
  stat_summary(fun.data = mean_cl_boot, geom = 'point', size = 3, position = position_dodge(0.2))+
  stat_summary(fun.data = mean_cl_boot, geom = 'line', position = position_dodge(0.2))
