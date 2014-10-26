# Providing list of data sets to be extracted
sets    <- c( "test", "train" )

# Iterating data extraction following the provided list
for ( s in sets ) {
    
    # Reading data set
    tab     <- read.table( paste0( "UCI HAR Dataset/",
                                   s,
                                   "/X_",
                                   s,
                                   ".txt" ), header = F )
    
    # Naming data set variables
    colnames( tab )     <- feat
    tab     <- put.lab( tab,
                        read.table( paste0( "UCI HAR Dataset/",
                                            s,
                                            "/y_",
                                            s,
                                            ".txt" ) ) )
    
    # Inserting id column in the data set
    tab     <- put.id( tab,
                       read.table( paste0( "UCI HAR Dataset/",
                                           s,
                                           "/subject_",
                                           s,
                                           ".txt" ) ) )
    
    # Renaming resulting data set
    assign( s, tab )
}

# Merging train and test data
data    <- rbind( test, train )

# Removing useless variables
rm( tab, s, sets )