#How work EXPORTS
#$sym = useful
#

foreach $sym (@imports) {
        # shortcut for the common case of no type character
        (*{"${callpkg}::$sym"} = \&{"${pkg}::$sym"}, next)
            unless $sym =~ s/^(\W)//;

        $type = $1;
        *{"${callpkg}::$sym"} =
            $type eq '&' ? \&{"${pkg}::$sym"} :
            $type eq '$' ? \${"${pkg}::$sym"} :
            $type eq '@' ? \@{"${pkg}::$sym"} :
            $type eq '%' ? \%{"${pkg}::$sym"} :
            $type eq '*' ?  *{"${pkg}::$sym"} :
            do { require Carp; Carp::croak("Can't export symbol:$type$sym") };
        }


