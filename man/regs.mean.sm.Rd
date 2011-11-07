\name{regs.mean.sm}
\alias{regs.mean.sm}

\title{
Creates the regressors of the mean specification of a SEARCH model
}
\description{
Creates the regressors of the mean specification of a SEARCH model
}
\usage{
regs.mean.sm(y, mc=NULL, ar=NULL, mx=NULL)
}
\arguments{
  \item{y}{
numeric vector, time-series or zoo object. Note that missing values
in the beginning or at the end of the series is allowed, as they are
removed with the na.trim command from the zoo package
}
  \item{mc}{
logical, TRUE or FALSE (default). TRUE includes intercept in the
specification, FALSE does not
}
  \item{ar}{
integer vector, say, c(2,4) or 1:4. The AR-lags to include in the
specification
}
  \item{mx}{
numeric matrix, time-series or zoo object of conditioning covariates.
Note that missing values in the beginning or at the end of the series
is allowed, as they are removed with the na.trim command from the zoo
package
}
}
\details{
}
\value{
Matrix with regressors
}
\references{
}
\author{
Genaro Sucarrat (http://www.sucarrat.net/)
}
\note{
}
\seealso{
regs.vol.sm
}
\examples{
}
\keyword{}
