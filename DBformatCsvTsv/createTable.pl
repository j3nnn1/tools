#!/usr/bin/perl -w
use strict;
use Data::Dumper;
#use common::sense;
use Scalar::Util qw {looks_like_number};


my $table = 'creditos';
my $fileout = 'CreateCreditos.sql';
my $filetoupload = 'UBA_DMEF_2012_recu_03.csv';
my $typestring = 'varchar(255)';
my $typenumber = 'numeric';
my @fields;
my @fieldnames;
my %fieldsbd;
my $line;

open(FILE, '<', $filetoupload) or die ("No puede leer el archivo \n");
open(FILETWO, '>', $fileout);

print FILETWO 'CREATE TABLE '. $table . ' ( ';


while($line = <FILE>) {

       if ($.==2) {
             @fields = split(',',  $line);
             my $i = 0;
             foreach (@fields){
                chomp($_);
                $_  =~ s/"//g;
                if (looks_like_number($_)) {
                    $fieldnames[$i] =~ s/"//g;
                    chomp($fieldnames[$i]);
                    $fieldsbd{$fieldnames[$i]} = $typenumber;        
                }
                else {
                    $fieldnames[$i] =~ s/"//g;
                    chomp($fieldnames[$i]);
                    $fieldsbd{$fieldnames[$i]} = $typestring;
                }
                $i++;
             }
       }
       elsif($.>2) {
           last;
       }
       else {
           @fieldnames = split(',', $line);       
       }
}

#print Dumper %fieldsbd;
foreach (@fieldnames) {
   print FILETWO "$_ " . $fieldsbd{$_}.","; 
   print FILETWO "\n";
}
print FILETWO ');';
close(FILE);
close(FILETWO);




