\name{plot-methods}
\docType{methods}
\alias{plot-methods}
\alias{plot,ANY-method}
\alias{plot,pssm-method}
\title{ Plot method for \code{plot} in Package \pkg{pssm} }
\description{
Does several different plots for a pssm object.
}
\section{Methods}{
\describe{

\item{\code{signature(x = "pssm")}}{
%%  ~~describe this method here~~
With only one argument a solid line is plotted for the survival curve for time to progression and then m dashed lines are plotted, each being the survival curve for survival after progression if progression occures at 0, and at each of the times that the hazard rate changes.
}
\item{\code{signature(x = "pssm",type="progression",cov1=,cov2=)}}{
%%  ~~describe this method here~~
The time for progression curve is plotted note that cov1 and cov2 must be matrices with first dimension the number of curves and second dimension the number of covariates.
}
\item{\code{signature(x = "pssm",type="progression",cov1=,cov2=)}}{
%%  ~~describe this method here~~
The time for progression curve is plotted note that cov1 and cov2 must be matrices with first dimension the number of curves and second dimension the number of covariates.
}
}}
\seealso{
\code{\link{pssm-package}},
\code{\link{pssm.generate.data}},
\code{\link{pssm}},
\code{\link{pssm.simulate}},
\code{\link{pssm.survivalcurv}}
\code{\link{pssm-class}}
\code{\link{pssm.power}}
}
\examples{
showClass("pssm")
}
\keyword{methods}
