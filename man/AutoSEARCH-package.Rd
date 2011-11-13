\name{AutoSEARCH-package}
\alias{AutoSEARCH-package}
\alias{AutoSEARCH}
\docType{package}
\title{
General-to-Specific (GETS) Model selection
}
\description{
Automated multi-path General-to-Specific (GETS) model selection of the mean and log-volatility specification of a power log-ARCH model.

The three main functions of the package are sm, gets.mean and gets.vol. sm estimates a SEARCH model, gets.mean undertakes General-to-Specific model selection of the mean specification of the SEARCH model, whereas gets.vol undertakes General-to-Specific model selection of the log-volatility specification in a SEARCH model.

The package also provides twelve auxiliary functions that are called by sm, gets.mean and gets.vol. They are documentated very scarcely.
}
\details{
\tabular{ll}{
Package: \tab AutoSEARCH\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-11-04\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}
The code was developed for G. Sucarrat and A. Escribano: 'Automated Financial Model Selection: General-to-Specific Modelling of the Mean and Volatility
Specifications', forthcoming in the Oxford Bulletin of Economics and Statistics. The model class in which model selection takes place is
called SEARCH, which is an abreviation of Stochastic Exponential ARCH. The acronym SEARCH also conveniently connotates the main motivation
behind the model, namely that it is particularly apt for specification SEARCH. The stochasticity is due to the fact that the AR-representation
of the log-volatility specification is identical in form to the AR representation of some stochastic volatility models.
}
\author{
Genaro Sucarrat
Maintainer: Genaro Sucarrat <genaro.sucarrat@bi.no>
}
\references{
Genaro Sucarrat and Alvaro Escribano: 'Automated Financial Model Selection: General-to-Specific Modelling of the Mean and Volatility Specifications', forthcoming in the Oxford Bulletin of Economics and Statistics

Genaro Sucarrat and Alvaro Escribano (2010): 'The Power Log-GARCH Model', working paper
}
\examples{
#Generate AR(1) model:
set.seed(123)
y <- arima.sim(list(ar=0.4), 200)

#estimate AR(2) with intercept and log-ARCH(4) as
#log-volatility specifications:
sm(y, mc=TRUE, ar=1:2, arch=1:4)

#General-to-Specific model selection of the mean:
mymodel <- gets.mean(y, mc=TRUE, ar=1:2, arch=1:4)

#General-to-Specific model selection of the
#simplified mean specification:
gets.vol(mymodel$resids, arch=1:4)
}
