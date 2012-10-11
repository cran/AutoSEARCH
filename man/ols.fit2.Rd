\name{ols.fit2}
\alias{ols.fit2}

\title{
Fast and accurate OLS estimation by means of QR decomposition
}
\description{
Returns slightly more information than ols.fit1, which makes the computation
of variance-covariance matrices faster. However, if parameter estimation is
the only objective, then ols.fit1 is faster
}
\usage{
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
Returns a list with the following elements:
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
ols.fit1, qr, solve
}