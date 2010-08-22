#!/usr/bin/perl -w
use strict;

use Spreadsheet::WriteExcel::FromDB;
use Spreadsheet::WriteExcel;
use DBI;
use DBD::mysql;
use Data::Dumper;

require "../configs/configtabletoexcelv1.pl";

our $dsn;
our $user;
our $password;
my $dbh;
my $sth;

#conexion a BD
$dbh = DBI->connect($dsn, $user, $password);

#Obteniendo listado de tablas 

$sth = $dbh->prepare(qq{show tables});
$sth->execute();
my $data = $sth->fetchall_arrayref();
my $sizearray = $#$data;

#declarando variables a utilizar

my @result;
my @tablas;
my @name; #nombre del campo de la tabla
my $i;
my $j=0;
my $k;
my $l;
my $workbook;
my $worksheet;
my $format;
my @datos;

#armando consulta  de las tablas

for ($i=0; $i<$#$data; $i++) {
  
   $sth = $dbh->prepare(qq{select * from $data->[$i][0]});
   $sth->execute();
   @name   = $sth->{NAME};
   #@tablas = $sth->fetchall_arrayref();

   #contenido de tablas es pasado a una hoja de excel 
   
   $workbook  = Spreadsheet::WriteExcel->new(qq{$data->[$i][0].xls});
   $worksheet = $workbook->add_worksheet();
   # aplicando formato del encabezado.

   $format    = $workbook->add_format();

   $format->set_bold();
   $format->set_color('black');

   # worksheet añadiendo encabezado de tabla
   for ($j=0; $j<=($#name+1); $j++){
      
      $worksheet->write(0, $j, "$name[0][$j]", $format);
   }  

   # worksheet añadiendo datos
   $k=1;
   while (@datos = $sth->fetchrow_array() ) {
      for ($l=0; $l<($#datos + 1); $l++){       
      $worksheet->write($k,$l, $datos[$l]); 
      }
   
   $k++;
   }   
exit 0;
}
