#! /usr/bin/perl -w
#%%% made by j3nnn
#%%% license: GPLv3


use strict;
use LWP::UserAgent;
use Data::Dumper;
use HTTP::Request::Common qw (POST GET);
use HTTP::Cookies;
use feature "say";
use Cwd;

require '../configs/configuploadmanyfilev6.pl';

#%%% Instancio mi cliente que realizara la peticion al servidor
my $ua = LWP::UserAgent->new;
#%%% Indicate modo debug
our $debug;
#%%% Donde estan los archivos a subir
our $pathfileupload;
#%%% browser that i am
our $mybrowser;
#%%% where is the browser's cookies 
our $cookiespath;
#%%% wiki main page  
our $mainpage;
#%%% url to login
our $urllogin;
#%%% get method
our $getmethod;
#%%% info login
our $accountlogin;
our $pwdlogin;
#%%% url wiki
our $urlwiki;
#%%% url to upload file
our $urlupload;

our $namefile;

#Me disfrazo de Mozilla 
$ua->agent($mybrowser);

#habilitando las cookies por defecto
#configurando los atributos de las cookies
$ua->cookie_jar( HTTP::Cookies-> new ( 'file'=> $cookiespath, 
                                        # where to read/wirte cookies 
                                       'autosave'=>1,
                                        #save it to disk when done
                                        )
               );

# obteniendo pagina principal 
my $resultado = $ua->request( GET($mainpage));

#imprimiendo petición si debug=1
if ($resultado->is_success) {
   my $pagina1 =  $resultado->decoded_content;
   if ($debug==1) { 
      say "########################### Pagina 1 ########################################";
      say $pagina1;
      say "#############################################################";
   }

   #obtengo el url del action, el metodo a utilizar
   $pagina1=~/$urllogin/; 
   my $action = $1;
   say $action;
   $pagina1=~/$getmethod/;
   my $method = $1;
   say $method;
   #armo hash de parametros POST o get a enviar
   my $form = [ wpName        => $accountlogin,
                wpPassword    => $pwdlogin,
                wpLoginattempt=> 'Log in'];

   my $resultado2;
   my $url =$urlwiki.$action;
   eval '$resultado2 = $ua->request('. uc($method).' $url, $form )->as_string()';

   if ($debug==1) { 
   say "########################### Pagina 2 ########################################";
   say  $resultado2; 
   say "####################################################################";
   }
   my $resultado = $ua->request( GET($mainpage));
   my $pagina3 =  $resultado->decoded_content;
   if ($debug==1) { 
   say "########################### Pagina 3 ########################################";
   say $pagina3; 
   say "###################################################################";
   }

   #checkin if I'm in
   if ($pagina3 =~/pt-userpage/) {
      say "I'm  in";
      #listando los archivos a subir guardandolos en el arreglo @archivos
      chdir($pathfileupload);
      my @files = `ls`;     
      my $pagina5;
      chomp @files;

      foreach (@files) {
         $namefile   = $pathfileupload.$_;
         say         cwd;
         $form       = [ wpUploadFile        => [$namefile,$_,Content_Type=>'application/pdf'],
                         wpSourceType        => 'file',
                         wpDestFile          => $_,
                         wpUploadDescription => 'cnsl-caracas2010-'.$_,
                         wpUpload            => 'Upload file',
                         wpIgnoreWarning     => 'true'
                         ];
         
         $pagina5    = $ua->request(POST $urlupload, $form, Content_Type=>'form-data') or die "No subió ningun archivo";

         say         "Uploading the file ".$namefile. '...';

         if ($debug==1) { 
            say "########################### Pagina 5 ########################################";
            say $pagina5;
            say "###################################################################";
         }
         exit 0;
      }

   
   }
   else {
      say "autenticacion fallida sorry.. coloca bien la clave..";
      say "pueden ser ñas cookies";
      say "echa un vistazo";
   }

}
else {
say "ERROR:". $resultado->status_line();
}
