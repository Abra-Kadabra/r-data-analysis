a <- -10

if (a > 0) {
  print('pos')
} else if (a < 0) {
  print('neg')
} else {
  print('zero')
}

ifelse(a > 0, 'pos', 'not pos')

a <- c(1, -1)

mydata <- read.csv('evals.csv', stringsAsFactors=T)

for (i in 1:10) {
  print(mydata$score[i])
}



for (i in 1:nrow(mydata)) {
  if (mydata$gender[i] == 'male') {
    print(mydata$score[i]) # вывод оценок только для мужчин
  }
}



mydata$quality <- rep(NA, nrow(mydata))

for (i in 1:nrow(mydata)) {
  if (mydata$score[i] > 4) {
    mydata$quality[i] <- 'good'
  } else {
    mydata$quality[i] <- 'bad'
  }
}

mydata$quality2 <- ifelse(mydata$score > 4, 'good', 'bad')



i <- 1

while (i < 51) {
  print(mydata$score[i])
  i <- i+1
}