# Selecting mean() and std() variable indeces
sublist     <- sublist()
subindex    <- names[which( names$V2 %in% sublist ), ]$V1

# Subsetting and reordering data
data   <- data[, c( 1, 2, subindex + 2 )]
levels( data$id )  <- factor( 1:30 )
data <- with( data, data[order( id, activity ), ] )