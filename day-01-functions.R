
### Built-in Functions

c()

data_vector <- c(1, 3, 3, 9, 11.2, 14, 28.7, 30, 15, 5, 5, 5, 2.7, 21, 5.7, 9.1, 24.6)

sum()

mean()

median()

min()

mode()


# Define your custom functions
# function without an argument
sayHello <- function(){
  print("Hello! This is my first function!")
}

sayHello()

# function with a single argument
multiplyByTwo <- function(x) {
  return(x * 2)
}

v1 <- c(1, 4, 7)

multiplyByTwo(v1)

y=1
my_vec_args <- 1:10 # vector with 10 elements

# define function with arguments that can be for multiple arguments
addNumbers <- function(x) {
  if(length(x)>1){
    result = 0
    for (i in seq_along(x)) {
      result <- result + x[i]
      result
    }
    return(result)
  } else{
    return(x)
  }
}

addNumbers(y)
addNumbers(my_vec_args)



