\name{ols.fit1}
\alias{ols.fit1}
\alias{ols.fit2}

\title{
Fast and accurate OLS estimation by means of QR decomposition
}
\description{
ols.fit1 and ols.fit2 are auxiliary functions called by \code{\link{sm}}, \code{\link{gets.mean}} and \code{\link{gets.vol}}. The ols.fit2 function returns slightly more information than ols.fit1, which makes the latter faster. However, variance-covariance are to be needed in a second step, then ols.fit2 is faster due to the additional information provided by it.
}
\usage{
ols.fit1(y, x, tol=1e-07, LAPACK=FALSE)
ols.fit2(y, x, tol=1e-07, LAPACK=FALSE)
}
\arguments{
  \item{y}{
numeric vector, the regressand
}
  \item{x}{
numeric matrix, the regressors
}
  \item{tol}{
numeric value (default = 1e-07). The tolerance for detecting linear
dependencies in the columns of the regressors (see qr() function).
Only used if LAPACK is FALSE
}
  \item{LAPACK}{
logical, TRUE or FALSE (default). If true use LAPACK otherwise use
LINPACK (see qr() function)
  }
}

\value{
A list that contains some or all of the following elements:
  \item{qr}{}
  \item{rank}{}
  \item{qraux}{}
  \item{pivot}{}
  \item{xtxinv}{}
  \item{xtx}{}
  \item{xty}{}
  \item{coefficients}{}
}

\author{
Genaro Sucarrat (http://www.sucarrat.net/)
}

\seealso{
\code{\link{qr}}, \code{\link{solve}}
}

\keyword{Statistical Models}
\keyword{Time Series}
\keyword{Financial Econometrics}
