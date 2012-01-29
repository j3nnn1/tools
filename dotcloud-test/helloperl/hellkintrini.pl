#!/usr/bin/perl -w
use strict;
use common::sense;


  use Mojolicious::Lite;

    get '/' => {text => 'Hello World!'};

      app->start;
