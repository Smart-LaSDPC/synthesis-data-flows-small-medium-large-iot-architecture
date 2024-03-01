#file
path_fileName <- "./data_files/transformed_data.csv"

# Syntax of read.csv()
data <- read.csv(path_fileName, header = TRUE, sep = ",", quote = "\"",
                       dec = ".", fill = TRUE, comment.char = "")

# Generating frame Publication_type by YEAR
ptby <- data %>% group_by(publication_type, year) %>% 
  summarise(total_count=n(),.groups = 'drop') %>%
  as.data.frame()

# Libraries
library(ggplot2)
library(dplyr)

ggplot(ptby, aes(x=year, y=total_count, color=publication_type, 
                 line=publication_type, group= publication_type))+ 
  scale_color_manual(values=c('#F4D03F','#3498DB','#E74C3C','#6C3483'))+
  geom_point(size=1,shape=21,aes(color=publication_type))+
  theme(axis.text.x = element_text(angle = 30, vjust = 0.5))+
  scale_x_continuous("", labels = as.character(ptby$year), breaks = ptby$year)+
  scale_y_continuous("")+
  geom_line()


