\name{gLag}
\alias{gLag}

\title{
Lag a series
}
\description{
Convenience function particularly suited for the lagging of zoo objects.
By default the 'lost' values are padde with NAs so that the length of
the series is retained. This is useful in creating the regressor
matrices for the GETS model selection
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
