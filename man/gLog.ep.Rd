\name{gLog.ep}
\alias{gLog.ep}
\title{
Adjust for zero values and compute log(abs(e)^p)
}
\description{
Adjusts a series called e - typically a series of residuals or
financial returns - for zero values, so that the logarithm can be
applied on the absolute pth. exponentiated values. Next,
log(abs(e)^p) is computed
}
\usage{
gLog.ep(e, zero.adj=0.1, p=2, na.replace=NA)
}
\arguments{
  \item{e}{
numeric vector, time series or zoo object
}
  \item{zero.adj}{
numeric value between 0 and 1. The quantile adjustment for zero values.
The default 0.1 means that the zero residuals are replaced by means of
the 10 percent quantile of abs(e) before taking the
logarithm
}
  \item{p}{
numeric value greater than zero. The power of the log-volatility
specification.
}
  \item{na.replace}{
the value to replace NA values with. Default: na.replace=NA
}
}
\value{
log(abs(e)^p), where the e values have been zero adjusted
}
\references{
Genaro Sucarrat and Alvaro Escribano (2012): 'Automated Financial
  Model Selection: General-to-Specific Modelling of the Mean and
  Volatility Specifications', Oxford Bulletin of Economics and
  Statistics 74, Issue no. 5 (October), pp. 716-735
}
\author{
Genaro Sucarrat (http://www.sucarrat.net/)
}
