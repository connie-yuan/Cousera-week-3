makeVector <- function(x = numeric()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setmean <- function(mean) m <<- mean
    getmean <- function() m
    list(set = set, get = get,
         setmean = setmean,
         getmean = getmean)
}
makeVector(x=c(1,2,3))
cachemean <- function(x, ...) {
    m <- x$getmean()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- mean(data, ...)
    x$setmean(m)
    m
}
x<-data.frame(replicate(10,sample(0:1,100,rep=TRUE)))
x<-c(1,2,3,)
x1<-rnorm(10000, 1)
mean(x1)
y<-makeVector(x1)
cachemean(y)
rm(list=ls())
