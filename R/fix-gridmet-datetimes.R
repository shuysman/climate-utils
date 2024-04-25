#' Days to Datetimes
#'
#' Days since 1900-01-01 to datetime because the gridMET historical
#' data netcdfs for some reason don't include a time dimension,
#' instead include the time in the name of each layer in days since
#' 1900-01-01, ie., 28854 which is 1979-01-01.
#'
#' @param days vector of day strings
#' @return vector of datetimes
#' @export
days_to_datetime <- function(days) {
    days <- as.numeric(days)
    return(as.Date(days, origin = "1900-01-01"))
}

#' gridMET names layer to datetime
#' 
#' Convert layer names of raster to vector of datetimes
#'
#' @param raster SpatRaster to convert to datetimes
#' @return vector of day strings
#' @export
gridmet_names_to_datetime <- function(raster) {
    return(stringr::str_split_i(names(raster), pattern = "=", i = 2))
}

#' Fix gridMET dates
#' 
#' Fix dates on a spatraster of historical gridmet data
#'
#' Converts dates from "days since 1900-01-01" format
#' (eg. daily~28854) to R datetime objects, then sets raster time
#' dimension using terra:time().  Will modify the spatraster object
#' in-place (pass-by-reference), so should be called with
#' fix_gridmet_names(SpatRaster), instead of reassigning the return
#' value i.e. with r <- fix_gridmet_dates(r)
#'
#' @param raster SpatRaster to fix
#' @return 1 if successful
#' @export
fix_gridmet_dates <- function(raster) {
    days <- gridmet_names_to_datetime(raster)
    datetimes <- days_to_datetime(days)
    terra::time(raster) <- datetimes    
    return(1)
}
        
##r <- terra::rast("/media/smithers/shuysman/data/MACA/gye/historical/daily/tavg_1979_CurrentYear_daily_gye.nc ")

##fix_gridmet_dates(r)
