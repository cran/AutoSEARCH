\name{regs.vol.sm}
\alias{regs.vol.sm}

\title{Create the regressors of a log-ARCH-X model}

\description{Creates the regressors of a log-ARCH-X model, see \code{\link{sm}} and \code{\link{gets.vol}}}

\usage{
regs.vol.sm(e, vc=TRUE, arch=NULL, asym=NULL, log.ewma=NULL, vx=NULL, p=2,
  zero.adj=0.1)
}
\arguments{
  \item{e}{
numeric vector, time-series or zoo object. Note that missing values
in the beginning or at the end of the series is allowed, as they are
removed with the na.trim command from the zoo package
}
  \item{vc}{
logical, TRUE (default) or FALSE. TRUE creates an intercept, FALSE does not
}
  \item{arch}{
integer vector, say, c(1,3) or 2:5. The ARCH-lags to include in the
log-volatility specification
}
  \item{asym}{
integer vector, say, c(1) or 1:3. The asymmetry or leverage terms to
include in the log-volatility specification
}
  \item{log.ewma}{
NULL (default) or a list. If NULL then log(EWMA) is not included as
volatility proxy. If a list, then log(EWMA) is included as a volatility
proxy.
}
  \item{vx}{
numeric matrix, time-series or zoo object of conditioning covariates.
Note that missing values in the beginning or at the end of the series
is allowed, as they are removed with the na.trim command from the zoo
package
}
  \item{p}{
numeric value greater than zero. The power of the log-volatility
specification.
}
  \item{zero.adj}{
numeric value between 0 and 1. The quantile adjustment for zero values.
The default 0.1 means that the zero residuals are replaced by means of
the 10 percent quantile of the absolute residuals before taking the
logarithm
  }
}

\value{
Matrix with regressors
}

\author{
Genaro Sucarrat (http://www.sucarrat.net/)
}

\seealso{
\code{AutoSEARCH} package: \code{\link{sm}}, \code{\link{regs.mean.sm}} \cr
}

\keyword{Statistical Models}
\keyword{Time Series}
\keyword{Financial Econometrics}
