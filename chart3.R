source("https://raw.githubusercontent.com/info-201a-wi23/a3-spl-checkouts-amybalala/main/summary.R")

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

book_checkouts <- ggplot(book_counts) +
  geom_col(mapping = aes(
    x = Book_Title,
    y = total_checkouts,
    fill = Book_Title
  )) +
  labs(
    title = "Total Checkouts for Each Harry Potter Book After Final Publication",
    x = "Book",
    y = "Total Checkouts",
    fill = "Book Title"
  ) +
  theme(axis.text.x = element_blank())

ggplotly(book_checkouts)
