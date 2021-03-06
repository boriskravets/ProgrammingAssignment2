## My functions do almost the same thing as sample functions in the Assignment do.
## Difference is using matrix instead of a vector and computing Inverse of this matrix 
## instead of vector's mean.

#This function creates a special "matrix" object that can cache its inverse; object is
#a list of four functions:
#(1) set_val specifies value of matrix stored in the main function (is it essential?)
#(2) get_val returns the value of matrix stored in the main function
#(3) set_inv stores (not calculates) value of matrix's Inverse in main function
#(4) get_inv retrieves Inverse from there

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL #inv for "Inverse"
  set_val <-  function(y) { #FUN seems to work even without this sub-function
    x <<- y #make x (in main function's environment) equal to set_val's argument
    inv <<- NULL #setting new value => reset the NULL value of Inverse
  }
  get_val <- function() x #no arguments, just return value
  set_inv <-  function(inverse) inv <<- inverse #store value of Inverse in 'inv' variable
  get_inv <-  function() inv #again just return value
  list(set_val = set_val, get_val = get_val, set_inv = set_inv, get_inv =get_inv) #return
  #list(get_val = get_val, set_inv = set_inv, get_inv =get_inv) #try without set_val (ok)
}


#This function first checks (with get_inv) whether the Inverse for the matrix is already 
#calculated (exists and is not NULL); if so, Inverse is loaded from memory instead of 
#re-computing (this is idea of caching) and returned with message. Otherwise, matrix is 
#retrieved (with get_val), its inverse calculated (with solve() command) and cached with
#set_inv.

cacheSolve <- function(x, ...) {
  inv <- x$get_inv() #try to retrieve Inverse
  if (!is.null(inv)) { #if it is computed, load it
    message('getting cached data')
    return(inv) #if condition is met, it ends execution (=> else not needed)
  }
  data <- x$get_val() #Inverse not computed => recompute => load the matrix
  inv <- solve(data) #compute the Inverse of a loaded matrix 
  x$set_inv(inv) #cache computed Inverse, i.e. write it for further usage
  inv #return
}
