## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

## The following functions can compute & cache the inverse of the matrix

##creates a special matrix than can cashe its inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y     
    i <<- NULL  
  } #defines x & i in an environment other than the current one
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## computes the inverse of the matrix returned by above function
cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}

##Test
##mat<-matrix(c(5,1,0,
 ##            3,-1,2,
 ##            4,0,-1),nrow=3,byrow = TRUE) #Create a 3x3 matrix
##m1<-makeCacheMatrix(mat)
##cacheSolve(m1)
##[,1]    [,2]   [,3]
##[1,] 0.0625  0.0625  0.125
##[2,] 0.6875 -0.3125 -0.625
##[3,] 0.2500  0.2500 -0.500
##cacheSolve(m1)
##getting cached data
##[,1]    [,2]   [,3]
##[1,] 0.0625  0.0625  0.125
##[2,] 0.6875 -0.3125 -0.625
##[3,] 0.2500  0.2500 -0.500
