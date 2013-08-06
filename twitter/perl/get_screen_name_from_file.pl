    #!/usr/bin/perl -w
use strict;
use common::sense;
use Data::Dumper;

open (FILE, '<' , 'uniqflisol2011_2012.txt' );
open (FILEOUT, '>' , 'screennameMention2011_2012.txt' );

my @screen_names;


while (<FILE>) {
    my $line = $_;
    my @words = split(' ', $line);
    foreach my $word (@words) {
        if ($word=~/@(_?\w*_?)/g) {
        push(@screen_names, $word); 
        print FILEOUT $word."\n";
        }
    }
}
close(FILE);
close(FILEOUT);
