# Load necessary libraries
library(readxl)
library(ggplot2)
library(reshape2)
library(scales)

# Read the input data from an Excel file
input_file <- "likert_data.xlsx"
data <- as.data.frame(read_excel(input_file))

# Melt the data into long format for ggplot
data_melted <- melt(data, id.vars = "Condition", variable.name = "Response", value.name = "Percentage")

# Plot the likert-style stacked bar chart
likert_plot <- ggplot(data_melted, aes(x = Condition, y = Percentage, fill = Response)) +
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

# 1. Stacked Bar Plot
ggplot(data_melted, aes(x = reorder(Condition, -Percentage), y = Percentage, fill = Response)) +
  geom_bar(stat = "identity", position = "stack") +
  coord_flip() +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Awareness and Opinions on Thalassemia Major", x = "Condition", y = "Percentage") +
  theme_minimal(base_size = 14) +
  theme(legend.position = "bottom", axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("stacked_bar_plot.png", width = 12, height = 6, dpi = 300)

# 2. Grouped Bar Plot
ggplot(data_melted, aes(x = reorder(Condition, -Percentage), y = Percentage, fill = Response)) +
  geom_bar(stat = "identity", position = "dodge") +
  coord_flip() +
  scale_fill_brewer(palette = "Paired") +
  labs(title = "Grouped Responses for Thalassemia Major", x = "Condition", y = "Percentage") +
  theme_minimal(base_size = 14) +
  theme(legend.position = "bottom")
ggsave("grouped_bar_plot.png", width = 12, height = 6, dpi = 300)

# 3. Pie Chart for a Specific Condition
specific_condition <- subset(data_melted, 
                             Condition == "Carrier screening can be done using EDTA blood")

ggplot(specific_condition, aes(x = "", y = Percentage, fill = Response)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  scale_fill_brewer(palette = "Pastel1") +
  labs(title = "Response Distribution for Bone Marrow Awareness", x = "", y = "") +
  theme_void(base_size = 14) +
  theme(legend.position = "bottom")
ggsave("pie_chart_EDTA.png", width = 6, height = 6, dpi = 300)

# 4. Line Plot for Trend Analysis (if applicable)
ggplot(data_melted, aes(x = reorder(Condition, -Percentage), y = Percentage, group = Response, color = Response)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  coord_flip() +
  scale_color_brewer(palette = "Dark2") +
  labs(title = "Trend of Awareness and Beliefs", x = "Condition", y = "Percentage") +
  theme_minimal(base_size = 14) +
  theme(legend.position = "bottom")
ggsave("line_plot_trend.png", width = 12, height = 6, dpi = 300)

# 5. Heatmap of Responses
ggplot(data_melted, aes(x = Response, y = reorder(Condition, -Percentage), fill = Percentage)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "blue4", high = "hotpink3") +
  labs(title = "Heatmap of Responses", x = "Response", y = "Condition") +
  theme_minimal(base_size = 14) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("heatmap_responses.png", width = 10, height = 8, dpi = 300)
