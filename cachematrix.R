##   FORWARD:  I am also one to avoid single letter variables so I made more descriptive names.  In retrospect it complicated
##   this particular assignment.  It's still a good habit though in my belief.  Thanks for reviewing and for any feedback!

makeCacheMatrix <- function(item = matrix()) {   ##creates a matrix
  inverse <- NULL                                 ##establishes the empty version of the 'inverse' vector
  set <- function(action){                        ##creates set vector to store the new value of matrix 'item'
    item <<- action                               ##stores in the global environment
    inverse <<- NULL                              ##establishes the emply version of the inverse variable in global environment
  }
  get <- function() item                           ##defines 'get' as as function on 'item' matrix
  setinverse <- function(storedinverse) inverse <<- inverse     # stores 'storedinverse' results in parent environment 'inverse'
  getinverse <- function() inverse                 ## gets the value of 'inverse'
  list (inverse = inverse, 
        get = get, 
        setinverse = setinverse, 
        getinverse = getinverse)                   ##allows to be called with $
}

cacheSolve <- function(item, ...) {              ##establish function for inverse
  inverse <- item$makeCacheMatrix()
  if(!is.null(inverse)) {                        ##retrieves cached data if it exists
    message("getting cashed data")
    return(m)
  }
  data <- item$get()                             ##runs function for inverse if it does not exist in cache
  inverse <- solve(data, ...)
  item$setinverse(inverse)
  inverse
}