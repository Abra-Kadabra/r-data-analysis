library(gvlma)
y <- read.csv("homosc.csv")
x <- gvlma(DV ~ IV, y)
s <- summary(x)

# Напишите функцию resid.norm, которая тестирует распределение остатков от 
# модели на нормальность при помощи функции shapiro.test и создает гистограмму 
# при помощи функции ggplot() с красной заливкой "red", если распределение 
# остатков значимо отличается от нормального (p < 0.05), и с зелёной заливкой 
# "green" - если распределение остатков значимо не отличается от нормального.

resid.norm <- function(x) {
  color <- ifelse(shapiro.test(x$residuals)$p.value > 0.05, 'green', 'red')
  ggplot(as.data.frame(x$model), aes(x$residuals))+
    geom_histogram(fill = color)
}

fit <- lm(mpg ~ disp, mtcars)
resid.norm(fit)

# Напишите функцию high.corr, которая принимает на вход датасет с произвольным 
# числом количественных переменных и возвращает вектор с именами двух 
# переменных с максимальным абсолютным значением коэффициента корреляции .


high.corr <- function(df) {
  cor_matrix <- cor(df)
  diag(cor_matrix) <- 0
  max_id <- which(max(abs(cor_matrix)) == abs(cor_matrix), arr.ind = T)
  return(c(colnames(cor_matrix)[max_id[1]], rownames(cor_matrix)[max_id[2]]))
}

high.corr(iris[,-5])
