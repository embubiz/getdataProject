sublist     <- function( ) {
    
    union( names( unlist( sapply( feat,
                                  grep,
                                  pattern = "mean()",
                                  fixed = T,
                                  value = F ) ) ),
           names( unlist( sapply( feat,
                                  grep,
                                  pattern = "std()",
                                  fixed = T,
                                  value = F ) ) ) )
}