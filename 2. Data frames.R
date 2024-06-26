?read.table
?read.csv

mydata <- read.csv('evals.csv', stringsAsFactors = T)

head(mydata, 3)
tail(mydata)

View(mydata)

str(mydata)

summary(mydata)

a <- names(mydata)


b <- mydata$score
mean(b)
summary(b)
b *2

mydata$ten_points_scale <- mydata$score * 2
summary(mydata$ten_points_scale)

mydata$new_variable <- 0
mydata$number <- 1:nrow(mydata)
summary(mydata$number)

nrow(mydata)
ncol(mydata)


mydata$score[1:10]

mydata[1,1]
mydata[c(2,193,225),1]

mydata[5,]
mydata[,1] == mydata$score


mydata[,2:5]
head(mydata[,2:5])


mydata$gender
fem <- mydata$gender == 'female'
head(mydata[fem,1:3])

head(subset(mydata, gender == 'female'))
head(subset(mydata, score > 3.5))


mydata2 <- subset(mydata, gender == 'female')
mydata3 <- subset(mydata, gender == 'male')
mydata4 <- rbind(mydata2, mydata3)

mydata5 <- mydata[, 1:10]
mydata6 <- mydata[, 11:24]
mydata7 <- cbind(mydata6, mydata5)

