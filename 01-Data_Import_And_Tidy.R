library(tidyverse)

data <- read_csv("data.csv",
                 na = "",
                 col_select = -c(1, 5, 10))

colnames(data) <- c("Age", "Industry", "Job", "Annual_salary",
                    "Additional_monetary", "Currency", "Other_currency",
                    "Country", "State", "City", "Overall_professional_work_experience",
                    "In_field_professional_work_experience", 
                    "Level_of_education", "Gender", "Race")


data <- type_convert(data, col_types = "ffciiffcfcfffff")
data$Other_currency <- toupper(data$Other_currency)
data$Additional_monetary <- ifelse(is.na(data$Additional_monetary), 0, data$Additional_monetary)

head(data)
str(data)

x <- data %>% filter(Currency == "USD") %>% distinct(Currency, Country)
print(x, n =200)
