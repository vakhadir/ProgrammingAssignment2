## Following functions computes inverse of a given matrix and caches the inverse matrix.
## When a request to compute the inverse is received, instead of computing, 
## it returns from the cache

## setter and getter function for the Origina Matrix and Inverse Matrix

makeCacheMatrix <- function(x = matrix()) {
        
        inverseMatrix <- NULL
        
        ## Sets a given matrix y to x
        set<-function(y){
                x <<- y
                inverseMatrix <<- NULL
        }
        
        ## Returns the original matrix
        get <- function(){
                x      
        }        
        
        ## sets the inversedMatrix to inverseMatrix. 
        ## Names of both variables are same.But one is function parameter
        ## Other one is the resultant matrix definded at the beginning of 
        ## the method makeCacheMatrix.
        setInverse <- function(inverseMatrix){
                print("Setting to inverse matrix")
                inverseMatrix<<-inverseMatrix
        }
        
        ## Returns the resultant Inversed matrix
        getInverse<-function(){
                inverseMatrix
        }
        
        list(set = set, get = get,
             setInverse=setInverse,getInverse=getInverse) 
}


## Returns the Inverse Matrix for the given matrix. If inverse is not already computed, 
## computes the inverse of the matrix 
## then caches the value by calling setInverse function. 
## For subsequent requests, since inverse is already computed, 
## it gets it just calls getInverse function to return the already computed result.

cacheSolve <- function(x, ...) {
        ## get the inverseMatrix
        inverseMatrix <-x$getInverse()
        # If already exist return it
        if(!is.null(inverseMatrix)){
                print("Readly available in Cache... gettin it")
                return (inverseMatrix)                
        }
        ## if not exist get the original matrix
        originalMatrix <-x$get()
        ## inverse it
        inverseMatrix <- solve(originalMatrix)
        ## after computing inverse, cache it by calling the setInverse function
        x$setInverse(inverseMatrix)
        ## Finally return the inversed Matrix- the result.
        inverseMatrix
}
