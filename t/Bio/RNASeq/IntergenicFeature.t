#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

BEGIN { unshift(@INC, './lib') }
BEGIN {

    use Test::Most;
    use_ok('Bio::RNASeq::IntergenicFeature');
}

ok my $intergenicfeature = Bio::RNASeq::IntergenicFeature->new(
   gene_start => 100,
   gene_end   => 200,
   seq_id     => "ABC"
  ), 'initialise intergenic feature';
is $intergenicfeature->gene_id(), "ABC_intergenic_100_200", 'build the correct gene ID';
my @expected_exons  = ([100,200]);

is_deeply $intergenicfeature->exons(), \@expected_exons, 'build correct exons';
done_testing();
