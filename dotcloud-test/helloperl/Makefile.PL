#!/usr/bin/env perl
use ExtUtils::MakeMaker;

WriteMakefile(
  PREREQ_PM => {'Mojolicious::Lite' => '2.46',
                'Mojolicious::Plugin::PODRenderer' => '2.46',
                'common::sense'=> 3.4 ,
                'Test::More' => 0,
                'YAML'       => 0,
                'Dancer'     => 1.3030,
                'Plack'      => 0.9974,
                'PSGI'       => 1.03,
                'Mojolicious::Plugin::Mongodb' => 1.07,
                'Net::Twitter' => 3.18,
                'Mojolicious::Plugin::LinkedContent' => 0.04 ,
  }
  );


