#!/usr/bin/env perl

use strict;
use warnings;
use v5.32;

use FileHandle;
use File::Compare qw(compare);


BEGIN {
    $#ARGV == 1 or warn "Usage: file_cmp.pl file1 file2\n" and exit(2);
}


sub main {
    my $file1 = FileHandle->new($ARGV[0], 'r');
    my $file2 = FileHandle->new($ARGV[1], 'r');
    # encode files using utf8
    binmode($file1, ':utf8');
    binmode($file2, ':utf8');
    # compare encoded files
    cmp_files($file1, $file2);
}


# Compares given files
sub cmp_files {
    my ($file1, $file2) = @_;

    if (compare($file1, $file2) == 0) {
        say "The files $file1 and $file2 are equal!";
    } else {
        say "The files $file1 and $file2 aren't equal!";
    }
}

main()
