# Installing package "plyr" (if needed)
if ( !( "plyr" %in% rownames( installed.packages() ) ) ) {
    install.packages( "plyr" )
}
library( "plyr" )

# Installing package "dplyr" (if needed)
if ( !( "plyr" %in% rownames( installed.packages() ) ) ) {
    install.packages( "dplyr" )
}
library( "dplyr" )

# Loading function put.id()
source( "put.id.R" )

# Loading function put.id()
source( "put.lab.R" )

# Loading function sublist()
source( "sublist.R" )

# Reading features names
names   <- read.table( "UCI HAR Dataset//features.txt" )
feat    <- as.character( names$V2 )