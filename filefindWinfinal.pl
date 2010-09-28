#!/usr/bin/perl -w
#%%% made by j3nnn
#%%% license: GPLv3
#%%% enjoy 
use strict;

use File::stat;
use File::Find::Rule;
use Mail::Sender;
use Getopt::Std;
use POSIX;
require("../configs/configfilefindWinfinal.pl");

#%% info about a file (mtime)
our $file_stat;
#%% difference of seconds
our $diff_seconds;
#%% array where is storage the rute to find file and delete
our @FilesDir;
#%% indicates if the script delete a file for default if not otherwise specified
our $unlink;
#%% indicates the time must have elapsed to delete a file if it is not specified to run
our $elapsetime;
#%% array that contains the filename to delete
our @FilesNames;
#%% to send email when finish
our $to;
#%% object to send email
our $sender;
#%% current time in seconds
my $time_current;
#%% current time in seconds, but subtracting the hours that have passed that day. exactly this dd / mm / yy 00:00:00.
my $current_seconds;
#%% has elapsed seconds in the day of modification of the file. exactly this 00 / 00 / 00 00:00:60.
my $time_valid_modify;
#%% namefile to the log
my $name_file;
#%% variable auxiliar text to log
my $cadena;
#%% my %opts
my %argumento; 
#%%filename to process
my $filename;

getopts('t:e:', \%argumento);

if ($argumento{e}){ $unlink 	= $argumento{e};}
if ($argumento{t}){ $elapsetime = $argumento{t};}

unless ($unlink =~/(no|si)/i) {
	print 'opcion invalida para parametro -e, usage [no, NO, si, SI]';
	exit 1;
}
unless ($elapsetime =~ /^\d+$/) {
	print 'mal formato - el tiempo debe estar en segundos y ser un numero entero\n';
	exit 1;
}

# recorre todos los directorios del arreglo @FilesDir
$time_current= time;
	
foreach(@FilesDir){
	@FilesNames = getFileName($_);
		
	# recorre todos los archivos dados en el arreglo @FilesNames
	foreach(@FilesNames){
		$filename = $_;
		$file_stat = stat($filename);

		my($date_string) 	= $file_stat->mtime;
		$current_seconds 	= PassTime(time); 
		#%% Obteniendo tiempo de modificacion.
		$time_valid_modify 	= PassTime($date_string); 	
		#%% Tiempo de antiguedad del archivo en segundos.
		$diff_seconds = $current_seconds - $time_valid_modify;
		#%% Llevando a días el tiempo de antiguedad del archivo en dias enteros.			
		$diff_seconds= $diff_seconds/86400; 
      
		if ($diff_seconds > $elapsetime){
			if ($unlink =~/(no)/i){
				my ($sec1, $min1, $hour1, $mday1, $mon1, $year1, $wday1, $yday1, $isdst1) = localtime($file_stat->mtime);
				printf "$filename \t Modificado: ".'0'x(2-length($mday1)).$mday1."/".'0'x(2-length($mon1+1)).($mon1+1)."/".($year1+1900)."\n";
			}
			elsif($unlink =~/(si)/i){
		
				unlink "$filename" or die "no se borro $filename : $@";
				$name_file = 'log_delete_file'.Getcurrentdate().'.txt';
				open (LOG, ">> $name_file") or die 'Imposible abrir archivo o usuario no posee privilegios';
				$cadena = "$filename eliminado el: ".Getcurrentdate()."\n";
				print LOG "$cadena";
				close (LOG);
			}
		}
	}
}
if ($name_file){
   say('Se genero el log correspondiente...');
}
else {
   if($unlink =~/si/i){
				$name_file = 'log_delete_file'.Getcurrentdate().'.txt';
				open (LOG, ">> $name_file") or die 'Imposible abrir archivo o usuario no posee privilegios';
				print LOG 'el '.Getcurrentdate().' No se encontraron archivos con '.$elapsetime.' dias de antiguedad'.@FilesNames."\n";
				close (LOG);
   }
}
#%%%%%%%%%%%
#functions 4
#%%%%%%%%%%%

#funcion que transforma el tiempo a segun
sub PassTime{
my $timeCurrent;
my $hmodi_pass_sec;
my $mmodi_pass_sec;
my $current_sec;
my $diff;
$timeCurrent = shift;
my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime($timeCurrent);
			$hmodi_pass_sec = $hour*3600;
			$mmodi_pass_sec = $min*60;
			$current_sec = $hmodi_pass_sec  + $mmodi_pass_sec + $sec; #segundos transcurridos en el dia.
			$diff = $timeCurrent - $current_sec;
return $diff;
}

#Obtener fecha actual con formato para imprimir
sub Getcurrentdate{
my $currentdate;
my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time) or die 'Imposible obtener hora del sistema';
$mon = $mon + 1;
$year  = $year + 1900;
$currentdate = $mday."-".$mon."-".$year;
return $currentdate;
}
#%%% say
sub say {
my $texto =shift;
print $texto. "\n";
}
#%%% obtener nombre de los archivos q se encuentren en el directorio de parametro de entrada.
sub getFileName {
	my $sDirectory = shift;
	# encuentra todos los archivos especificados en @subdirs
	my @files = File::Find::Rule->file()
								->name('*.txt', '*.log', '*')
								->in( $sDirectory );
	return @files
}
