setwd("G:/WorkingData/Work @ Home/GitHub/R")

install.packages("swirl")
install.packages("quantstrat")
install.packages("quantmod")
install.packages("performanceanalyitics")

library("boot", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("class", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("cluster", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("compiler", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("datasets", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("devtools", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("foreign", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("ggplot2", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("graphics", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("grDevices", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("grid", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("KernSmooth", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("MASS", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("methods", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("nlme", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("nnet", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("parallel", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("rpart", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("spatial", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("splines", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("stats", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("stats4", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("survival", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("swirl", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("tcltk", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("tools", lib.loc="C:/Program Files/R/R-3.2.1/library")
library("utils", lib.loc="C:/Program Files/R/R-3.2.1/library")
rm(list=ls())
install_from_swirl("Getting and Cleaning Data")
swirl()

vec <- 0:11
tor = seq(from = 22, to = 0, by = -2)
database <- data.frame(vec, tor)
dictionary <- names(database) <- c("mat", "rix")
class(database)
print(vec ^ tor)
print(vec * tor)
print(vec / tor)
print(vec + tor)
print(vec - tor)
any(vec < tor)
any(vec > tor)
any(vec == tor)
all(vec != tor)
all(vec & tor)
print(vec ** tor)
sqrt(vec)
log(tor)
exp(vec)
log2(tor)
abs(vec)

plot(vec, tor)

as.character(vec)
as.integer(vec)
as.numeric(vec)
as.complex(vec)
as.logical(vec)
as.hexmode(vec)
as.octmode(vec)
as.vector(vec)
as.matrix(vec)
as.list(vec)
as.data.frame(database)
as.matrix(database)
as.list(database)
as.vector(database)

is.character(vec)
is.integer(vec)
is.numeric(vec)
is.complex(vec)
is.logical(vec)
is.vector(vec)
is.matrix(vec)
is.list(vec)

mat <- vec
mat.rix = tor
vect = c(vec, tor)
small = vect[-11:-19]
large = vect[vect > 9]
assign("subset", vect[-c(4, 8)])

mat.rows = matrix(small, nrow = 3, byrow = TRUE)
mat.cols = matrix(small, nrow = 3, byrow = FALSE)
mat.rows[2, 2]
mat.cols[2, 2]
mat.rows[3, ]
mat.cols[, 3]
mat.rows[c(2,3), c(2,3)]
mat.cols[c(2,3), c(2,3)]

class(mat)
class(mat.rows)
class(mat.cols)

today = as.Date("2020-02-20")
class(today)

getwd()
directory_listing <- dir()
length(directory_listing)
nchar(directory_listing)
class(directory_listing)
nchar("directory_listing")
directory_listing[0:5]
ls()
rm(directory_listing)

setwd("G:/WorkingData/Work @ Home/GitHub/R/Data")
national <- read.csv("Data_National.csv", TRUE, ",")
head(national)
hist(national$Murders, main = "Murders", ylab = "Country", xlab = "Murders")
plot(national$Murders, national$GDP.PPP, main = "Murders", ylab = "GDP", xlab = "Murders")

head(diamonds)
qplot(diamonds$carat, diamonds$price, diamonds, color = diamonds$color)

library("xml2", lib.loc="C:/Program Files/R/R-3.2.1/library")
web_table <- readHTMLTable("http://", which = 1)


file.exists("Data")
file.exists("Graphs")
if (!file.exists("Results")) {
  dir.create("Results")
}

URL <- "https://api.ipify.org/?format=plain"
download.file(URL, "./Results/MyIP.txt")
list.files("./Results/MyIP.txt")
cat("./Results")
MyIP <- read.table("./Results/MyIP.txt", sep = "", header = FALSE)
head(MyIP)
tail(MyIP)
read.csv("./csvfile.csv", sep = ",", header = TRUE, quote = TRUE, nrows = 10, skip = 2)
read.csv2("./csv2file.csv", sep = ",", header = TRUE)

