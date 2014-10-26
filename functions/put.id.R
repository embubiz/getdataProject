# Put as first column of a dataframe a given factor variable from another dataframe
# The new column is labelled "id"

put.id  <- function( df, id.df ) {
    # df is the dataframe to which the id column should be added
    # id is the dataframe made of 1 column, containing the id values
    
    L   <- dim( df )[1]
    id  <- id.df[, 1]
#     if ( length( id ) <= L ) { id  <- id[1:L] }
#     else { id  <- rep( id, length.out = L ) }
    id  <- as.data.frame( as.factor( id ) )
    names( id )[1]  <- "id"
    cbind( id, df )
}