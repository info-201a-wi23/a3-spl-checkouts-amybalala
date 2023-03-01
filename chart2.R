source("https://raw.githubusercontent.com/info-201a-wi23/a3-spl-checkouts-amybalala/main/summary.R")


# make data frame that includes total print book checkouts per month of Harry Potter and the Sorcerer's Stone after the last book in the series was published in July 2007
stone <- data_rowling %>%
  filter(str_detect(Title, regex("stone", ignore_case = TRUE))) %>%
  filter(checkout_date > "2007-07-01") %>%
  group_by(checkout_date) %>%
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE)) %>%
  mutate(Title = "(1) Harry Potter and the Sorcerer's Stone")

# make data frame that includes total print book checkouts per month of Harry Potter and the Deathly Hallows after it was published in July 2007
hallows <- data_rowling %>%
  filter(str_detect(Title, regex("hallows", ignore_case = TRUE))) %>%
  group_by(checkout_date) %>%
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE)) %>%
  mutate(Title = "(7) Harry Potter and the Deathly Hallows")

# combine the two above dataframes into one
combined <- rbind(stone, hallows)

# Make a plot that tracks the number of checkouts over time of the first and last Harry Potter books
firstlast <- ggplot(combined) +
  geom_line(mapping = aes(
    x = checkout_date,
    y = total_checkouts,
    color = Title
  )) +
  labs(
    title = "Checkouts of First and Last Harry Potter Books Over Time",
    x = "Checkout Date",
    y = "Total Checkouts"
  )

ggplotly(firstlast)






