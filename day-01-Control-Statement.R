# Iteration 1
# iteration consumes time and memory
library(tidyverse)

# repeat() Statement
# performs no tests, simply repeats a given expression indefinitely
# so be careful, repeat() expression must include an exit statement, 
# i.e. break() or return() statement

x <- 5
repeat {
  print(x)
  x = x+1
  if (x == 10){ # note what happens when x == 10
    break
  }
}

# while loop - used to loop until a specific condition is met.

w <- 10
while (w < 20) {
  print(w)
  w = w+1
}

while (w %in% c(3,4,10,11,14)) {
  print(w)
  w = w+1
}

# for loop
# A for loop is used to iterate over a vector in R programming.

for (val in 1:5){
  # statement 
  print(val)
} 

for (num in c(1,2,3,4,5)) {  
  print(num + 2)
}                      

x <- c(2,5,3,9,8,11,6)
count <- 0
for (val in x) {
  if(val %% 3 == 0)  
    count = count+1
}
print(count)

a = 10
b = 40

if_else(a!=b, "a is not equal to b", "a is equal to b")
ifelse(a!=b, "a is not equal to b", "a is equal to b")
