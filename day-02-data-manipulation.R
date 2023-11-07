
library(tidyverse)
library(lubridate)
library(janitor)
library(skimr)

# Installing (if necessary) and load packages using pacman package
# pacman::p_load(tidyverse, lubridate, skimr, janitor)


disney_data <- readr::read_csv("data/disney_plus_titles.csv")

glimpse(disney_data)

# clean names
disney_data_clean_names <- janitor::clean_names(disney_data)

glimpse(disney_data_clean_names)

# statistical summary of data set
skimr::skim(disney_data_clean_names)

summary(disney_data_clean_names)

# finding missing values in vector, data frame
is.na(disney_data_clean_names)

# total count of missing values
sum(is.na(disney_data_clean_names))

# remove all rows with missing values
disney_data_no_nas <- na.omit(disney_data_clean_names)

sum(is.na(disney_data_no_nas))

skimr::skim(disney_data_no_nas)

# using Pipes, %>% from the magrittr package
# connect a sequence of multiple operations. 

disney_data_cleaned <- readr::read_csv("data/disney_plus_titles.csv") %>% 
  janitor::clean_names() %>% 
  na.omit()

disney_data_cleaned %>% head()

disney_data_cleaned %>% tail()

# subsetting data
# Example data_frame_name[row_index(or range of indices), col_name or col_index]

# select data on row 10, with value from column number 3
disney_data_cleaned[10, 3]

# select range of rows from 10 to 15, and values for columns 2 to 5
disney_data_cleaned[10:15, 2:5]

# select rows 3,6,9, with values from column 2,4,6,7
disney_data_cleaned[c(3,6,9), c(2,4,6:7)]


# using column names for subsetting
disney_data_cleaned[1:10, c("title", "director", "country")]


# dplyr

# selecting variables

dplyr::select(disney_data_cleaned, type, title)

# using pipes
disney_data_cleaned %>% 
  select(type, rating, duration)


# filter data 

disney_data_cleaned %>% 
  select(type, rating, duration) %>% 
  dplyr::filter(rating == "PG")

# Run this code. What is the result?
disney_data_cleaned %>% 
  select(2, 3, 6) %>% 
  filter(release_year > 2000)

# Uncomment and run the code below
# disney_data_cleaned %>% 
#   select(2, 3, 6, 8) %>% 
#   filter(release_year > 2000)

# using grepl() with filter()
disney_data_cleaned %>% filter(grepl('United States', country),
                               rating == 'PG') %>% View()

disney_data_cleaned %>% filter(!grepl('United States', country),
                           rating == 'PG') %>% View()

# mutate
disney_data_cleaned %>% 
  select(title, date_added, duration) %>% 
  dplyr::mutate(duration_nums = str_remove(string = duration, pattern = " min") %>% 
           as.numeric())


# group_by and summarise()/summarize()

disney_data_cleaned %>% 
  group_by(release_year) %>% 
  summarise(counts = n())



# data visualization

# bar plot
ggplot(data=disney_data, mapping = aes(rating))+
  geom_bar()

ggplot(disney_data, aes(rating, fill= rating))+
  geom_bar()


disney_data_cleaned %>% 
  group_by(rating) %>% 
  summarise(count_by_rating = n()) %>% 
  ggplot(aes(x=rating, y=count_by_rating, fill=rating))+
  geom_bar(stat = "identity")


df_rating_year <- disney_data_cleaned %>% 
  group_by(release_year) %>% 
  summarise(release_count = n()) %>% 
  ungroup()

# line plot
df_rating_year %>% 
  ggplot( aes(x = release_year, y = release_count)) +
  geom_line()




