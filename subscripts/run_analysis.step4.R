# Initializing vector containing new names
new_vars    <- character( length = length( sublist ) )

for ( i in seq_along( sublist ) ) {
    
    # Current variable name
    var     <- sublist[i]
    
    # Initializing new standardized var name
    newvar  <- character( length = 0 )
    
    # Domain
    if ( substr( var, 1, 1 ) == "t" ) {
        newvar  <- "time."
    } else {
        newvar  <- "freq."
    }
    var     <- substr( var, 2, nchar( var ) )
    
    # Gravity
    if ( substr( var, 1, 1 ) == "B" ) {
        var     <- substr( var, 5, nchar( var ) )
        newvar  <- paste0( newvar, "body." )
    } else {
        newvar  <- paste0( newvar, "grav." )
        var     <- substr( var, 8, nchar( var ) )
    }
    if ( substr( var, 1, 1 ) == "B" ) {
        var     <- substr( var, 5, nchar( var ) )
    }
    
    # Sensor
    if ( substr( var, 1, 1 ) == "A" ) {
        newvar  <- paste0( newvar, "acc." )
        var     <- substr( var, 4, nchar( var ) )
    } else {
        newvar  <- paste0( newvar, "gyr." )
        var     <- substr( var, 5, nchar( var ) )
    }
    
    # Jerk
    if ( grepl( pattern = "Jerk", x = var ) ) {
        var     <- substr( var, 5, nchar( var ) )
        newvar  <- paste0( newvar, "jerk." )
    } else {
        newvar  <- paste0( newvar, "nonj." )
    }
    
    # Components
    if ( substr( var, 1, 1 ) == "M" ) {
        newvar  <- paste0( newvar, "mag." )
        var     <- substr( var, 5, nchar( var ) )
    } else {
        newvar  <- paste0( newvar, substr( var, nchar( var ), nchar( var ) ), "ax." )
        var     <- substr( var, 2, nchar( var ) - 2 )
    }
    
    # Operator
    if ( substr( var, 1, 1 ) == "m" ) {
        newvar  <- paste0( newvar, "mean." )
    } else {
        newvar  <- paste0( newvar, "stdd." )
    }
    
    # Saving coded name
    new_vars[i]     <- newvar
    
}

# Adding "id" and "activity" to the vector of the variable names
new_vars  <- c( "id", "activity", new_vars )

# Renaming data set variables
names( data )  <- new_vars