\name{gets.mean}
\alias{gets.mean}

\title{
General-to-Specific (GETS) model selection of the mean
specification of a SEARCH model
}
\description{
The starting model is referred to as the General Unrestricted
Model (GUM), and may contain both a mean specification and a
log-volatility specification. However, simplification is
undertaken only with respect to the former. The diagnostic
tests are optionally undertaken either on the residuals
of the mean specification or on the standardised residuals. The
latter might be desirable if a log-volatility specification is
specified.
}
\usage{
gets.mean(y, mc=NULL, ar=NULL, mx=NULL, arch=NULL, asym=NULL,
  log.ewma=NULL, vx=NULL, keep=NULL, p=2, varcov.mat=c("ordinary",
  "white"), t.pval=0.05, do.pet=TRUE, wald.pval=0.05,
  ar.LjungB=c(2, 0.025), arch.LjungB=c(2, 0.025), tau=2,
  info.method=c("sc", "aic", "hq"),
  info.resids=c("mean", "standardised"), include.empty=FALSE,
  zero.adj=0.1, vc.adj=TRUE, tol=1e-07, LAPACK=FALSE, max.regs=1000,
  verbose=TRUE, smpl=NULL)
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
  \item{arch}{
integer vector, say, c(1,3) or 2:5. The ARCH-lags to include in the
log-volatility specification
}
  \item{asym}{
integer vector, say, c(1) or 1:3. The asymmetry or leverage terms to
include in the log-volatility specification
}
  \item{log.ewma}{
NULL (default) or a list. If NULL then log(EWMA) is not included as
volatility proxy. If a list, then log(EWMA) is included as a volatility
proxy.
}
  \item{vx}{
numeric matrix, time-series or zoo object of conditioning covariates.
Note that missing values in the beginning or at the end of the series
is allowed, as they are removed with the na.trim command from the zoo
package
}
  \item{keep}{
NULL (default) or an integer vector. If keep = NULL, then
no regressors are excluded from removal. Otherwise, the
regressors associated with the numbers in keep are excluded
from the removal space. For example, keep=c(1) excludes the
constant from removal. The regressor numbering is contained
in the reg.no column of the gum.mean data frame, see below
}       
  \item{p}{
numeric value greater than zero. The power of the log-volatility
specification.
}
  \item{varcov.mat}{
character vector, "ordinary" or "white". If
"ordinary" then the ordinary variance-covariance matrix is used
for inference. Otherwise the White (1980) heteroscedasticity robust
matrix is used
}
  \item{t.pval}{
numeric value between 0 and 1. The significance level used for
the regressor tests
}
  \item{do.pet}{
logical, TRUE (default) or FALSE. If TRUE then a Parsimonious
Encompassing Test (PET) against the GUM is undertaken at each
regressor removal for the joint significance of all the
deleted regressors along the current path
}
  \item{wald.pval}{
numeric value between 0 and 1. The significance level used for
the PETs
}
  \item{ar.LjungB}{
NULL or a two-element vector where the first element contains
the order of a Ljung and Box (1979) test for serial correlation
in the standardised residuals, and where the second element
contains the significance level. If NULL, then the standardised
residuals are not checked for serial correlation after each
removal. The default is c(2, 0.025)
}
  \item{arch.LjungB}{
NULL or a two-element vector where the first element contains
the order of a Ljung and Box (1979) test for ARCH (serial
correlation in the squared standardised residuals), and where
the second element contains the significance level. If NULL,
then the standardised residuals are not checked for ARCH after
each removal. The default is c(2, 0.025)
}
  \item{tau}{
NULL or a numeric value greater than 1. If NULL, then the
shape parameter in a Generalised Error Distribution (GED) of
the standardised residuals is estimated for the log-likelihood
used in the calculation of the information criterion. If tau is
equal to a numeric value, a GED(tau) is used. Default: tau=2
(standardised normal density)
}
  \item{info.method}{
character string, "sc" (default), "aic" or "hq",
which determines the information criterion used to select among
terminal models. The abbreviations are short for the Schwarz or
Bayesian information criterion (sc), the Akaike information
criterion (aic) and the Hannan-Quinn (hq) information criterion
}
  \item{info.resids}{
character string, "mean" (default) or "standardised"
which sets the residuals to be used in the computation of the
information criterion
}
  \item{include.empty}{
logical, TRUE or FALSE (default). If TRUE then an empty model is
included among the terminal models, if it passes the diagnostic
tests, even if it is not equal to one of the terminals
}
  \item{zero.adj}{
numeric value between 0 and 1. The quantile adjustment for zero values.
The default 0.1 means that the zero residuals are replaced by means of
the 10 percent quantile of the absolute residuals before taking the
logarithm
}
  \item{vc.adj}{
logical, TRUE (default) or FALSE. If true then the log-volatility
constant is adjusted by means of the estimate of E[log(z^2)]. This
adjustment is needed for the standardised residuals to have unit
variance. If FALSE then the log-volatility constant is not adjusted
}
  \item{tol}{
numeric value (default = 1e-07). The tolerance for detecting linear
dependencies in the columns of the regressors (see qr() function).
Only used if LAPACK is FALSE
}
  \item{LAPACK}{
logical, TRUE or FALSE (default). If true use LAPACK otherwise use
LINPACK (see qr() function)
}
  \item{max.regs}{
integer value, sets the maximum number of regressions along a
deletion path. Default: max.regs=1000
}
  \item{verbose}{
logical, TRUE (default) or FALSE. FALSE returns less output and is
therefore faster
}
  \item{smpl}{
Either NULL (default; the whole sample is used for estimation) or a
two-element vector of dates with the start and end dates of the
sample to be used in estimation. For example,
smpl=c("2001-01-01", "2009-12-31")
}
}

\details{
See Sucarrat and Escribano (2011)
}

\value{
Returns a list with the following elements:
  \item{resids}{zoo-object with the residuals of the final
  mean specification}
  \item{resids.std}{zoo-object with the standardised residuals}
  \item{Elogzp}{estimate of E[log(z^p)]}
  \item{call}{the function call}
  \item{gum.mean}{a data frame with the estimation results of the GUM}
  \item{gum.diagnostics}{data frame with selected diagnostics of the
  GUM}
  \item{keep}{if any, the regressors that are excluded from deletion}
  \item{insigs.in.gum}{a numeric integer vector with the insignificant
  regressors of the GUM}
  \item{paths}{a list containing the simplification paths, that is,
  the sequences of deleted regressors}
  \item{terminals}{the distinct terminal models}
  \item{terminals.results}{the value and type of the information
  criterion (info) used in selecting among terminal specifications,
  and the number of observations (T) and parameters (k) used in the
  calculation of the information criterion}
  \item{specific.mean}{data frame with the estimation results of the
  final mean specification}
  \item{specific.diagnostics}{data frame with selected diagnostics of the
  standardised residuals}
}

\references{
Genaro Sucarrat and Alvaro Escribano: 'Automated Financial Model
Selection: General-to-Specific Modelling of the Mean and Volatility
Specifications', forthcoming in the Oxford Bulletin of Economics and
Statistics

Genaro Sucarrat and Alvaro Escribano: 'The Power Log-GARCH Model',
unpublished working paper

G. Ljung and G. Box (1979): 'On a Measure of Lack of Fit in Time
Series Models'. Biometrika 66, pp. 265-270
}
\author{
Genaro Sucarrat (http://www.sucarrat.net/)
}
\note{
}

\seealso{
sm, gets.vol, ewma
}
\examples{
#Generate AR(1) model and independent normal regressors:
set.seed(123)
y <- arima.sim(list(ar=0.4), 200)
xregs <- matrix(rnorm(4*200), 200, 4)

#General-to-Specific model selection of the mean:
mymodel <- gets.mean(y, mc=TRUE, ar=1:5, mx=xregs)

#General-to-Specific model selection of the mean
#with the intercept excluded from removal:
mymodel <- gets.mean(y, mc=TRUE, ar=1:5, mx=xregs, keep=1)

#General-to-Specific model selection of the mean
#with no intercept and with a log-ARCH(4) specification
#in the log-volatility:
mymodel <- gets.mean(y, mc=TRUE, ar=1:5, mx=xregs, arch=1:4,
  info.resids="standardised")

#General-to-Specific model selection of the mean with
#non-default diagnostics settings:
mymodel <- gets.mean(y, mc=TRUE, ar=1:5, mx=xregs,
  ar.LjungB=c(6, 0.05))

#General-to-Specific model selection of the mean with
#(very) liberal significance levels:
mymodel <- gets.mean(y, mc=TRUE, ar=1:5, mx=xregs, t.pval=0.2,
  wald.pval=0.2)
}

\keyword{}