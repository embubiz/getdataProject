# Initializing vector containing descriptive names
new_vars    <- character( length = length( sublist ) )
descript    <- character( length = length( sublist ) )

for ( i in seq_along( sublist ) ) {
    
    # Current variable name
    var     <- sublist[i]
    
    # Initializing words to be used in the despriptive names of each variable
    domain  <- character( length = 0 )
    refsys  <- character( length = 0 )
    sensor  <- character( length = 0 )
    xyzmag  <- character( length = 0 )
    jerk    <- character( length = 0 )
    par     <- character( length = 0 )
    
    # Initializing new standardized var name
    newvar  <- character( length = 0 )
    
    # Domain
    if ( substr( var, 1, 1 ) == "t" ) {
        domain  <- "time "
        newvar  <- "time."
    } else {
        domain  <- "frequency "
        newvar  <- "freq."
    }
    var     <- substr( var, 2, nchar( var ) )
    
    # Gravity
    if ( substr( var, 1, 1 ) == "B" ) {
        refsys  <- "body "
        var     <- substr( var, 5, nchar( var ) )
        newvar  <- paste0( newvar, "body." )
    } else {
        refsys  <- "grav "
        newvar  <- paste0( newvar, "grav." )
        var     <- substr( var, 8, nchar( var ) )
    }
    if ( substr( var, 1, 1 ) == "B" ) {
        var     <- substr( var, 5, nchar( var ) )
    }
    
    # Sensor
    if ( substr( var, 1, 1 ) == "A" ) {
        sensor  <- "acceleration "
        newvar  <- paste0( newvar, "acc." )
        var     <- substr( var, 4, nchar( var ) )
    } else {
        sensor  <- "angular velocity "
        newvar  <- paste0( newvar, "gyr." )
        var     <- substr( var, 5, nchar( var ) )
    }
    
    # Jerk
    if ( grepl( pattern = "Jerk", x = var ) ) {
        jerk  <- "jerk "
        var     <- substr( var, 5, nchar( var ) )
        newvar  <- paste0( newvar, "jerk." )
    } else {
        newvar  <- paste0( newvar, "nonj." )
    }
    
    # Components
    if ( substr( var, 1, 1 ) == "M" ) {
        xyzmag  <- "magnitude "
        newvar  <- paste0( newvar, "mag." )
        var     <- substr( var, 5, nchar( var ) )
    } else {
        xyzmag  <- paste0( substr( var, nchar( var ), nchar( var ) ), " component " )
        newvar  <- paste0( newvar, substr( var, nchar( var ), nchar( var ) ), "ax." )
        var     <- substr( var, 2, nchar( var ) - 2 )
    }
    
    # Operator
    if ( substr( var, 1, 1 ) == "m" ) {
        par  <- "mean"
        newvar  <- paste0( newvar, "mean." )
    } else {
        par  <- "standard deviation"
        newvar  <- paste0( newvar, "stdd." )
    }
    
    # Saving coded name
    new_vars[i]     <- newvar
    
    # Defining descriptive name
    long.name   <- paste0( jerk,
                           refsys,
                           sensor,
                           domain,
                           "domain ",
                           xyzmag,
                           "signal ",
                           par )
    # Saving descriptive name
    descript[i]     <- long.name
    
}

# Adding "id" and "activity" to the vector of the variable names
descript  <- c( "id", "activity", descript )

# Renaming data set variables
names( data )  <- descript