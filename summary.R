library(dplyr)
library(styler)

data <- read.csv("C:/Users/balal/Documents/INFO201code/assignments/a3-spl-checkouts-amybalala/Checkouts_by_Title.csv")

# add a column with that pastes together the checkout month and year, with "01" as the default day

data <- data %>% mutate(checkout_date = paste0(CheckoutYear, "-", CheckoutMonth, "-", "01"))

data$checkout_date <- as.Date(data$checkout_date, format = "%Y-%m-%d")

# filter out content not listed with J.K. Rowling as the creator
data_rowling <- data %>%
  filter(Creator %in% c("Rowling, J. K."))

# filter the data for books only
data_books <- data_rowling %>%
  filter(MaterialType == "BOOK")

# How man books are listed under a creator other than J.K. Rowling?
data_other <- data %>% 
  filter(!Creator %in% c("Rowling, J. K."))
  
number_other <- data_other %>% filter(MaterialType =="BOOK") %>% 
  summarize(total_books = nrow(data_other))

# How many books are listed under J.K. Rowling?
number_books <- data_books %>%
  summarize(total_books = nrow(data_books))

# Which book had the highest total number of checkouts in a single month?
most_checkouts <- data_books %>%
  filter(Checkouts == max(Checkouts, na.rm = TRUE))

# Which month had the highest total number of checkouts across all titles (listed under J.K. Rowling)?
month_most_checkouts <- data_books %>%
  group_by(checkout_date) %>%
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE)) %>%
  filter(total_checkouts == max(total_checkouts, na.rm = TRUE))

# Which month had the lowest total number of checkouts across all titles?
month_least_checkouts <- data_books %>%
  group_by(checkout_date) %>%
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE)) %>%
  filter(total_checkouts == min(total_checkouts, na.rm = TRUE))
