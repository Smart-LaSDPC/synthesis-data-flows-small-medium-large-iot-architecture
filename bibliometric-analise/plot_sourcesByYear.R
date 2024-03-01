#file
path_fileName <- "./data_files/transformed_data.csv"

# Syntax of read.csv()
data <- read.csv(path_fileName, header = TRUE, sep = ",", quote = "\"",
                       dec = ".", fill = TRUE, comment.char = "")

# Genering frame to sources by year
ssy <- data %>% group_by(source, year) %>% 
  summarise(total_count=n(),.groups = 'drop') %>%
  as.data.frame()

# Libraries
library(ggplot2)
library(dplyr)

ggplot(ssy, aes(x=year, y=total_count, color=source, 
                 line=source, group= source))+ 
  scale_color_manual(values=c('#F4D03F','#3498DB','#E74C3C','#6C3483'))+
  geom_point(size=1,shape=21,aes(color=source))+
  theme(axis.text.x = element_text(angle = 30, vjust = 0.5))+
  scale_x_continuous("", labels = as.character(ssy$year), breaks = ssy$year)+
  scale_y_continuous("")+
  geom_line()


