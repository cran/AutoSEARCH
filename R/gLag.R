gLag <-
function(y, k=1, na.value=NA)
{
#OLD code:
#out <- c(rep(na.value,k),as.vector(y[1:I(length(y)-k)]))
#if(is.zoo(y)){
#  y.index <- index(y)
#  out <- zoo(out, order.by=y.index)
#}
#return(out)

  glag(y, k=k, pad.value=na.value, pad=TRUE)

}
