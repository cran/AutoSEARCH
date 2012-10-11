\name{gedlogl}
\alias{gedlogl}
\title{
Log-likelihood of a standardised Generalised Error Distribution (GED)
}
\description{
Compute the log-likelihood of a standardised (zero mean, unit variance)
GED with shape parameter p
}
\usage{
gedlogl(z, p = 2)
}
\arguments{
  \item{z}{
numeric vector
}
  \item{p}{
numeric value, the shape parameter
  }
}

\value{
numeric, the value of the log-likelihood
}

\author{
Genaro Sucarrat (http://www.sucarrat.net/)
}

\seealso{
gedestp
}
\examples{
#Log-likelihood of a Gaussian series:
set.seed(123)
x <- rnorm(200)
gedlogl(x, p=2)
}
