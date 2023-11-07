## Importing and Exporting data

library(tidyverse)
library(xlsx)

# base r function
read.csv("data_files/mtcars.csv") # %>% View()




# readr package
mtcars <- readr::read_csv(file = "data_files/mtcars.csv") #read_csv("data_files/mtcars.csv")



# specifying column types
# for the col_types argument, pass a list of the column names equal to their specific types i.e.
# col_types = list(column_names1 = col_double(), .....)
mtcars <- read_csv("data_files/mtcars.csv", 
                   col_types = "didididdiii")


# readxl
library(readxl)
xlsx_example <- readxl::read_excel("data_files/chickwts.xlsx")

# get the names of worksheets in the excel workbook
readxl::excel_sheets("data_files/datasets.xlsx")


# read by sheet number
# all functions are from readxl package
multiple_sheets_quakes <- read_excel("data_files/datasets.xlsx", sheet = 2)

# read by worksheet name
multiple_sheets_chickwts <- read_excel("data_files/datasets.xlsx", sheet = "chickwts")

# specify number of rows
read_excel("data_files/chickwts.xlsx", n_max = 20)

# return range of cells
read_excel("data_files/chickwts.xlsx", range = "A1:B4")

# return the first 4 rows
read_excel("data_files/chickwts.xlsx", range = cell_rows(1:4))

# return range of columns
read_excel("data_files/chickwts.xlsx", range = cell_cols("B:C"))

# multiple worksheets and range of columns
read_excel("data_files/datasets.xlsx", range = "mtcars!B1:D5")


# Specify character respresenting missing values, and replace with "NA"
# exmaple, let's say anywhere you find "setosa", it means the value is missing,
# so replace "setosa" with NA
read_excel("data_files/datasets.xlsx",sheet = "iris", na = "setosa")


# Exporting data
#install.packages("xlsx")
library(xlsx)
# save a dataframe as excel file
xlsx::write.xlsx(x = mtcars, file = "sql_data/cleaned_studentrecords.xlsx")

readr::write_csv(xlsx_example, "data_files/x_example.csv")


