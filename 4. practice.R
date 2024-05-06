
# Рассчитайте среднее значение времени разгона (qsec) для автомобилей, 
# число цилиндров (cyl) у которых не равняется 3 и показатель количества 
# миль на галлон топлива (mpg) больше 20.
# Получившийся результат (среднее значение) сохраните в переменную result.

result <- mean(mtcars$qsec[mtcars$cyl != 3 & mtcars$mpg > 20])


# При помощи функции aggregate рассчитайте стандартное отклонение 
# переменной hp (лошадиные силы) и переменной disp (вместимости двигателя)  
# у машин с автоматической и ручной коробкой передач. 
# Полученные результаты (результаты выполнения функции aggregate) сохраните 
# в переменную descriptions_stat.

descriptions_stat <- aggregate(cbind(hp, disp) ~ am, mtcars, sd)


# Воспользуемся встроенными данными airquality. В новую переменную 
# сохраните subset исходных данных, оставив наблюдения только для 
# месяцев 7, 8 и 9. При помощи функции aggregate рассчитайте количество 
# непропущенных наблюдений по переменной Ozone в 7, 8 и 9 месяце. Для 
# определения количества наблюдений используйте функцию length().
# Результат выполнения функции aggregate сохраните в переменную result.

df <- subset(airquality, Month %in% c(7:9))
result <- aggregate(Ozone ~ Month, df, length)


# В переменной my_vector сохранен вектор с пропущенными значениями. 
# Вам нужно создать новый вектор fixed_vector, в котором все пропущенные 
# значения вектора my_vector будут заменены на среднее значение по 
# имеющимся наблюдениям.

my_vector <- rnorm(30)
my_vector[sample(1:30, 10)] <- NA # на десять случайных позиций поместим NA

fixed_vector <- my_vector
fixed_vector[is.na(fixed_vector)] <- mean(fixed_vector[!is.na(fixed_vector)])

?replace # replace version
fixed_vector <- replace(my_vector, is.na(my_vector), mean(my_vector, na.rm=T))

