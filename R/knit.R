
#' Returns the output format used by `knitr` such as HTML or Word.
#'
#' @export
out.format <- memoise::memoise(function() {
	format <- knitr::opts_knit$get('rmarkdown.pandoc.to')
	if (is.null(format))
		format <- "unknown-knit-format"
	return(format)
})

#' Returns link to PDF if in HTML, otherwise return normal citation.
#' 
#' @param citation Citation string, so either `@a`, `[@a]` or `[@a; @b]`.
#' @export 
ap <- function(citation) {
  if (out.format!="html") {
    # The hyperref links only work in HTML.
    return(citation)
  } else {
    if (grepl(";", citation)) { # [@a; @b]
      return(citation) 
    } else { # @a, or [@a]
      if (grepl("\\[", citation)) { # [@a]
        filename <- substr(citation, 3, nchar(citation)-1) 
      } else { # @a
        filename <- substr(citation, 2, nchar(citation))
      }
      if (!(filename %in% pdf.files)) { 
        return(citation)
      } else {
        str <- "<a href=\"./files/%s.pdf\" target=\"_blank\">%s</a>"
        link <- sprintf(str, filename, citation)
        return(link)
      }
    }
  }
}
