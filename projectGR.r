require(foreign)
require(MASS)
data <- read.csv("C:/Users/Girija/Dataset/Admission_Predict.csv")
head(data)
data$Admission <- as.factor(data$Admission)
model <- glm(Admission ~ GRE + GPA + Rank, data = data, family = binomial)
summary(model)
coefficients(model)
data$predicted_prob <- predict(model, type = "response")
data$predicted_class <- ifelse(data$predicted_prob > 0.5, 1, 0)
table(Predicted = data$predicted_class, Actual = data$Admission)
install.packages("caret")
library(caret)
confusion_matrix <- confusionMatrix(factor(data$predicted_class), data$Admission)
print(confusion_matrix)
deviance(model)
pearson.residuals <- residuals(model, type = "pearson")
sum(pearson.residuals^2)
install.packages("pROC")
library(pROC)
roc_curve <- roc(data$Admission, data$predicted_prob)
plot(roc_curve)
auc(roc_curve)
require(MASS)
require(caret)
require(pROC)
data <- data.frame(
  GRE = c(300, 320, 310, 330, 315),
  Rank = c(95, 105, 100, 110, 102),
  University_Rating = c(3, 4, 3, 5, 4),
  SOP = c(3, 4, 3, 5, 4),
  LOR = c(2, 4, 3, 5, 4),
  GPA = c(8.5, 9.0, 8.7, 9.5, 9.2),
  Research = c(1, 1, 0, 1, 0),
  Admission = c(0.6, 0.8, 0.5, 0.9, 0.7)
)
head(data)
data$Admission <- as.numeric(data$Admission)
model <- glm(Admission ~ GRE + Rank + University_Rating + SOP + LOR + GPA + Research, 
             data = data, family = binomial)
summary(model)
new_data <- data.frame(
  GRE = 310,
  Rank = 100,
  University_Rating = 3,
  SOP = 3,
  LOR = 3,
  GPA = 8.9,
  Research = 1
)
predicted_prob <- predict(model, newdata = new_data, type = "response")
predicted_prob

predicted_class <- ifelse(predicted_prob > 0.5, 1, 0)
predicted_class

cat("Predicted probability of admission:", predicted_prob, "\n")
cat("Predicted class (1 if admitted, 0 if not):", predicted_class, "\n")
