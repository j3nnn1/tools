#! /usr/bin/perl -w
use strict;
use Data::Dumper;
use Cwd;

$ENV{DISPLAY}=':0.0';

my @videos;
my $directoriovideos; 
my $directoriopelis;
my $maxelementarray;

#chdir($directoriovideos);
#@videos = `ls`;
#chomp(@videos);
chdir($directoriopelis);
push @videos, `ls`;
chomp (@videos);
$maxelementarray    = $#videos;

my $peliescogida;

$peliescogida       = int(rand($maxelementarray));

print Dumper @videos;
print $peliescogida . "\n";
print "Pelicula a ejecutar: $directoriopelis/$videos[$peliescogida]". "\n";
my $rutafinal = "$directoriopelis/$videos[$peliescogida]" . "\n";
print cwd;
#`vlc $rutafinal`;
#exec("vlc $rutafinal");
system("vlc $rutafinal");



