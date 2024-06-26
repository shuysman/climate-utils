% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fix-gridmet-datetimes.R
\name{fix_gridmet_dates}
\alias{fix_gridmet_dates}
\title{Fix gridMET dates}
\usage{
fix_gridmet_dates(raster)
}
\arguments{
\item{raster}{SpatRaster to fix}
}
\value{
1 if successful
}
\description{
Fix dates on a spatraster of historical gridmet data
}
\details{
Converts dates from "days since 1900-01-01" format
(eg. daily~28854) to R datetime objects, then sets raster time
dimension using terra:time().  Will modify the spatraster object
in-place (pass-by-reference), so should be called with
fix_gridmet_names(SpatRaster), instead of reassigning the return
value i.e. with r <- fix_gridmet_dates(r)
}
