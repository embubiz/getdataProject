# Put as first column of a dataframe a given factor variable from another dataframe
# The new column is labelled "activity"

put.lab  <- function( df, lab.df ) {
    # df is the dataframe to which the id column should be added
    # id is the dataframe made of 1 column, containing the id values
    
    L   <- dim( df )[1]
    activity    <- lab.df[, 1]
    
    activity    <- as.data.frame( as.factor( activity ) )
    names( activity )[1]  <- "activity"
    cbind( activity, df )
}