\name{eqwma}
\alias{eqwma}
\title{
Equally Weighted Moving Average (EqWMA) of the pth.
exponentiated values
}
\description{
Returns an Equally Weighted Moving Average (EqWMA) of the pth.
exponentiated values lagged. Optionally, the absolute values
are computed before averaging, and the log of EqWMA can be
returned.
}
\usage{
eqwma(x, length=5, lag=1, start=1, p=1, log=FALSE, abs=FALSE)
}
\arguments{
  \item{x}{
numeric vector, time-series or zoo object. Note that missing values
in the beginning or at the end of the series is allowed, as they are
removed with the na.trim command from the zoo package
}
  \item{length}{
integer or vector of integers each equal to or greater than 1. The
length or lengths of the moving window or windows of averages.
Default: length=20
}
  \item{lag}{
integer equal to or greater than 0. If 0, then the moving averages
are not lagged. Default: lag=1
}
  \item{start}{
integer equal to or greater than 1. Where to start the moving
windows of averages. Default: start=1 (the first observation)
}
  \item{p}{
numeric greater than zero. The exponent or p in x^p. Default:
p=2
}
  \item{log}{
logical. If TRUE, then the logarithm of the moving average is returned. Default: log = FALSE
}
  \item{abs}{
logical. Whether x should be transformed to absolute values (TRUE) before averages are computed or not (FALSE). Default: abs = FALSE
}
}
\details{
The function's intended primary use is to construct socalled
'mixed frequency regressors' for the mean. For the log-volatility
specification the function leqwma is used.
}
\value{
  \item{ewma}{
numeric vector, time series or zoo object (depending on the
properties of x, the input) containing the values of the moving
average
}
}

\author{
Genaro Sucarrat (http://www.sucarrat.net/)
}

\seealso{
leqwma, sm, gets.mean, gets.vol
}
\examples{
#Generate an iid normal series:
set.seed(123)
x <- rnorm(200)

#Compute lag of EqWMA(20) for x^2:
eqwma(x, p=2)

#Compute lag of log(EqWMA(30)) for abs(x)^1:
eqwma(x, length=30, p=1, log=TRUE, abs=TRUE)

#Compute lag of EqWMA(5) and lag of EqWMA(20) for x:
eqwma(x, length=c(5,20))

}
