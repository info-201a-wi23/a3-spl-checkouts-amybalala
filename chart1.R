source("https://raw.githubusercontent.com/info-201a-wi23/a3-spl-checkouts-amybalala/main/summary.R")

library(dplyr)
library(ggplot2)
library(plotly)

# calculate number of checkouts per month per material type
checkouts_by_month <- data %>%
  group_by(checkout_date, MaterialType) %>%
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE))

# make a plot that shows the difference in number of checkouts per month over time
checkouts_over_time_plot <- ggplot(checkouts_by_month) +
  geom_line(aes(
    x = checkout_date,
    y = total_checkouts,
    color = MaterialType
  )) +
  labs(
    title = "Library Checkouts of Books by J.K. Rowling",
    x = "Checkout Date",
    y = "Number of Checkouts",
    color = "Material Type"
  )

ggplotly(checkouts_over_time_plot)
