# Make a heatmap for amg description and the gene ID 
#set the working directory with the files 
setwd("C:/Users/apaul3/OneDrive - Clemson University/DARPA FDR Project files/Documents/rdRDA_micro_8130/")
#load data
data <- read.csv("amg_heatmap.csv", row.names = 1)

#install packages 
install.packages("pheatmap")

#create heatmap
library(ggplot2)
library(reshape2)

#convert data
data_long <- melt(as.matrix(data))

#create heatmap
ggplot(data_long, aes(x = Var2, y = Var1, fill = value)) +
  geom_tile(color = "#FAF3E0") +
  scale_fill_gradient(low = "#FAF3E0", high = "orangered3",
                      name = "AMG abundance (MG)") +   # ← legend title
  labs(
    x = "AMG description (DRAMv)",    # ← x-axis label
    y = "AMG Gene ID (DRAMv)"          # ← y-axis label
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, size = 8),
    axis.text.y = element_text(size = 8),
    panel.grid = element_blank()
  )
