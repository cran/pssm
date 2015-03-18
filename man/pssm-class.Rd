\name{pssm-class}
\alias{pssm.class}
\alias{pssm-class}
\alias{pssm.object}
\alias{pssm-object}
\Rdversion{1.1}
\docType{class}
\title{Class \code{"pssm"}}
\description{This class fits a joint piecewise exponential model to interval censored progression data followed by death as well as a piecewise exponential model to interval censored progression data without subsequent death data or to right censored survival data. It produces a pssm object.
%%  ~~ A concise (1-5 lines) description of what the class is. ~~
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{ps=pssm(...)}  
See:\code{\link{pssm.object}}
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{call}:}{Object of class \code{"call"}}
    \item{\code{convergence}:}{Object of class \code{"numeric"} Integer which is zero if algorythm converged }
    \item{\code{loglike}:}{object of class \code{"function"} log-likelihood function}
    \item{\code{estimates}:}{Object of class \code{"numeric"}Numeric vector of estimated parameters (see \code{\link{pssm.object}}), note hazards are log transformed}
    \item{\code{se.estimates}:}{Object of class \code{"numeric"} Numeric vector of standard errors of the estimated parameters }
    \item{\code{covariance.estimates}:}{Object of class \code{"matrix"} Variance covariance matrix of estimates }
    \item{\code{estimates.progression}:}{Object of class \code{"numeric"} Covariate coefficients for the time to progression covariates}
    \item{\code{se.estimates.progression}:}{Object of class \code{"numeric"}Standard Errors of the above estimates }
    \item{\code{estimates.survival}:}{Object of class \code{"numeric"} Covariate coefficients for the time from progression to death covariates}
    \item{\code{se.estimates.survival}:}{Object of class \code{"numeric"}Standard Errors of the above estimates}
    \item{\code{hazard.progression}:}{Object of class \code{"numeric"}Log-hazard of progression}
    \item{\code{hazard.survival}:}{Object of class \code{"numeric"}Log-hazard of survival after progression }
    \item{\code{intervals}:}{Object of class \code{"integer"}Number of intervals used in estimation }
    \item{\code{rescale}:}{Object of class \code{"numeric"} Constant that was used to rescale data before estimation}
    \item{\code{formula.progression}:}{Object of class \code{"formula"} }
    \item{\code{formula.survival}:}{Object of class \code{"formula"} }
    \item{\code{progression.covariate.list}:}{Object of class \code{"character"} }
    \item{\code{survival.covariate.list}:}{Object of class \code{"character"} }
    \item{\code{message}:}{Object of class \code{"character"} Message from program }
  }
}
\section{Methods}{
  \describe{
    \item{plot}{\code{signature(x = "pssm")}: ... 
    See \code{\link{plot-methods}}}
    \item{print}{\code{signature(x = "pssm")}: }
    \item{summary}{\code{signature(object = "pssm")}: Creates summary object with covariate effects}
	 }
}

\author{
David A. Schoenfed
%%  ~~who you are~~
}

\seealso{
\code{\link{pssm-package}},
\code{\link{pssm.generate.data}},
\code{\link{pssm}},
\code{\link{pssm.simulate}},
\code{\link{pssm.survivalcurv}},
\code{\link{plot-methods}},
\code{\link{pssm.power}}
}
\examples{
showClass("pssm")
}
\keyword{classes}
