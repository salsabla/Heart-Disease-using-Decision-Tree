# =================HEART DISEASE DETECTION USING DECISION TREE==================

# LOAD LIBRARIES================================================================
library(dplyr)
library(party)
library(caret)
library(ggplot2)
library(readxl)

# LOAD DATA=====================================================================
data <- read.csv("heart.csv")
dim(data) # Melihat dimensi dan struktur data
str(data)
summary(data)

# DATA PREPROCESSING============================================================
rawdata <- data # Menyalin data asli

for(i in 1:ncol(rawdata)){
  rawdata[is.na(rawdata[, i]), i] <- mean(rawdata[, i], na.rm = TRUE)
} # Mengatasi missing value dengan mean

rawdata3 <- na.omit(rawdata) # Menghapus missing value

rawdata3$output <- as.factor(rawdata3$output) # Mengubah output menjadi factor

str(rawdata3) # Melihat struktur data setelah preprocessing

# SPLIT DATA TRAINING & TESTING=================================================
set.seed(1)

sampel <- sample(
  2,
  nrow(rawdata3),
  replace = TRUE,
  prob = c(0.8, 0.2)
)

trainData <- rawdata3[sampel == 1, ]
testData  <- rawdata3[sampel == 2, ]

# MEMBANGUN MODEL DECISION TREE=================================================
tree <- ctree(
  output ~ age + sex + cp + trtbps + chol +
    fbs + restecg + thalachh + exng +
    oldpeak + slp + caa + thall,
  data = trainData
)

tree # Menampilkan model
plot(tree) # Visualisasi Decision Tree

# PREDIKSI DATA TRAINING========================================================
trainPred <- predict(tree)
table(trainPred, trainData$output) # Confusion Matrix Training
conf_matrix_train <- confusionMatrix(
  table(trainPred, trainData$output)
)
conf_matrix_train

# VISUALISASI METRIK TRAINING===================================================
hist_data_train <- data.frame(
  Metrik = names(conf_matrix_train$byClass),
  Nilai = unname(conf_matrix_train$byClass)
)

ggplot(
  hist_data_train,
  aes(x = Metrik, y = Nilai, fill = Metrik)
) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(
      angle = 45,
      hjust = 1
    )
  ) +
  labs(
    title = "Histogram Metrik Training",
    x = "Metrik",
    y = "Nilai",
    fill = "Metrik"
  )

# CONFUSION MATRIX PLOT TRAINING================================================
conf_matrix_table_train <- as.table(conf_matrix_train$table)

plot_conf_matrix_train <- as.data.frame(
  as.table(conf_matrix_table_train)
)

colnames(plot_conf_matrix_train)

ggplot(
  data = plot_conf_matrix_train,
  aes(x = trainPred, y = Var2, fill = Freq)
) +
  geom_tile(color = "white") +
  geom_text(aes(label = Freq), vjust = 1) +
  scale_fill_gradient(
    low = "#D9D2D0",
    high = "#594D3E"
  ) +
  theme_minimal() +
  labs(
    title = "Confusion Matrix Training",
    x = "Prediksi",
    y = "Aktual",
    fill = "Frekuensi"
  )

# PREDIKSI DATA TESTING=========================================================
testPred <- predict(tree, newdata = testData)
table(testPred, testData$output) # Confusion Matrix Testing

conf_matrix_test <- confusionMatrix(
  table(testPred, testData$output)
)
conf_matrix_test

# VISUALISASI METRIK TESTING====================================================
hist_data_test <- data.frame(
  Metrik = names(conf_matrix_test$byClass),
  Nilai = unname(conf_matrix_test$byClass)
)

ggplot(
  hist_data_test,
  aes(x = Metrik, y = Nilai, fill = Metrik)
) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(
      angle = 45,
      hjust = 1
    )
  ) +
  labs(
    title = "Histogram Metrik Testing",
    x = "Metrik",
    y = "Nilai",
    fill = "Metrik"
  )

# CONFUSION MATRIX PLOT TESTING=================================================
conf_matrix_table_test <- as.table(conf_matrix_test$table)

plot_conf_matrix_test <- as.data.frame(
  as.table(conf_matrix_table_test)
)

colnames(plot_conf_matrix_test)

ggplot(
  data = plot_conf_matrix_test,
  aes(x = testPred, y = Var2, fill = Freq)
) +
  geom_tile(color = "white") +
  geom_text(aes(label = Freq), vjust = 1) +
  scale_fill_gradient(
    low = "#D9D2D0",
    high = "#594D3E"
  ) +
  theme_minimal() +
  labs(
    title = "Confusion Matrix Testing",
    x = "Prediksi",
    y = "Aktual",
    fill = "Frekuensi"
  )

# HASIL EVALUASI MODEL==========================================================
conf_matrix_test$overall['Accuracy'] # Accuracy
conf_matrix_test$byClass['Sensitivity'] # Sensitivity
conf_matrix_test$byClass['Specificity'] # Specificity
conf_matrix_test$byClass['Pos Pred Value'] # Precision
conf_matrix_test$byClass['Neg Pred Value'] # Negative Predictive Value
conf_matrix_test$overall['Kappa'] # Kappa
