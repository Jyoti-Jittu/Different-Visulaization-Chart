# Likert-Style Stacked Bar Chart

This script contains R code for visualizing dummy self-generated data stored in an Excel file. The output is saved as a high-resolution PNG images.


## Visualization
- **Stacked Bar Plot**: Displays overall responses for each condition.
- **Grouped Bar Plot**: Compares "Yes" and "No" responses side by side.
- **Pie Chart**: Highlights response distribution for a specific condition.
- **Line Plot**: Shows trends across different conditions.
- **Heatmap**: Visualizes the intensity of responses.


## Prerequisites
Ensure the following R libraries are installed:
- `readxl`
- `ggplot2`
- `reshape2`
- `scales`

You can install these libraries using:
```R
install.packages(c("readxl", "ggplot2", "reshape2", "scales"))
