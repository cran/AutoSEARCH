\name{jb.test}
\alias{jb.test}

\title{
Jarque-Bera test for normality
}
\description{
Jarque-Bera test for normality
}
\usage{
jb.test(x)
}
\arguments{
  \item{x}{
a numeric vector
  }
}

\value{
Returns a list with the following elements:
  \item{skewness}{numeric, an estimate of the excess skewness relative to
  the normal}
  \item{kurtosis}{numeric, an estimate of the excess kurtosis relative to
  the normal}
  \item{statistic}{numeric, the Jarque-Bera test statistic}
  \item{df}{2, the degrees of freedom}
  \item{p.value}{numeric between 0 and 1, the p-value of the test under the
  null of normality}
}

\author{
Genaro Sucarrat (http://www.sucarrat.net/)
}
