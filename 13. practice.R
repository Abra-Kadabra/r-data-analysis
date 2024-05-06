
model_full <- lm(rating ~ ., data = attitude) 
model_null <- lm(rating ~ 1, data = attitude)

ideal_model <- step(model_null, list(lower = model_null, upper = model_full), 
                    direction = 'forward')

anova(model_full, ideal_model)


# LifeCycleSavings. Попытаемся предсказать значение sr на основе всех остальных 
# переменных в этом датасете. Вспомните способы сокращения формул и напишите 
# команду, которая создаёт линейную регрессию с главными эффектами и всеми 
# возможными взаимодействиями второго уровня. Сохраните модель в переменную model.

model <- lm(sr ~ .^2, LifeCycleSavings)
