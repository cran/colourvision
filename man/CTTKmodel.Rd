\name{CTTKmodel}
\alias{CTTKmodel}
\title{
Chittka colour vision models
}
\description{
Chittka trichromatic and tetrachromatic colour vision models.
}
\usage{
CTTKmodel(photo=c("tri","tetra"), R, I, Rb, C,
          interpolate=TRUE, nm=seq(300,700,1))
}
\arguments{
  \item{photo}{
Trichromatic (\code{"tri"}) or tetrachromatic (\code{"tetra"}) colour vision model.
}
  \item{R}{
Reflectance of observed objects. A data frame with first column corresponding to wavelength values and following columns with reflectance values. \code{R} must be in the same scale as \code{Rb} (percentage or proportion).
}
  \item{I}{
Irradiance spectrum. A data frame with two columns only: first column corresponding to wavelength values and second column with irradiance values. Irradiance values must be in quantum flux units.
}
  \item{Rb}{
Background reflectance. A data frame with two columns only: first column corresponding to wavelength values and second column with reflectance values. \code{Rb} must be in the same scale as \code{R} (percentage or proportion).
}
  \item{C}{
Photoreceptor sensitivity curves, from lowest to longest lambda-max. A data frame: first column corresponding to wavelength values and following columns with photoreceptor sensitivity values (see function \code{\link{photor}}). 
}
  \item{interpolate}{
Whether data files should be interpolated before further calculations. See \code{\link{approx}}.}
  \item{nm}{
A sequence of numeric values specifying where interpolation is to take place. See \code{\link{approx}}.}

}
\details{
The original model is available for trichromatic animals only. Thery and Casas (2002) derived a version for tetrachromatic animals which is implemented here. Photoreceptor outputs (\eqn{Ei}{E_i}) are calculated by:
\deqn{E_i = \frac{q_i}{q_i+1}}{Ei = qi/(qi+1)}
where \eqn{qi}{q_i} is given by \code{\link{Qr}}. Then, for thrichromatic vision, coordinates in the colour space are found by (Chittka 1992):
\deqn{x = \frac{\sqrt{3}}{2}(E_3-E_1)}{x = (sqrt(3)/2)*(E3-E1)}
\deqn{y = E_2-\frac{1}{2}(E_1+E_3)}{y = E2-0.5*(E1+E3)}
And for tetrachromatic vision (Thery and Casas 2002):
\deqn{x = \frac{\sqrt{3}\sqrt{2}}{3}(E_3-E_4)}{x = ((sqrt(3)*sqrt(2))/3)*(E3-E4)}
\deqn{y = E_1-\frac{1}{3}(E_2+E_3+E_4)}{y = E1-(1/3)*(E2+E3+E4)}
\deqn{z = \frac{2\sqrt{2}}{3}(\frac{1}{2}(E_3+E_4)-E_2)}{z = (2*sqrt(2)/3)*(0.5*(E3+E4)-E2)}
}
\value{
for trichromats:
\item{P1,P2,P3}{Photoreceptor quantum-catches values after the von Kries transformation (see function \code{\link{Qr}}).}
\item{E1,E2,E3}{Photoreceptor excitation values. Values can vary from 0 to 1.}
\item{x,y}{Coordinates in the animal colour space. See \code{\link{CTTKhexagon}}.}
\item{deltaSo}{Euclidian distance to the origin of the colour space. It represents the conspicouness of the stimulus (\code{R}) in relation to the background (\code{Rb}).}
for tetrachromats:
\item{P1,P2,P3,P4}{Photoreceptor quantum-catches values after the von Kries transformation (see function \code{\link{Qr}}).}
\item{E1,E2,E3,E4}{Photoreceptor excitation values. Values can vary from 0 to 1.}
\item{x,y,z}{Coordinates in the animal colour space. See \code{\link{CTTKhexagon3D}}.}
\item{deltaSo}{Euclidian distance to the origin of the colour space. It represents the conspicouness of the stimulus (\code{R}) in relation to the background (\code{Rb}).}
}
\references{
Chittka, L. 1992. The colour hexagon: a chromaticity diagram based on photoreceptor excitations as a generalized representation of colour opponency. J Comp Physiol A 170:533-543.

Thery, M., and J. Casas. 2002. Predator and prey views of spider camouflage. Nature 415:133-133.
}
\author{
Felipe M. Gawryszewski \email{f.gawry@gmail.com}
}
\seealso{
\code{\link{CTTKhexagon}}, \code{\link{CTTKhexagon3D}}, \code{\link{photor}}, \code{\link{RNLmodel}}, \code{\link{EMmodel}}
}
\examples{
##Photoreceptor sensitivity curves
##with lambda max at 350nm, 450nm and 550nm:
C<-photor(lambda.max=c(350,450,550))

## Grey background
## with 10 percent reflectance from 300 to 700nm:
Rb <- data.frame(300:700, rep(10, length(300:700)))

## Read CIE D65 standard illuminant
data("D65")

## Reflectance data
## with a sigmoid spectrum and midpoint at 500nm
R<-logistic(x=seq(300,700,1), x0=500, L=50, k=0.04)

## Run model 
CTTKmodel(photo="tri", R=R, I=D65,
    Rb=Rb, C=C)
}