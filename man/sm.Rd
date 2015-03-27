\name{sm}
\alias{sm}

\title{Estimate an AR-X Model with Log-ARCH-X Errors}
\description{
Estimation is by OLS in two stages. In the first the AR-X mean specification is estimated, whereas in the second stage the residuals from the first are used to fit a log-ARCH-X model to the log-variance. The natural logarithm of the squared residuals constitutes the regressand in the second step.

The AR-X mean specification can contain an intercept, AR-terms, lagged moving averages of the regressand and other conditioning covariates ('X'). The log-variance specification can contain log-ARCH terms, asymmetry or 'leverage' terms, log(EqWMA) where EqWMA is a lagged equally weighted moving average of past squared residuals (a volatility proxy) and other conditioning covariates ('X').
}
\usage{
sm(y, mc=NULL, ar=NULL, ewma=NULL, mx=NULL, arch=NULL, asym=NULL,
  log.ewma=NULL, vx=NULL, p=2, zero.adj=0.1, vc.adj=TRUE,
  varcov.mat=c("ordinary", "white"), qstat.options=NULL,
  tol=1e-07, LAPACK=FALSE, verbose=TRUE, smpl=NULL)
}
\arguments{
  \item{y}{
numeric vector, time-series or zoo object. Note that missing values in the beginning or at the end of the series is allowed, as they are removed with the na.trim command from the zoo package
}
  \item{mc}{
logical, TRUE or FALSE (default). TRUE includes intercept in the specification, FALSE does not
}
  \item{ar}{
integer vector, say, c(2,4) or 1:4. The AR-lags to include in the specification
}
  \item{ewma}{
list of arguments sent to the leqwma function
}
  \item{mx}{
numeric matrix, time-series or zoo object of conditioning covariates. Note that missing values in the beginning or at the end of the series is allowed, as they are removed with the na.trim command from the zoo package
}
  \item{arch}{
integer vector, say, c(1,3) or 2:5. The ARCH-lags to include in the log-volatility specification
}
  \item{asym}{
integer vector, say, c(1) or 1:3. The asymmetry or leverage terms to include in the log-volatility specification
}
  \item{log.ewma}{
NULL (default) or a list. If NULL then log(EWMA) is not included as volatility proxy. If a list, then log(EWMA) is included as a volatility proxy.
}
  \item{vx}{
numeric matrix, time-series or zoo object of conditioning covariates. Note that missing values in the beginning or at the end of the series is allowed, as they are removed with the na.trim command from the zoo package
}
  \item{p}{
numeric value greater than zero. The power of the log-volatility specification.
}
  \item{zero.adj}{
numeric value between 0 and 1. The quantile adjustment for zero values. The default 0.1 means that the zero residuals are replaced by means of the 10 percent quantile of the absolute residuals before taking the logarithm
}
  \item{vc.adj}{
logical, TRUE (default) or FALSE. If true then the log-volatility constant is adjusted by means of the estimate of E[log(z^2)]. This adjustment is needed for the standardised residuals to have unit variance. If FALSE then the log-volatility constant is not adjusted
}
  \item{varcov.mat}{
character vector, "ordinary" or "white". If "ordinary" then the ordinary variance-covariance matrix is used for inference. Otherwise the White (1980) heteroscedasticity robust matrix is used
}
  \item{qstat.options}{
NULL or an integer vector of length two, say, c(2,5). The first value sets the order of the AR diagnostic test, whereas the second value sets the order of the ARCH diagnostic test. NULL (default) sets the vector to c(1,1)
}
  \item{tol}{
numeric value (default = 1e-07). The tolerance for detecting linear dependencies in the columns of the regressors (see qr() function). Only used if LAPACK is FALSE
}
  \item{LAPACK}{
logical, TRUE or FALSE (default). If true use LAPACK otherwise use LINPACK (see qr() function)
}
  \item{verbose}{
logical, TRUE (default) or FALSE. FALSE returns less output and is therefore faster
}
  \item{smpl}{
Either NULL (default; the whole sample is used for estimation) or a two-element vector of dates with the start and end dates of the sample to be used in estimation. For example, smpl=c("2001-01-01", "2009-12-31")
}
}

\details{
See Sucarrat and Escribano (2012)
}
\value{
A list with the following elements:
  \item{call}{the function call}
  \item{mean.fit}{zoo-object with the fitted values of the mean specification}
  \item{resids}{zoo-object with the residuals of the mean specification}
  \item{volatility.fit}{zoo-object with the fitted values of the volatility (sigma^p) specification}
  \item{resids.ustar}{zoo-object with the residuals of the AR-representation of the log-volatility specification}
  \item{resids.std}{zoo-object with the standardised residuals}
  \item{Elogzp}{estimate of E(log(z^p))}
  \item{mean.results}{data frame with the estimation results of the mean specification}
  \item{volatility.results}{data frame with the estimation results of the log-volatility specification}
  \item{diagnostics}{data frame with selected diagnostics of the standardised residuals}
}
\references{
Genaro Sucarrat and Alvaro Escribano (2012): 'Automated Financial Model Selection: General-to-Specific Modelling of the Mean and Volatility Specifications', Oxford Bulletin of Economics and Statistics 74, Issue no. 5 (October), pp. 716-735

Halbert White (1980): 'A Heteroskedasticity-Consistent Covariance Matrix Estimator and a Direct Test for Heteroskedasticity', Econometrica 48, pp. 817-838
}
\author{
Genaro Sucarrat (http://www.sucarrat.net/)
}

\seealso{
\code{AutoSEARCH} package: \code{\link{gets.mean}}, \code{\link{gets.vol}} \cr
\code{gets} package: \code{arx}, \code{getsm}, \code{getsv}, \code{isat}
}
\examples{
#Generate AR(1) model and independent normal regressors:
set.seed(123)
y <- arima.sim(list(ar=0.4), 200)
xregs <- matrix(rnorm(4*200), 200, 4)

#estimate AR(2) with intercept:
sm(y, mc=TRUE, ar=1:2)

#estimate AR(2) with intercept and four conditioning regressors
#in the mean:
sm(y, mc=TRUE, ar=1:2, mx=xregs)

#estimate a log-volatility specification with a log-ARCH(4)
#structure:
sm(y, arch=1:4)

#estimate a log-volatility specification with a log-ARCH(4)
#structure and an asymmetry or leverage term:
sm(y, arch=1:4, asym=1)

#estimate a log-volatility specification with a log-ARCH(4)
#structure, an asymmetry or leverage term, a 30-period log(EWMA) as
#volatility proxy, and the squareds of the conditioning regressors
#in the log-volatility specification:
sm(y, arch=1:4, asym=1, log.ewma=list(length=30), vx=log(xregs^2))

#estimate AR(2) with intercept and four conditioning regressors
#in the mean, and a log-volatility specification with a log-ARCH(4)
#structure, an asymmetry or leverage term, a 30-period log(EWMA) as
#volatility proxy, and the squareds of the conditioning regressors
#in the log-volatility specification:
sm(y, mc=TRUE, ar=1:2, mx=xregs, arch=1:4, asym=1,
  log.ewma=list(length=30), vx=log(xregs^2))
}

\keyword{Statistical Models}
\keyword{Time Series}
\keyword{Financial Econometrics}
