#file
path_fileName <- "./data_files/transformed_data.csv"

# Syntax of read.csv()
data <- read.csv(path_fileName, header = TRUE, sep = ",", quote = "\"",
                       dec = ".", fill = TRUE, comment.char = "")


# Generating frame Publication by YEAR
pby <- data %>% group_by(year) %>% 
  summarise(total_count=n(),.groups = 'drop') %>%
  as.data.frame()

# Another way
#agg_df <- aggregate(data$year, by=list(data$year), FUN=length)
#agg_df


# Generating frame Publication_type by YEAR
ptby <- data %>% group_by(publication_type, year) %>% 
  summarise(total_count=n(),.groups = 'drop') %>%
  as.data.frame()


# Genering frame for studies by sources  
ss <- data %>% group_by(source) %>% 
  summarise(total_count=n(),.groups = 'drop') %>%
  as.data.frame()

