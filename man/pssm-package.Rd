\name{pssm-package}
\alias{pssm.package}
\alias{pssm-package}
\docType{package}
\title{Joint proportional hazards model for survival and progression with piecewise exponential hazard}
\description{Fits a joint model for interval censored time to progression and subsequent survival. Progression is assumed
to always occure before death.  The underlying hazard function is assumed to be piecewise constant.}
\details{
The function \code{\link{pssm}} fits the model and outputs a \code{\link{pssm-object}} S4 object, this can input to  \code{\link{pssm.survivalcurv}} which 
outputs a function of time, that can be used to create time to 
progression and survival curves for the model with specified covariate values.

In addition \code{\link{pssm.simulate}} is given to generate data to test the model.
Functions "llikef","rprog","sprog" are helper functions, methods "plot","print" and "summary" are available.

}
\author{David A. Schoenfeld

Maintainer: Who to complain to <dschoenfeld@partners.org>
}
\references{
~~ Literature or other references for background information ~~
}

\keyword{ package }
\seealso{
\code{\link{pssm-class}},
\code{\link{pssm.generate.data}},
\code{\link{pssm.object}}
\code{\link{pssm}},
\code{\link{pssm.simulate}},
\code{\link{pssm.survivalcurv}}
\code{\link{plot-methods}}
\code{\link{pssm.power}}
}
\examples{
showClass("pssm")
}
