bingLayerDependencies <- function() {
  list(
    htmltools::htmlDependency(
      "sharamov-leaflet-plugins",
      "2.0.0",
      system.file("htmlwidgets/lib/sharamov-leaflet-plugins//layer/tile", package = "leaflet.extras"),
      script = c("Bing.js", "Bing-bindings.js")
    ))
}

googleLayerDependencies <- function() {
  list(
    htmltools::htmlDependency(
      "sharamov-leaflet-plugins",
      "2.0.0",
      system.file("htmlwidgets/lib/sharamov-leaflet-plugins//layer/tile", package = "leaflet.extras"),
      script = c("Google.js", "Google-bindings.js")
    ))
}

#' Adds Bing Tiles Layer
#'
#' @param map The Map widget
#' @param apikey String. Bing API Key
#' @param imagerySet String. Type of Tiles to display
#' @param layerId String. An optional unique ID for the layer
#' @param group String. An optional group name for the layer
#' @param ... Optional Parameters required by the Bing API described at \url{https://msdn.microsoft.com/en-us/library/ff701716.aspx}
#' @export
addBingTiles <- function(
  map,
  apikey = Sys.getenv("BING_MAPS_API_KEY"),
  imagerySet = c("Aerial", "AerialWithLabels",
                 "CanvasDark", "CanvasLight", "CanvasGray",
                 "Road"),
  layerId = NULL,
  group = NULL,
  ...
  ) {

  if(is.null(apikey))
    stop("Bing Tile Layer requires an apikey")

  imagerySet <- match.arg(imagerySet)

  map$dependencies <- c(map$dependencies, bingLayerDependencies())
  invokeMethod(map, getMapData(map), 'addBingTiles', layerId, group, 
               list(apikey = apikey, type = imagerySet, ...))
}

