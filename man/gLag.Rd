\name{gLag}
\alias{gLag}

\title{
Lag a series
}
\description{
A wrapper to the \code{\link{glag}} function in the \code{\link{lgarch}} package.
}
\usage{
gLag(y, k=1, na.value=NA)
}
\arguments{
  \item{y}{
numeric vector, time-series or zoo object
}
  \item{k}{
integer equal to or greater than 1. Default: k=1
}
  \item{na.value}{
the value to replace the lost values with. Default: na.replace=NA
}
}
\value{
the lagged vector, time series or zoo object
}
\author{
Genaro Sucarrat (http://www.sucarrat.net/)
}
\seealso{
\code{\link{glag}}
}

\keyword{Statistical Models}
\keyword{Time Series}
\keyword{Financial Econometrics}
