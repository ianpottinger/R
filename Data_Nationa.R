# install.packages("ggplot2")
# install.packages("gridExtras")

library(ggplot2)
library(gridExtra)

data <- read.csv('Data/Data_National.csv', TRUE)
head(data)




#---------------------- Ethnic Fraction ----------------------#

# Model the linear regression GDP and Ethnic Fractionalisation Index
model1 <- lm(data$Ethnic.Fraction ~ data$GDP.PPP)
summary(model1)

# Model the linear regression Crime and Ethnic Fractionalisation Index
model1a <- lm(data$Ethnic.Fraction ~ data$Crime)
summary(model1a)

# Model the linear regression Crime and GDP.PPP
model1b <- lm(data$GDP.PPP ~ data$Crime)
summary(model1b)



# Plot data with linear regression
plotEth <- ggplot(data, aes(x=Ethnic.Fraction, y=GDP.PPP, color=Crime)) +
	geom_point(aes(size=Murders)) +
	scale_colour_gradient(high="red") +
	geom_smooth(method="lm") +
	geom_text(aes(Ethnic.Fraction, GDP.PPP+1500, size=10, label=Country))
print(plotEth)

ggsave("Graphs/Model1_BBC.pdf", width=16, height=9, units="in", dpi=600, useDingbats=FALSE)





#---------------------- Plot and Linear Regression on raw data ----------------------#

summary(data)


# Model the linear regression
model2 <- lm(data$IQ ~ data$GDP.PPP)
summary(model2)


# Plot data with linear regression
plotRaw <- ggplot(data, aes(x=IQ, y=GDP.PPP, color=Crime)) +
	geom_point(aes(size=Murders)) +
	scale_colour_gradient(high="red") +
	geom_smooth(method="lm") +
	geom_text(aes(IQ, GDP.PPP+1500, size=10, label=Country))
print(plotRaw)

ggsave("Graphs/Model2_IQ.pdf", width=16, height=9, units="in", dpi=600, useDingbats=FALSE)


# Ethnic Fraction vs IQ
grid.arrange(plotEth, plotRaw, ncol=2)



#---------------------- Remove Outliers ----------------------#

dataClean <- data

# Arabian Peninsula
dataClean[dataClean$IQ<90 & dataClean$GDP.PPP>35000,]
dataClean <- dataClean[dataClean$IQ>=90 | dataClean$GDP.PPP<=35000,]

# Former communist countries
dataClean[dataClean$IQ>90 & dataClean$GDP.PPP<15000,]
dataClean <- dataClean[dataClean$IQ<=90 | dataClean$GDP.PPP>+15000,]

# Compaire old and new data set length 
length(data$IQ)
length(dataClean$IQ)
length(data$IQ) - length(dataClean$IQ)





#---------------------- Plot and Linear Regression on clean data ----------------------#

summary(dataClean)


# Model the linear regression
model3 <- lm(dataClean$IQ ~ dataClean$GDP.PPP)
summary(model3)


# Plot data with linear regression
plotClean <- ggplot(dataClean, aes(x=IQ, y=GDP.PPP, color=Crime)) +
	geom_point(aes(size=Murders)) +
	scale_colour_gradient(high="red") +
	geom_smooth(method="lm") +
	geom_text(aes(IQ, GDP.PPP+1500, size=10, label=Country))
print(plotClean)

ggsave("Graphs/Model3_IQ_Clean.pdf", width=16, height=9, units="in", dpi=600, useDingbats=FALSE)


#show both plots side by side
grid.arrange(plotRaw, plotClean, ncol=2)




#---------------------- Non Linear Regression on clean data ----------------------#

summary(dataClean)

# Plot data with local polynomial regression fitting
plotNL <- ggplot(dataClean, aes(x=IQ, y=GDP.PPP, color=Crime)) +
	geom_point(aes(size=Murders)) +
	scale_colour_gradient(high="red") +
	geom_text(aes(IQ, GDP.PPP+1500, size=10, label=Country)) +
	geom_smooth(method = "lm", se = FALSE, size=0.5, color="black") +
	geom_smooth(method = "loess",se = FALSE, size = 1, color="purple")
print(plotNL)

ggsave("Graphs/Model4A_IQ_nlLoess.pdf", width=16, height=9, units="in", dpi=600, useDingbats=FALSE)



# Model the non linear regression
model4 <- lm(dataClean$GDP.PPP ~ poly(dataClean$IQ, 2, raw=TRUE))
summary(model4)


# Plot data with polynomial regression model
plotNL <- ggplot(dataClean, aes(x=IQ, y=GDP.PPP, color=Crime)) +
	geom_point(aes(size=Murders)) +
	scale_colour_gradient(high="red") +
	geom_text(aes(IQ, GDP.PPP+1500, size=10, label=Country)) +
#	geom_smooth(method = "lm", se = FALSE, size=0.5, color="black") +
	stat_smooth(method="lm", formula=y ~ poly(x, 2, raw=TRUE),colour="blue")
print(plotNL)

ggsave("Graphs/Model4B_IQ_Polly.pdf", width=16, height=9, units="in", dpi=600, useDingbats=FALSE)



#---------------------- Compaire BBC and IQ theory ----------------------#

summary(model1)
summary(model4)




