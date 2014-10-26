# Computing the average value of each variable for each subject and activity
data2   <- lapply( split( data, list( data$id,
                                      data$activity ) ),
                   FUN = function(x) colMeans(x[, 3:dim( x )[2]] ) )


# Preparing id and activity columns of the new data frame
df  <- data.frame( id = gl( n = 30,
                            k = 6,
                            labels = levels( data$id ) ),
                   activity = gl( n = 6,
                                  k = 1, 
                                  length = 180,
                                  labels = levels( data$activity ) ) )

# Initializing data frame containing average values
vars    <- data.frame()

# Building data set
for ( sub in levels( data$id ) ) {
    for ( lab in levels( data$activity ) ) {
        f   <- paste( as.character( sub ), as.character( lab ), sep = "." )
        vars    <- rbind(vars, t( data.frame( data2[f] ) ) )
    }
}

# Assigning id and activity to data
df  <- cbind( df, vars )

write.table( x = df,
             file = "dataset.txt",
             row.names = F )