# R program to illustrate
# Descriptive Analysis
getwd()
# Import the data using read.csv()
myData = read.csv("C:/Users/Girija/Dataset/CardioGoodFitness.csv")
# Print the first 6 rows
print(head(myData))
# Summary statistics for the entire dataset
summary(myData)
# Summary statistics for numerical variables
summary(myData[c('Age', 'Income', 'Miles')])



#installed ggplot2
install.packages("ggplot2")

library(ggplot2)

#Histogram of Age Distribution
ggplot(myData, aes(x = Age)) +
  geom_histogram(binwidth = 2, fill = "blue", color = "red", alpha = 0.8) +
  labs(title = "Age Distribution", x = "Age", y = "Frequency")

#Boxplot of Miles by Gender
ggplot(myData, aes(x = Gender, y = Miles, fill = Gender)) +
  geom_boxplot() +
  labs(title = "Miles Distribution by Gender", x = "Gender", y = "Miles") +
  theme_minimal()
#Bar Chart of Education Levels
ggplot(myData, aes(x = factor(Education), fill = factor(Education))) +
  geom_bar() +
  labs(title = "Education Distribution", x = "Education Level", y = "Count") +
  theme_minimal()

#Mean -> It is the sum of observations divided by the total number of observations. It is also defined as average which is the sum divided by count.
mean = mean(myData$Age)
print(mean)

#Median -> the median would be the average of two central elements.
median = median(myData$Age)
print(median)

#Mode -> It is the value that has the highest frequency in the given data set. 
#The data set may have no mode if the frequency of all data points is the same. 
#Also, we can have more than one mode if we encounter two or more data points having the same frequency.
install.packages("modeest")
library(modeest)
mode = mfv(myData$Age)
print(mode)

#Range --> The range describes the difference between the largest and smallest data point in our data set. 
#The bigger the range, the more is the spread of data and vice versa.
# Range = Largest data value – smallest data value 


# Calculate the maximum
max = max(myData$Age)
# Calculate the minimum
min = min(myData$Age)
# Calculate the range
range = max - min

cat("Range is:\n")
print(range)

# Alternate method to get min and max
r = range(myData$Age)
print(r)

#Variance 
variance = var(myData$Age)
print(variance)

#Standard Deviation 
std = sd(myData$Age)
print(std)

#Some more R function used in Descriptive Statistics in R
#Quartiles 
quartiles = quantile(myData$Age)
print(quartiles)

#Interquartile Range 
IQR = IQR(myData$Age)
print(IQR)

#summary() function in R
summary = summary(myData$Age)
print(summary)

#Summary of the data frame 
# Calculating summary
summary = summary(myData)
print(summary)
