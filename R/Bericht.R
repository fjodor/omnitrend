#' Berichte erstellen
#'
#' Berichte erstellen im HTML-Format.
#' Achtung: Evtl. im aktuellen Arbeitsverzeichnis vorhandener Bericht wird überschrieben!
#' Empfehlung: Dateinamen angeben!
#'
#' @param continent Kontinent
#' @param min_year Untere Schwelle: erstes Jahr, das im Bericht berücksichtigt wird
#' @param max_year Obere Schwelle: letztes Jahr, das im Bericht berücksichtigt wird
#' @param Land1 Erstes Land für die Grafik mit dem Ländervergleich
#' @param Land2 Zweites Land für die Grafik mit dem Ländervergleich
#' @param Dateiname Dateiname als Text, z. B. "Gapminder-Bericht.html" (mit Anführungszeichen; Dateiendung: .html)
#'
#' @return Bericht im Word-Format
#' @export
#'
#' @examples
#' bericht()
#' bericht(continent = "Europe", Land1 = "Iceland", Land2 = "Turkey")
#' bericht(continent = "Europe", min_year = 1982, max_year = 2007,
#'  Land1 = "Iceland", Land2 = "Turkey", Dateiname = "Europa.html")

bericht <- function(continent = "all", min_year = 1952, max_year = 2007, Land1 = "Germany", Land2 = "Turkey",
                    Dateiname = "Gapminder-Bericht.html") {
  wd <- getwd()
  rmarkdown::render(system.file("Gapminder-Bericht.Rmd", package = "omnitrend"), params = list(
    continent = continent,
    min_year = min_year, max_year = max_year,
    Land1 = Land1, Land2 = Land2),
    output_file = file.path(wd, Dateiname))
}
