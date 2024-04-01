library(tidyverse)
# published link 
published_data_link <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vSn9mbPcQDLTzHf8J8DtdDz6RxgBMGvTpcYa4rJRYm1UldkV8edd5_rrGEbuBOu9r0Jn68r5pPsTkE4/pub?output=csv"

# read csv file into dataframe
learning_data <- read_csv(published_data_link)

# drop timestamp data column
learning_data <- learning_data[-1]

# number of responses
n_resp <- nrow(learning_data)


# rename columns
learning_data <- learning_data %>% 
  rename("grocery_spending" = 1) %>% 
  rename("transport_spending" = 2) %>%
  rename("total_spending" = 3) %>%
  rename("live_with_parents" = 4) %>%
  rename("income_source" = 5) %>%
  rename("spending_category" = 6) %>%
  rename("public_transport" = 7)

# summary statistics and bar charts

# proportion of responses who use public transport
uses_public_transport <- (learning_data$public_transport== "Yes") %>%
  sum(.) / n_resp


#uses_public_transport <- paste0(round(uses_public_transport * 100, 1), "%")

# mean weekly transport spending
mean(learning_data$transport_spending)


# bar plots


# group data by whether or not public transport was used
transport_data <- learning_data %>%
  group_by(public_transport) %>%
  summarise(mean = mean(transport_spending))

# plot average transport expense for those who used public transport and those who didn't
ggplot(transport_data, aes(x = factor(public_transport), y = mean)) + 
  geom_col(color = "black", fill = "cyan3") + 
  labs(
    title = "Average Spending On Transport by Public Tranport Usage",
    x = "Public Transport Taken or Not",
    y = "Average Weekly Spending"
  )

# group data by total spending
grocery_data <- learning_data %>%
  group_by(total_spending) %>%
  summarise(mean = mean(grocery_spending))

# plot average grocery expense based on weekly spending
ggplot(grocery_data, aes(x = factor(total_spending), y = mean)) + 
  geom_col(color = "black", fill = "cyan3") + 
  labs(
    title = "Average Spending On Groceries by Total Weekly Spending",
    x = "Weekly Spending",
    y = "Average Weekly Spending"
  )




