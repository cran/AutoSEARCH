\name{info.criterion}
\alias{info.criterion}
\title{
Computes the the value of an information criterion
}
\description{
Given a log-likelihood, the number of observations and the number of parameters,
the value of a chosen information criterion is computed
}
\usage{
info.criterion(logl, n=NULL, k=NULL, method=c("sc", "aic", "aicc", "hq"))
}
\arguments{
  \item{logl}{
numeric, the value of the log-likelihood
}
  \item{n}{
integer, the number of observations
}
  \item{k}{
integer, the number of parameters
}
  \item{method}{
"sc", "aic", "aicc" or "hq"
}
}
\details{
}
\value{
numeric, the value of the information criterion
}
\references{
}
\author{
Genaro Sucarrat (http://www.sucarrat.net/)
}
\note{
}

\seealso{
}
\examples{
}
\keyword{}
