# Load necessary libraries
library(readxl)
library(ggplot2)
library(reshape2)
library(scales)

# Read the input data from an Excel file
input_file <- "likert_data.xlsx"
likert_data <- as.data.frame(read_excel(input_file))

# Melt the data into long format for ggplot
likert_melted <- melt(likert_data, id.vars = "Condition", variable.name = "Response", value.name = "Percentage")

# Plot the likert-style stacked bar chart
likert_plot <- ggplot(likert_melted, aes(x = Condition, y = Percentage, fill = Response)) +
  geom_bar(stat = "identity", position = "stack") +
  coord_flip() +
  scale_fill_brewer(palette = "Accent") +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    axis.text = element_text(face = "bold", color = "black"),
    axis.title = element_blank()
  ) +
  scale_y_continuous(labels = label_percent(scale = 1)) +
  labs(fill = "Response")

# Save the plot as a high-resolution image
output_file <- "likert_plot.png"
ggsave(output_file, plot = likert_plot, dpi = 600, height = 7, width = 13)

