\name{regs.mean.sm}
\alias{regs.mean.sm}

\title{Create the regressors of an AR-X model}

\description{Creates the regressors of an AR-X model, see \code{\link{sm}}. }

\usage{
regs.mean.sm(y, mc=NULL, ar=NULL, ewma=NULL, mx=NULL)
}
\arguments{
  \item{y}{
numeric vector, time-series or zoo object. Note that missing values
in the beginning or at the end of the series is allowed, as they are
removed with the na.trim command from the zoo package
}
  \item{mc}{
logical, TRUE or FALSE (default). TRUE includes intercept in the
specification, FALSE does not
}
  \item{ar}{
integer vector, say, c(2,4) or 1:4. The AR-lags to include in the
specification
}
  \item{ewma}{
NULL or a list of arguments sent to the eqwma function
}
  \item{mx}{
numeric matrix, time-series or zoo object of conditioning covariates.
Note that missing values in the beginning or at the end of the series
is allowed, as they are removed with the na.trim command from the zoo
package
  }
}

\value{
Matrix with regressors
}

\author{Genaro Sucarrat (http://www.sucarrat.net/)}

\seealso{
\code{AutoSEARCH} package: \code{\link{sm}}, \code{\link{regs.vol.sm}} \cr
}

\keyword{Statistical Models}
\keyword{Time Series}
\keyword{Financial Econometrics}