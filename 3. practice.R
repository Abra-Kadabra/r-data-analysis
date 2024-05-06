# Создайте новую числовую переменную  new_var в данных mtcars, 
# которая содержит единицы в строчках, если в машине не меньше 
# четырёх карбюраторов (переменная "carb") или больше шести цилиндров 
# (переменная "cyl"). В строчках, в которых условие не выполняется, 
# должны стоять нули.

mtcars$new_var <- (mtcars$carb >= 4 | mtcars$cyl > 6) * 1



if (mean(my_vector) > 20) {
  result <- "My mean is great"
} else {
  result <- "My mean is not so great"
}


?AirPassengers
str(AirPassengers)

# задача создать переменную good_months и сохранить в нее число пассажиров 
# только в тех месяцах, в которых это число больше, чем показатель в 
# предыдущем месяце.  

good_months <- c()
for (i in 2 : length(AirPassengers)) {
  if (AirPassengers[i] > AirPassengers[i-1]) {
    good_months <- append(good_months, AirPassengers[i])
  }
}
good_months



# рассчитайте скользящее среднее с интервалом сглаживания равным 10. 
# Напечатайте получившийся результат (первым значением в выводе должно 
# быть среднее для элементов 1:10, во втором значении - среднее для 
# элементов 2:11 и т.д., в последнем  - среднее для элементов 135 :144)
# полученные значения средних сохраните в переменную moving_average.

moving_average <- numeric(135)
for (i in 1 : 135) {
  moving_average[i] <- sum(AirPassengers[i:(i+9)])/10
}
moving_average
