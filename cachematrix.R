 	## Write a short comment describing this function
 	
 	makeCacheMatrix <- function(x = matrix()) {
-	
+	  m <- NULL
+	  set <- function(y) {
+	    x <<- y
+	    m <<- NULL
+	  }
+	  get <- function() x
+	  setinverse <- function(inverse) m <<- inverse
+	  getinverse <- function() m
+	  list(set = set, get = get,
+	       setinverse = setinverse,
+	       getinverse = getinverse)
 	}
 	
 	
 	cacheSolve <- function(x, ...) {
 	        ## Return a matrix that is the inverse of 'x'
+	  m <- x$getinverse()
+	  if(!is.null(m)) {
+	    message("getting cached data")
+	    return(m)
+	  }
+	  data <- x$get()
+	  m <- chol(x)
+	  x$setinverse(m)
+	  m
 	}
