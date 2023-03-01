library(dplyr)
library(ggplot2)
library(stringr)
library(plotly)
library(styler)

data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/a3-spl-checkouts-amybalala/main/Checkouts_by_Title.csv", stringsAsFactors = FALSE)

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

# Which book in the series has been checked out the most since the final book's publication?

stone2 <- data_rowling %>%
  filter(str_detect(Title, regex("stone", ignore_case = TRUE))) %>%
  filter(checkout_date > "2007-07-01") %>%
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE)) %>%
  mutate(Book_Title = "(1) Harry Potter and the Sorcerer's Stone")

chamber2 <- data_rowling %>%
  filter(str_detect(Title, regex("chamber", ignore_case = TRUE))) %>%
  filter(checkout_date > "2007-07-01") %>%
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE)) %>%
  mutate(Book_Title = "(2) Harry Potter and the Chamber of Secrets")

goblet2 <- data_rowling %>%
  filter(str_detect(Title, regex("goblet", ignore_case = TRUE))) %>%
  filter(checkout_date > "2007-07-01") %>%
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE)) %>%
  mutate(Book_Title = "(4) Harry Potter and the Goblet of Fire")

hallows2 <- data_rowling %>%
  filter(str_detect(Title, regex("hallows", ignore_case = TRUE))) %>%
  filter(checkout_date > "2007-07-01") %>%
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE)) %>%
  mutate(Book_Title = "(7) Harry Potter and the Deathly Hallows")

azkaban2 <- data_rowling %>%
  filter(str_detect(Title, regex("Azkaban", ignore_case = TRUE))) %>%
  filter(checkout_date > "2007-07-01") %>%
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE)) %>%
  mutate(Book_Title = "(3) Harry Potter and the Prisoner of Azkaban")

phoenix2 <- data_rowling %>%
  filter(str_detect(Title, regex("Phoenix", ignore_case = TRUE))) %>%
  filter(checkout_date > "2007-07-01") %>%
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE)) %>%
  mutate(Book_Title = "(5) Harry Potter and the Order of the Phoenix")

prince2 <- data_rowling %>%
  filter(str_detect(Title, regex("prince", ignore_case = TRUE))) %>%
  filter(checkout_date > "2007-07-01") %>%
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE)) %>%
  mutate(Book_Title = "(6) Harry Potter and the Half-Blood Prince")

book_counts <- rbind(stone2, chamber2, azkaban2, goblet2, phoenix2, prince2, hallows2)

book_counts




