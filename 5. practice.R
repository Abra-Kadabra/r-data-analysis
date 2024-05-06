# При помощи функции ggplot() или boxplot() постройте график boxplot, 
# используя встроенные в R данные airquality. По оси x отложите номер 
# месяца, по оси y — значения переменной Ozone.
# Обратите внимание, что для корректного отображения графика ggplot 
# ожидает факторную переменную по оси x.

# через создание факторной переменной 
df <- airquality
df$Month <- factor(df$Month, labels=c('May', 'June', 'July', 'August', 'September'))

ggplot(df, aes(x = Month, y = Ozone))+
  geom_boxplot()


# через группировку по Month
ggplot(airquality, aes(x = Month, y = Ozone, group = Month))+
  geom_boxplot()


# данные mtcars. Нужно построить scatterplot с помощью ggplot из ggplot2, 
# по оси x которого будет mpg, по оси y - disp, а цветом отобразить 
# переменную (hp).Полученный график нужно сохранить в переменную plot1.

plot1 <- ggplot(mtcars, aes(x = mpg, y = disp, col = hp))+
  geom_point()
