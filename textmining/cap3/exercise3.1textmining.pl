#!/usr/bin/perl
#
#Find all the words containing interior apostrophes in Dickens’s A Christmas Carol. 
#Hence, on each side of the apostrophe there is an alphanumeric character. There are 
#quite a few of these, some familiar to today’s reader (like it’s or I’ll), and some
#unfamiliar (like thank’ee or sha’n’t). For each of these, find its frequency in the novel.
my %hash;

open FILE, "christmasscarol.txt";

while (my $linea = <FILE>) {
    $linea = lc($linea);
    chomp $linea;
    $linea=~s/[.,:;?"!()]//g;
    $linea=~s/--//g;
    $linea=~s/ +/ /g;
    $linea=~s/\s^'//g;

my @words = split (' ', $linea);
    foreach my $value (@words) {
        $value    =~/(\w+'\w+)/;
        if (defined($1)) {
            $hash{$1} = $hash{$1} + 1;
        }
    }
}


foreach my $keys (keys %hash){
print "$keys: $hash{$keys}\n";
}
