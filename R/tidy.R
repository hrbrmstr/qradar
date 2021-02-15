#' Turn a Qrator Radar raw API result into a data frame
#'
#' @param res raw QRator Radar API result from the query functions in
#'        this package.
#' @return data frame
#' @export
#' @examples
#' qr_tidy(qr_ip_lookup("17.253.144.10"))
qr_tidy <- function(res) {

  res$data

}