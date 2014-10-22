\name{gedestp}
\alias{gedestp}
\alias{gedlogl}

\title{Estimate and compute log-likelihood of the standardised Generalised Error Distribution (GED)
}
\description{
\code{gedestp} and \code{gedlogl} are auxiliary functions called by \code{\link{gets.mean}} and \code{\link{gets.vol}}.

The \code{gedestp} function estimates the shape parameter of a standardised (zero mean, unit variance) GED. The estimation method is based on an index of kurtosis approach, and the code is based on the \code{estimatep} function from the \code{normalp} package by Angelo M. Mineo.

The \code{gedlogl} function computes the log-likelihood of a standardised GED with shape parameter p.
}

\usage{
gedestp(x, method = c("inverse", "direct"))
gedlogl(z, p = 2)
}

\arguments{
  \item{x}{
numeric vector
}
  \item{z}{
numeric vector
}
  \item{method}{
"inverse" or "direct"
  }
  \item{p}{
numeric value, the shape parameter
  }
}

\value{
numeric, either an estimate of the shape parameter or the log-likelihood
}

\references{
Mineo, A.M. (1994): 'Un nuovo metodo di stima di p per una corretta valutazione dei parametri diintensita e di scala di una curva normale di ordine p', Atti della XXXVII Riunione Scientifica della Societa Italiana di Statistica, San Remo, Vol. 2, pp. 147-154
}

\author{Genaro Sucarrat (http://www.sucarrat.net/)}

\seealso{
\code{\link{gets.mean}}, \code{\link{gets.vol}}
}

\examples{
#estimate p of a standard normal:
set.seed(123)
x <- rnorm(200)
gedestp(x)

#log-likelihood of the standard normal series:
gedlogl(x, p=2)
}

\keyword{Statistical Models}
\keyword{Time Series}
\keyword{Financial Econometrics}
