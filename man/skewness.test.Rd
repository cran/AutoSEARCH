\name{skewness.test}
\alias{skewness.test}

\title{
Chi-square test skewness in the standardised residuals
}
\description{
Chi-square test skewness in the standardised residuals
}
\usage{
skewness.test(x)
}
\arguments{
  \item{x}{
numeric vector
  }
}

\value{
Returns a list with the following elements:
  \item{statistic}{the test statistic}
  \item{p.value}{numeric between 0 and 1, the p-value of the test under the
  null of no-skewness}
}

\author{
Genaro Sucarrat (http://www.sucarrat.net/)
}