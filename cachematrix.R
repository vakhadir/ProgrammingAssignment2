## Following functions computes inverse of a given matrix and caches the inverse matrix.
## When a request to compute the inverse is received, instead of computing, 
## it returns from the cache

## setter and getter function for the Origina Matrix and Inverse Matrix

makeCacheMatrix <- function(x = matrix()) {
        inverseMatrix <- NULL
        set<-function(y){
                x <<- y
                inverseMatrix <<- NULL
        }
        
        get <- function(){
          x      
        }        
        
        setInverse <- function(inverseMatrix){
                print("Setting to inverse matrix")
                inverseMatrix<<-inverseMatrix
        }
        
        getInverse<-function(){
                inverseMatrix
        }
        
        list(set = set, get = get,
             setInverse=setInverse,getInverse=getInverse) 
}


## Gets the Inverse Matrix if if is null, computes the inverse of the matrix 
## then caches the value by calling setInverse function. For subsequent requests,
## Since, inverse is already computed, it gets it just by calling getInverse function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverseMatrix <-x$getInverse()
        if(!is.null(inverseMatrix)){
                print("Readly available in Cache... gettin it")
                return (inverseMatrix)                
        }
        originalMatrix <-x$get()
        inverseMatrix <- solve(originalMatrix)
        x$setInverse(inverseMatrix)
        inverseMatrix
}
