\name{leqwma}
\alias{leqwma}

\title{
The logarithm of an Equally Weighted Moving Average (EqWMA) of the pth.
exponentiated absolute values
}
\description{
The default is that the logarithm of an Equally Weighted Moving
Average (EqWMA) of the pth. exponentiated absolute values is
returned. As a volatility model, this is also known as the
'historical' model or as an integrated ARCH model where the ARCH
coefficients all have the same value with sum equal to one. In the
log-volatility specification the lag of log(EqWMA) is thus a
volatility proxy. It is an imperfect volatility proxy compared with
high-frequency data (which can also be included as regressors anyway),
but - in contrast to high-frequency data - is always available
and easy to compute
}

\usage{
leqwma(x, length = 5, lag = 1, start = 1, p = 2)
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
numeric greater than zero. The exponent or p in abs(x)^p. Default:
p=2
}
}
\details{
The function's intended primary use is to construct volatility
proxies in logarithms for inclusion in the log-volatility
specification. The default is the lagged log of an equally
weighted moving average of the squared residuals, where each
average is made up of m observations. This is equivalent to an
integrated ARCH(m) model where all the m ARCH-coefficients are
equal. For further details on the use of log(EqWMA) as a
volatility proxy, see Sucarrat and Escribano (2012)
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
eqwma, sm, gets.mean, gets.vol
}
\examples{
#Generate an iid normal series:
set.seed(123)
x <- rnorm(200)

#Compute lag of log(EqWMA(20)) for x^2:
leqwma(x, p=2)

#Compute lag of log(EqWMA(30)) for abs(x)^1:
eqwma(x, length=30, p=1)

#Compute lag of log(EqWMA(5)) and lag of log(EqWMA(20))
#for abs(x)^2:
eqwma(x, length=c(5,20))

}
