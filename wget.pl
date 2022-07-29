#!/usr/bin/env perl

# File    : wget.pl
# Licence : Perl Artistic License
# Author  : Koray Eyinç <korayeyinc@gmail.com>


use v5.32;

use strict;
use warnings;
use feature ':5.32';

use LWP::Simple;


# Checks specified URL and fetches source code for the given webpage
sub wget {
        my $url = shift;
        my $doc = get($url);
        die "Couldn't get it!" unless defined $doc;
        return $doc;
}


# Removes all blank lines from given source code.
sub trim {
        my $input = shift;
        my $output = "";
        foreach (split(/\n/, $input)) {
                $output .= $_ if /\S/;
        }
        return $output;
}


sub main
{
    my $url = $ARGV[0];
    my $doc = wget($url);

    $doc = trim($doc);
    say($doc);
}

main();

