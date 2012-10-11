gLag <-
function(y, k=1, na.value=NA)
{
out <- c(rep(na.value,k),as.vector(y[1:I(length(y)-k)]))
if(is.zoo(y)){
  y.index <- index(y)
  out <- zoo(out, order.by=y.index)
}
return(out)
}
