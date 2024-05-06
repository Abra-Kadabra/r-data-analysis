mtcars$even_gear <- mtcars$gear %% 2 # should inverse 0 and 1
mtcars$even_gear <- (mtcars$gear %% 2 != 1) * 1 
mtcars$even_gear

# создать переменную - вектор mpg_4 и сохранить в нее значения расхода топлива 
# (mpg) для машин с четырьмя цилиндрами (cyl).

mpg_4 <- mtcars$mpg[mtcars$cyl == 4]

# создать новый dataframe под названием mini_mtcars, в котором будут 
# сохранены только третья, седьмая, десятая, двенадцатая и последняя 
# строчка датафрейма mtcars.

mini_mtcars <- mtcars[c(1,3,7,10,12,nrow(mtcars)), ]