my_calc <- function(x, y) {
  s <- x + y
  return(s)
}

s <- 100

result <- my_calc(x = 10, y = 15)

my_calc <- function(x, y) {
  s <- x + y
  d <- x - y
  return(c(s, d))
}

my_calc2 <- function(x, y, z = 10) {
  s <- x + y + z
  d <- x - y - z
  return(c(s, d))
}

my_calc2(1, 2)


dist1 <- rnorm(1000)
hist(dist1)
dist1[1:30] <- NA

dist1[is.na(dist1)] <- mean(dist1, na.rm = T)


my_na_rm_1 <- function(x) {
  if (is.numeric(x)) {
    stat_test <- shapiro.test(x)
    if (stat_test$p.value > 0.05) {
      x[is.na(x)] <- mean(x, na.rm = T)  
      print('NA -> mean')
    }
    else {
      x[is.na(x)] <- median(x, na.rm = T)  
      print('NA -> median')
    }
    return(x)  
  } 
  else {
    print('x is not numeric')  
  }
}

source('my_na_rm.R')

dist1 <- my_na_rm(dist1)


my_na_rm(x=c('2', '3', NA))

d1 <- rnorm(2000)
d2 <- runif(2000)

d1[1:10] <- NA
d2[1:10] <- NA

d1 <- my_na_rm(d1)
d2 <- my_na_rm(d2)

# ---

dir('Grants data/', pattern = '*.csv')

grants <- data.frame()

for (i in dir('Grants data/', pattern = '*.csv')) {
  path <- paste('Grants data/', i, sep = '')
  temp_df <- read.csv(path)
  grants <- rbind(temp_df, grants)
}

read_data <- function(folder = 'Grants data/') {
  df <- data.frame()
  num <<- 0
  for (i in dir(folder, pattern = '*.csv')) {
    path <- paste(folder, i, sep = '')
    temp_df <- read.csv(path)
    df <- rbind(temp_df, df)
    num <<- num + 1
  }
  print(paste(as.character(num), 'file(s)'))
  return(df)
}

grants <- read_data()
