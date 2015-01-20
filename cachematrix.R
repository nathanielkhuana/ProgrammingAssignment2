#Assignment: Caching the inverseerse of a Matrix
#Matrix inversion is usually a costly computation and their may be some benefit to caching the inverse of a matrix rather than compute it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). Your assignment is to write a pair of functions that cache the inverse of a matrix.
#Write the following functions:
#makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
#cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
#Computing the inverse of a square matrix can be done with the solve function in R. For example, if X is a square invertible matrix, then solve(X) returns its inverse.


makeCacheMatrix <- function(x=matrix()) {
	#Initial m
    m <- NULL
	#Get matrix
    get <- function() x 
	#Set inverse matrix
    setinv <- function(matrix) m <<- matrix
	#Get inverse matrix
    getinv <- function() m
    #Return list
    list(get=get, setinv=setinv, getinv=getinv)
}

cacheSolve <- function(x) {
    m <- x$getinv()
	#If inverse not empty, return m
    if(!is.null(m)){
        message("getting cached data")
        return(m)
    }
	#If empty then set inverse
    data <- x$get()
	m <- solve(data)
	x$setinv(m)
	return(m)
}
