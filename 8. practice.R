# Сравните среднее значение длины зубов свинок, которые потребляли 
# апельсиновый сок (OJ) с дозировкой 0.5 миллиграмм, со средним значением 
# длины зубов свинок, которые потребляли аскорбиновую кислоту (VC) с 
# дозировкой 2 миллиграмма. 
# Значение t - критерия сохраните в переменную t_stat.

t_stat <- t.test(
  subset(ToothGrowth, supp == 'OJ' & dose == 0.5)$len,
  subset(ToothGrowth, supp == 'VC' & dose == 2.0)$len
  )$stat


# По всем испытуемым сравните показатель давления до начала лечения 
# (Pressure_before) с показателем давления после лечения (Pressure_after) 
# при помощи t - критерия для зависимых выборок. 

data <- read.csv('lekarstva.csv')
t.test(data$Pressure_before, data$Pressure_after, paired = T)$stat

# --===--

filename <- 'dataset_11504_15.txt'
data = read.table(filename)

check_data <- function(x) {
  if (bartlett.test(x$V1 ~ x$V2)$p.value > 0.05) {
    print('T-test')
    result <- t.test(x$V1 ~ x$V2, var.equal = T)$p.value
  } else {
    print('Wilcox test')
    result <- wilcox.test(x$V1 ~ x$V2)$p.value
  }
  return(round(result, 4))
}

check_data(data)

# ---

filename2 = 'dataset_11504_16.txt'
data2 = read.table(filename2)

check_data2 <- function(x) {
  ttp <- t.test(x$V1, x$V2, var.equal = F)$p.value
  if (ttp < 0.05) {
    cat(mean(x$V1), mean(x$V2), ttp)
  } else {
    print("The difference is not significant")
  }
}

check_data2(data2)
