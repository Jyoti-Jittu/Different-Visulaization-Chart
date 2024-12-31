# Likert-Style Stacked Bar Chart

This script generates a Likert-style stacked bar chart from dummy self-generated data stored in an Excel file. The output is saved as a high-resolution PNG image.

## Features
- Generates a horizontal stacked bar chart to display survey responses.
- Uses percentage-based data for clear visualization.
- Customizable ggplot aesthetics.

## Prerequisites
Ensure the following R libraries are installed:
- `readxl`
- `ggplot2`
- `reshape2`
- `scales`

You can install these libraries using:
```R
install.packages(c("readxl", "ggplot2", "reshape2", "scales"))
