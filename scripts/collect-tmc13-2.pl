#!/usr/bin/env perl
#
# This is an example to illustrate how to use the log parser.  This
# tool is compatible with the experiment structure in Makefile.tmc13-step.
#
# Usage:
#   collect-tmc13.pl <condition> <sequence> <variant> <base_path> <src_ply>
#
# Where:
#   <condition> is a CTC test condition name
#   <sequence> is the sequence name
#   <variant> is the CTC test point variant
#   <base_path> is the path used by MPEG::PCC::Parse::Experiment::Df
#   <src_ply> is the source ply
#
 
use strict;

use FindBin;
use lib "$FindBin::Bin";

use MPEG::PCC::Parse::Experiment::Df;

# the set of output columns
# NB: it seems pointless, but useful if this script were to process more
#     than one file at a time.
my %columns;

# process all the data (to get list of columns)
my @results;


# To process multiple files, turn the following into a loop:
#foreach my $idx (0..1){

my ($condition, $sequence, $variant, $base_path, $src_ply) = @ARGV;
#my $condition="/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_allQP/predgeom-raht/lossless-geom-lossy-attrs/redandblack_vox10_1550/r01"
#my $sequence="redandblack_vox10_1550"
#my $variant=0
#my $base_path="/home/datnguyen/Projects/mpeg-pcc-tmc13v14/Output/r01/redandblack_vox10_1550.ply"
#my $src_ply="/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/redandblack_vox10_1550.ply"

my $line = readTmc3Results($base_path, $src_ply);
@columns{keys %$line} = ();
$line->{config} = $condition;
$line->{sequence} = $sequence;
$line->{variant} = $variant;
push @results, $line;

# output data
BLOCK: {
	my @out_order_cols = (
		qw{config sequence variant},
		sort keys %columns,
	);

	local $" = ',';
	print "@out_order_cols\n";
	
	foreach my $line (@results) {
		print "@$line{@out_order_cols}";
	}

}
#}



