## Put comments here that give an overall description of what your
## functions do

## This file contains two functions:

##  - makeCacheMatrix stores a matrix and creates a set of functions that allow the values of the matrix
##  and its inverse to be called from the command line

##  - cacheSolve uses the SOLVE function to calculate the inverse of matrix created using the makeCacheMatrix function a
##  and stores the value into original variable; if the inverse has already been calcualted for the original matrix it just displays
##  gets the value and displays it to the user rather than recomputing it


##  create a data frame that stores a numeric matrix and its inverse and provide functions to set and get the values of the matrix
makeCacheMatrix <-function(x=numeric){
    
    
    inverseMatrix <- NULL   ## Create a variable called inverse matrix and set it to be null
    
    set <- function(y) # the set funciton is going to store the the contents into the variable
    {
        x <<- y 
        inverseMatrix <<- NULL 
    }
    
    get <-function() x  ## Function that displays the value of the original matrix when called
    
    setInverseMatrix <-function(solve) inverseMatrix <<- solve  ## Function that stores the Inverse into the folder 
    
    getInverseMatrix <-function() inverseMatrix  ## Function that returns the inverse matrix when called
    
    list( ## Display to the different users the different options
        set=set, 
        get=get,
        setInverseMatrix = setInverseMatrix,
        getInverseMatrix = getInverseMatrix
        )
}


## Calculate the inverse of a given matrix using the solve function and store the value into the variable

cacheSolve <- function(x=numeric){
    ## Return a matrix that is the inverse of 'x'


    # Store inverse into the variable
    
    ## Get the matrix from the previous function
    
    inverseMatrix <-x$getInverseMatrix() ## Get the value of the inverseMatrix variable from the makeCacheMatrix function
    
    ## Check to see if the inverse has already been calculated; if it has then return the stored value and skip the calculation
    if(!is.null(inverseMatrix)) 
    {
            message("getting cached data")
            return(inverseMatrix)
    }
    
    ## We haven't calculated the inverse so we need to calculate it now
    
    data <-x$get()  # get the orignal matrix and store it into the local variable called data
    
    inverseMatrix <-solve(data) # run the solve function on the matrix to find its inverse
    
    x$setInverseMatrix(inverseMatrix) # store the inversed matrix into the original variable so that it can be called    
    
    inverseMatrix     
    
    }
