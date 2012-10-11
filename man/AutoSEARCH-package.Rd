\name{AutoSEARCH-package}
\alias{AutoSEARCH-package}
\alias{AutoSEARCH}
\docType{package}
\title{
General-to-Specific (GETS) Model selection
}
\description{
Automated multi-path General-to-Specific (GETS) model selection of the mean and log-volatility specification of a log-ARCH-X model.

The three main functions of the package are sm, gets.mean and gets.vol. sm estimates a model with an AR-X specification in the mean and a log-ARCH-X log-volatility specification. gets.mean undertakes General-to-Specific model selection of the mean specification, whereas gets.vol undertakes General-to-Specific model selection of the log-volatility specification.

The package also provides twelve auxiliary functions that are called by sm, gets.mean and gets.vol. They are documentated very scarcely.
}
\details{
\tabular{ll}{
Package: \tab AutoSEARCH\cr
Type: \tab Package\cr
Version: \tab 1.2\cr
Date: \tab 2012-10-11\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}
The code was developed in relation with the project G. Sucarrat and A. Escribano (2012): 'Automated Financial Model Selection: General-to-Specific Modelling of the Mean and Volatility
Specifications', Oxford Bulletin of Economics and Statistics 74, Issue 5 (October), pp. 716-735. The model class in which model selection takes place is
called SEARCH, which is an abreviation of Stochastic Exponential ARCH. The acronym SEARCH also conveniently connotates the main motivation
behind the model, namely that it is particularly suitable for specification SEARCH.
}
\author{
Genaro Sucarrat
Maintainer: Genaro Sucarrat <genaro.sucarrat@bi.no>
}
\references{
G. Sucarrat and A. Escribano (2012): 'Automated Financial Model Selection: General-to-Specific Modelling of the Mean and Volatility
Specifications', Oxford Bulletin of Economics and Statistics 74, Issue 5 (October), pp. 716-735
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
