\name{ols.fit1}
\alias{ols.fit1}

\title{
Fast and accurate OLS estimation by means of QR decomposition
}
\description{
Fast and accurate OLS estimation by means of QR decomposition
}
\usage{
ols.fit1(y, x, tol=1e-07, LAPACK=FALSE)
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
\details{
}
\value{
Returns a list with the following elements:
  \item{qr}{}
  \item{rank}{}
  \item{qraux}{}
  \item{pivot}{}
  \item{coefficients}{}
}
\references{
}
\author{
Genaro Sucarrat (http://www.sucarrat.net/)
}
\note{
}
\seealso{
ols.fit2, qr, solve
}
\examples{
}
\keyword{}
