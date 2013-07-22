    
	
	
	@b = (1,2,3,4);
    *a = \@b;

    push @b, 5;
    print @a; # 12345

    # However:
    $a = "Bye";
    $b = "Hello there!";
    print $a; # Bye
	print $b;
	
	*a = \"Hello";
    *a = [ 1, 2, 3 ];
    *a = { red => "rouge", blue => "bleu" };

    print $a;        # Hello
    print $a[1];     # 2
    print $a{"red"}; # rouge
	
	#accediendo a lAs PARTES globs
	
	*a{ARRAY} = \@a;
	*a{HASH} = \@a;
	*a{IO} = \@a;
	*a{CODE} = \@a;
	*a{FORMAT} = \@a;
	*a{GLOB} = \@a;
	
	
	
	
	