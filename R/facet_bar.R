#' facet_bar
#'
#' @param df data frame used for plotting 
#' @param y what to plot on the y-axis
#' @param x what to plot on the x-axis
#' @param by the grouping/faceting variable
#' @param nrow number of rows for the plot
#' @param ncol number of panels in each row
#' @param scales "free" allows for each panel to have its own scales
#'
#' @return
#' @export
#'
#' @examples

facet_bar <- function(df, y, x, by, nrow = 2, ncol = 3, scales = "free") {
      mapping <- aes(y = reorder_within({{ y }}, {{ x }}, {{ by }}), 
                     x = {{ x }}, 
                     fill = {{ by }})
      
      facet <- facet_wrap(vars({{ by }}), 
                          nrow = nrow, 
                          ncol = ncol,
                          scales = scales) 
      
      ggplot(df, mapping = mapping) + 
            geom_col(show.legend = FALSE) + 
            scale_y_reordered() + 
            facet + 
            ylab("")
} 
