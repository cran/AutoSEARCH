ewma <-
function(x, length=20, lag=1, start=1, p=2)
{
if(is.zoo(x)){
  x.index <- index(x)
  x <- as.vector(x)
  zoo.chk <- TRUE
}else{
  x <- as.vector(x)
  zoo.chk <- FALSE
}

x.n <- length(x)
xabsp <- abs(x)^p
ewma <- rollmean(xabsp, length, na.pad=TRUE, align="r")

if(start<=I(length-1)){
  for(i in start:I(length-1)){
    ewma[i] <- sum(xabsp[1:i])/i
  }
}

ewma <- gLag(ewma, k=lag)
if(zoo.chk){ewma <- zoo(ewma, order.by=x.index)}

return(ewma)
} #end ewma

