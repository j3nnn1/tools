#!/usr/bin/perl -w
use strict;
use common::sense;

open(FILE, '<', 'onlyText.txt');
open(FILEOUT, '>', 'uniq_item_flisol2013.txt');

while(<FILE>) {
    my @wordsline;
    my %words_unique_line;
    my @words;

    @wordsline = split(' ', $_);
    foreach my $word (@wordsline) { 
        $words_unique_line{$word} = 1;
    }
    foreach my $key (keys(%words_unique_line)) {
        push(@words, $key);
    }
    print FILEOUT join(';', @words)."\n";
}

