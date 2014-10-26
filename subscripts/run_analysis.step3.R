label   <- read.table( "UCI HAR Dataset/activity_labels.txt" )
levels( data$activity )    <- c( levels( data$activity ), levels( label[, 2] ) )

for ( i in 1:6 ) {
    data$activity[as.numeric( data$activity ) == i ] <- label[i, 2]
}
data$activity  <- factor( data$ activity )