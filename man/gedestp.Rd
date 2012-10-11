\name{gedestp}
\alias{gedestp}

\title{
Estimates the shape parameter of a standardised Generalised Error Distribution (GED)
}
\description{
The estimation method is based on an index of curtosis, and the code is based
the estimatep function from the R package by Angelo M. Mineo called normalp
}

\usage{
gedestp(x, method = c("inverse", "direct"))
}

\arguments{
  \item{x}{
numeric vector
}
  \item{method}{
"inverse" or "direct"
  }
}

\value{
numeric, an estimate of the shape parameter
}
\references{
Mineo, A.M. (1994): 'Un nuovo metodo di stima di p per una corretta
valutazione dei parametri diintensita e di scala di una curva normale
di ordine p', Atti della XXXVII Riunione Scientifica della Societa
Italiana di Statistica, San Remo, Vol. 2, pp. 147-154
}
\author{
Genaro Sucarrat (http://www.sucarrat.net/)
}


\seealso{
gedlogl
}
\examples{
#series of iid standard normal:
set.seed(123)
x <- rnorm(200)
gedestp(x)
}
