\name{AutoSEARCH-package}
\alias{AutoSEARCH-package}
\alias{AutoSEARCH}
\docType{package}
\title{General-to-Specific (GETS) Modelling}

\description{
GETS modelling of the mean and variance of a regression.

NOTE: The package has been succeeded by the package \code{gets}, also available on the CRAN, which is more user-friendly, faster and easier to extend. The development focus has switched to \code{gets}, so users are therefore encouraged to consider \code{gets} instead.
}

\details{
\tabular{ll}{
Package: \tab AutoSEARCH\cr
Type: \tab Package\cr
Version: \tab 1.5\cr
Date: \tab 2015-03-27\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}
The code was originally developed in relation with G. Sucarrat and A. Escribano (2012): 'Automated Financial Model Selection: General-to-Specific Modelling of the Mean and Volatility
Specifications', Oxford Bulletin of Economics and Statistics 74, Issue 5 (October), pp. 716-735.
}

\author{Genaro Sucarrat, \url{http://www.sucarrat.net/}}

\references{
G. Sucarrat and A. Escribano (2012): 'Automated Financial Model Selection: General-to-Specific Modelling of the Mean and Volatility Specifications', Oxford Bulletin of Economics and Statistics 74, Issue 5 (October), pp. 716-735
}

\seealso{
\code{AutoSEARCH} package: \code{\link{sm}}, \code{\link{gets.mean}}, \code{\link{gets.vol}} \cr
\code{gets} package: \code{arx}, \code{getsm}, \code{getsv}, \code{isat}
}

\examples{
#Generate from AR(1) model:
set.seed(123)
y <- arima.sim(list(ar=0.4), 200)

#Estimate AR(2) with intercept as mean specification
#and log-ARCH(4) as log-volatility specification:
sm(y, mc=TRUE, ar=1:2, arch=1:4)

#General-to-Specific model selection of the mean:
mymodel <- gets.mean(y, mc=TRUE, ar=1:2, arch=1:4)

#General-to-Specific model selection of the
#simplified mean specification:
gets.vol(mymodel$resids, arch=1:4)
}
