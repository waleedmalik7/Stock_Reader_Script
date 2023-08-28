#!usr/bin/perl

use Yahoo::Finance;
use strict;
use warnings;

my $api = Yahoo::Finance->new(); #Create yahoo finance object
    print 'Enter the symbol you would like to know the current price of: ';
    my $sym = <STDIN>;
    chomp $sym; #removes \n character
    my $info = { #adds symbol parameter
        symbol => "$sym",
    };
    my $historic_data = $api->get_historic_data($info); #API retreival of data
    my @data_lines = split('\n',$historic_data); #string to array
    my $last_line = $data_lines[-1];

    my @value = split(',',$last_line);
    my $close_value = $value[4];

    

print "The latest close value is: $close_value\n"; 