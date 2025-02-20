# colourvision v2.1.0
1. Changed how receptor noise is calculated when noise=FALSE to avoid misspecification by users (relevant for the RNLmodel and RNLthres functions). Now the n values are divided by their maximum before further calculations.
2. Updated the vignette presentation.
3. Updated deprecated rgl functions.
4. Added a function to calculate Weber achromatic contrasts (RNLachrom).


# colourvision v2.0.4
1. Fixed a minor bug with 'mar' argument in the EMtetrahedron function.
2. rgl package not mandatory for colourvision instalation.


# colourvision v2.0.3
1. Minor changes in description of functions and in package vignette.
2. rgl package not mandatory for colourvision instalation.


# colourvision v2.0.2
1. Minor changes in description of functions and in package vignette.


# colourvision v2.0.1
1. Corrected minor typos in package vignette.
2. Fixed minor bug in EMtriangle example (if condition of length greater than one).


# colourvision v2.0
1. Updated colour_vision( ) function to incorporate receptor noise data.
2. Updated colour_vision( ) and RNLmodel( ): new formula for calculating colour locus coordinates based on receptor noise. RNLmodel( ) gives different colour locus coordinates than in v.1.1, but with identical relative positions.
3. colour_vision( ) vector matrix is now a column vector matrix instead of a row vector matrix.
4.GENmodel( ). New function to generate user-defined colour vision models.
5.RNLplot( ) and RNLplot3d( ). New functions to plot RNLmodel outputs into a colour space.
6.deltaS( ). New function to calculate a matrix of euclidean distances based on colour vision model outputs.
7.radarplot( ). New function to plot quantum catches and photoreceptor outputs into a radar plot.
8.RNLmodel(model="log", ...) has been fixed. It now uses log(base=exp(1)) instead of log10.


# colourvision v1.1
1. Fixed a bug in RNLmodel that miscalculated deltaS values for animals with > 4 photoreceptors types.
2. Updated 'colour_space', 'EMmodel' and 'EMtriangle' to accommodate vector matrices for colour spaces with a fixed edge length.


# colourvision v1.0
1. Colour vision models have been extended to accept any number of photoreceptor types (>=2).
2. Updated the trichromatic version of EMmodel, and the EMtriangle. The colour space is now built with a vector length = 0.75 to match the tetrahedron proposed by Endler and Mielke (2005). Doris Gomez derived a trichromatic version which is available in software AVICOL, and was previously implemented here (colouvision v0.1).
3. New function 'RNLthres' for colour thresholds based on receptor noise (Vorobyev and Osorio 1998).
4. 'RNLmodel' has a new argument ('R2') to be compared against R1 values (former 'R' argument).
5. Updated photon catch ('Q') calculation to give correct values when interval != 1. This change does not affect model results.
6. 'noise_e' function has been updated.
7. 'CTTKhexagon' and 'EMtriangle' are more flexible, and allow other arguments to be passed to the 'plot' function.
8. 'CTTKhexagon3D' and 'EMtetrahedron' are more flexible, and allow other arguments to be passed to the 'plot3d' function.
9. Fixed a bug in 'photor' when using 'beta.band=TRUE'.
10. Added 'methods' to 'plot' and 'plot3d' generics.