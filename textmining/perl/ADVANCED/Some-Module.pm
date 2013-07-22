use Some::Module;
our $useful = "Some handy string";

print $Some::Module::useful;

#${caller(  )."::useful"} = $useful;
#@{caller(  )."::useful"} = @useful;
&{caller(  )."::useful"} = &useful;


sub useful { 42 }
    sub import {
    no strict 'refs';
    *{caller(  )."::useful"} = \&useful;
}










