# Heart Disease using Decision Tree
This project focuses on building a machine learning model to detect heart disease using the Decision Tree algorithm in R. The model aims to classify whether a patient has heart disease based on several medical attributes.

# Dataset
The dataset contains 303 patient records with 14 variables, including:
- Age
- Sex
- Chest Pain Type
- Cholesterol Level
- Blood Pressure
- Maximum Heart Rate
- Exercise Induced Angina
- ST Depression
- Thalassemia
- And other medical indicators

# Tools & Technologies
- R Programming
- dplyr
- party
- caret
- ggplot2

# Project Workflow
## 1. Data Preprocessing
- Handling missing values
- Data cleaning
- Converting target variable into factor
## Data Splitting
- 80% Training Data
- 20% Testing Data
## Model Building
- Decision Tree Clasification using ctree()
## Model Evaluation
- Confusion Matrix
- Accuracy
- Sensitivity
- Specificity
- Precision
- Kappa Statistic
## Data Visualization
- Decision Tree Plot
- Metric Histogram
- Confusion Matrix Heatmap
## Model Performance
### Training Result
| Metric | Value |
|---|---|
| Accuracy | 86.22% |
| Sensitivity | 82.61% |
| Specificity | 89.21% |
| Precision | 86.36% |
| Kappa | 0.7209 |

### Testing Result
| Metric | Value |
|---|---|
| Accuracy | 69.39% |
| Sensitivity | 60.87% |
| Specificity | 76.92% |
| Precision | 70.00% |
| Kappa | 0.3808 |

### Decision Tree Plot
<img width="1884" height="768" alt="image" src="https://github.com/user-attachments/assets/45031b89-eb44-421f-b1c0-e14f26eddbb7" />

### Training Confusion Matrix
<img width="996" height="768" alt="image" src="https://github.com/user-attachments/assets/9ef4f754-ee8b-429e-9874-d899b86bee4c" />

### Testing Confusion Matrix
<img width="996" height="768" alt="image" src="https://github.com/user-attachments/assets/eaee1f29-cd45-44c1-bfdf-7038dab31ce8" />

### Training Metrics Histogram
<img width="996" height="768" alt="image" src="https://github.com/user-attachments/assets/e9860da7-9cb5-46f8-802a-23bff2962c6c" />

### Testing Metrics Histogram
<img width="996" height="768" alt="image" src="https://github.com/user-attachments/assets/cd6b1000-cd14-48e6-9717-7c9258103d98" />

# Key Insight
- The Decision Tree model achieved strong performance on training data (86.22% accuracy) but lower performance on testing data (69.39% accuracy), indicating possible overfitting.
- Variables such as chest pain type (cp), maximum heart rate (thalachh), and exercise-induced angina (exng) showed important contributions in the classification process.
- The project demonstrates how machine learning can be applied to support early heart disease detection using patient medical attributes.
