## My functions do almost the same thing as sample functions in the Assignment do.
## Difference is using matrix instead of a vector and computing Inverse of this matrix 
## instead of vector's mean.

#This function creates a special "matrix" object that can cache its inverse; object is
#a list of four functions:
#(1) set_val specifies value of matrix stored in the main function
#(2) get_val returns the value of matrix stored in the main function
#(3) set_inv stores (not calculates) value of matrix's Inverse in main function
#(4) get_inv retrieves Inverse from there

makeCacheMatrix <- function(x = matrix()) {
  inv = NULL #inv for "Inverse"
  set_val <-  function(y) {
    x <<- y #make x (in main function's environment) equal to set_val's argument
    inv <<- NULL #Inverse of the matrix is not calculated
  }
  get_val <- function() x #no arguments, just return value
  set_inv <-  function(inverse) inv <<- inverse #store value of Inverse in 'inv' variable
  get_inv <-  function() inv #again just return value
  list(set_val = set_val, get_val = get_val, set_inv = set_inv, get_inv =get_inv) #return
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
