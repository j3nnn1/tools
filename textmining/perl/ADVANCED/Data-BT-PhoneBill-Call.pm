package Data::BT::PhoneBill::_Call;
    our @fields = qw(type installation line chargecard _date time
                     destination _number _duration rebate _cost);

	
#This creates a new subroutine in the glob for each of the fields in the arrayequivalent to *type = sub { shift->{type} }. 	
	for my $f (@fields) {
        no strict 'refs';
        *$f = sub { shift->{$f} };
    }



    sub new {
      my ($class, @data) = @_;
      bless { map { $fields[$_] => $data[$_] } 0..$#fields } => $class;
    }
    
	# sub type         { shift->{type} }
    # sub installation { shift->{installation} }
    # sub line         { shift->{line} }



	
	
    # sub installation { shift->[0] }
    # sub line         { shift->[1] }

	 # {
       # my $seq = 3;
       # sub sequence { $seq += 3 }
    # }

    # print $seq; # out of scope

    # print sequence; # prints 6
    # print sequence; # prints 9


    # sub type         { shift->[0] }
    # sub installation { shift->[1] }
    # sub line         { shift->[2] }


