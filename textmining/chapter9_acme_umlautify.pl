#!/usr/bin/perl -w
use strict;
use common::sense;

#jcmm986 - 0.0.0 -

use Acme::Umlautify;

my $au = new Acme::Umlautify;

print $au->do('"Motley Crue" could have had way more umlauts, dude.'."\n");

