\name{ewma}
\alias{ewma}

\title{
Equally Weighted Moving Average (EWMA) of the pth.
exponentiated residuals
}
\description{
Returns an Equally Weighted Moving Average (EWMA) of the pth.
exponentiated residuals lagged. As a volatility model, this is
also know as the 'historical' model or as an integrated ARCH
model where the ARCH coefficients all have the same value with
sum equal to one. In the log-volatility specification the lag
of EWMA is used as a volatility proxy. Admittedly, it is an
imperfect volatility proxy compared with high-frequency data
(which can be included as regressors anyway in the
log-volatility specification). However, it is always available
and easy to compute
}
\usage{
ewma(x, length=20, lag=1, start=1, p=2)
}
\arguments{
  \item{x}{
numeric vector, time-series or zoo object. Note that missing values
in the beginning or at the end of the series is allowed, as they are
removed with the na.trim command from the zoo package
}
  \item{length}{
integer equal to or greater than 1. The length of the moving
window of averages. Default: length=20
}
  \item{lag}{
integer equal to or greater than 0. If 0, then the moving average
is not lagged. Default: lag=1
}
  \item{start}{
integer equal to or greater than 1. Where to start the moving
window of averages. Default: start=1 (the first observation)
}
  \item{p}{
numeric greater than zero. The exponent or p in abs(x)^p. Default:
p=2
}
}
\details{
As a volatility model, the lag of an equally weighted moving average
of the squared residuals where each average is made up of m
observations, is equivalent to an integrated ARCH(m) model where
all the m ARCH-coefficients are equal. For the properties of
integrated ARCH models, see Engle and Bollerslev (1986). For
further details on the use of log(EWMA) as a volatility proxy, see
Sucarrat and Escribano (2011)
}
\value{
  \item{ewma}{
numeric vector, time series or zoo object (depending on the
properties of x, the input) containing the values of the moving
average
}
}
\references{
}
\author{
Genaro Sucarrat (http://www.sucarrat.net/)
}
\note{
}

\seealso{
sm, gets.mean, gets.vol
}
\examples{
#Generate an iid normal series:
set.seed(123)
x <- rnorm(200)

#compute lag of EWMA(20) of x^2:
ewma(x)

#compute lag of EWMA(30) of abs(x)^1:
ewma(x, length=30, p=1)
}
\keyword{}
