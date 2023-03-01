source("https://raw.githubusercontent.com/info-201a-wi23/a3-spl-checkouts-amybalala/main/summary.R")

# make a plot of the total number of checkouts of print versions of each Harry Potter book in the original series
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
