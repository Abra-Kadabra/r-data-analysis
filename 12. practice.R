# Напишите функцию fill_na, которая принимает на вход данные с тремя 
# переменными:  
# x_1  -  числовой вектор
# x_2 - числовой вектор
# y - числовой вектор с пропущенными значениями.
# Теперь — самое интересное. На первом этапе, используя только наблюдения, 
# в которых нет пропущенных значений, мы построим регрессионную модель 
# (без взаимодействий), где  y — зависимая переменная, x_1 и x_2 — независимые 
# переменные. Затем, используя построенную модель, мы заполним пропущенные 
# значения предсказаниями модели.
# Функция должна возвращать dataframe c новой переменной  y_full. Сохраните 
# в нее переменную y, в которой пропущенные значения заполнены предсказанными 
# значениями построенной модели.

test_data <- read.csv("https://stepik.org/media/attachments/course/129/fill_na_test.csv")

fill_na <- function(data) {
  fit <- lm(y ~ x_1 + x_2, subset(data, !is.na(y)))
  data$y_full <- ifelse(is.na(data$y), predict(fit, data), data$y)
  return(data)
}

fill_na(test_data)


# В переменной df сохранен subset данных mtcars только с переменными 
# "wt", "mpg", "disp", "drat", "hp". Воспользуйтесь множественным 
# регрессионным анализом, чтобы предсказать вес машины (переменная "wt").
# Выберите такую комбинацию независимых переменных (из "mpg", "disp", "drat", 
# "hp"), чтобы значение R^2 adjusted было наибольшим. Взаимодействия факторов 
# учитывать не надо. 
# Выполните все операции по сравнению моделей на вашем компьютере. сохраните 
# в переменную  model регрессионную модель с оптимальной комбинацией предикторов!

df <- mtcars[, c(1, 3:6)]

fit <- lm(wt ~ mpg + disp + drat + hp, df)
summary(fit) # 0.8374

fit <- lm(wt ~ mpg + disp + hp, df)
summary(fit) # 0.8428

fit <- lm(wt ~ mpg + disp, df)
summary(fit) # 



df1 <- mtcars[,c("wt", "mpg", "disp", "drat", "hp")]
fit_full <- lm(wt ~ ., data = df1)
optimal_fit <-  step(fit_full, direction = 'backward')
opt_summary <- summary(optimal_fit)
attr(as.formula(opt_summary), "term.labels")


# Воспользуйтесь встроенным датасетом attitude, чтобы предсказать рейтинг 
# (rating) по переменным complaints и critical. Каково t-значение для 
# взаимодействия двух факторов?

fit <- lm(rating ~ complaints * critical, attitude)
summary(fit)


# mtcars$am <- factor(mtcars$am, labels = c('Automatic', 'Manual'))
# Теперь постройте линейную модель, в которой в качестве зависимой 
# переменной выступает расход топлива (mpg), а в качестве независимых - вес 
# машины (wt) и коробка передач (модифицированная am), а также их 
# взаимодействие. Выведите summary этой модели.

mtcars <- mtcars
mtcars$am <- factor(mtcars$am, labels = c('Automatic', 'Manual'))
fit <- lm(mpg ~ wt * am, mtcars)
summary(fit)

ggplot(mtcars, aes(x = 1/mpg, y = wt, col = am))+
  geom_point()+
  geom_smooth(method = 'lm')

my_plot <- ggplot(mtcars, aes(x = wt, y = mpg, col = am))+
  geom_point()+
  geom_smooth(method = 'lm')
