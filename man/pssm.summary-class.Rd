\name{pssm.summary-class}
\docType{class}
\alias{pssm.summary-class}
\title{Class \code{"pssm.summary"}
}
\description{
The class produced by the method \code{summary} applied to a pssm object
}
\section{Slots}{
  \describe{
    \item{\code{call}:}{Character representation of calling function}
    \item{\code{convergence}:}{Character string indicating convergence}
    \item{\code{coefficients}:}{The coefficients of the covariates and their standard errors as a data frame}
    \item{\code{confidence.bounds}:}{Confidence bounds on the coefficients as a data frame}
 }
}
\author{David A. Schoenfeld}
%%  ~~who you are~~
\seealso{\code{\link{summary-methods}}}

