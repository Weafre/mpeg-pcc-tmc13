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
#print "********************************";
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
my ($condition, $sequence, $variant, $base_path, $src_ply) = @ARGV;
my $line = readTmc3Results($base_path, $src_ply);
@columns{keys %$line} = ();
$line->{config} = $condition;
$line->{sequence} = $sequence;
$line->{variant} = $variant;
push @results, $line;


# output data
BLOCK: {
#	my @out_order_cols = (
#		qw{config sequence variant},
#		sort keys %columns,
#	);

	my @out_order_cols = (
		qw{sequence dec.y-psnr dec.cb-psnr dec.cr-psnr enc.bits.colour enc.bpp.colour enc.wtime enc.ctime enc.gtime src.numpoints},

	);

	local $" = "\t";
	#print "@out_order_cols\n";


	foreach my $line (@results) {
		print "@$line{@out_order_cols}\n";

	}


}

# config,sequence,variant,dec..dmetric.version,dec.cb-mse,dec.cb-psnr,dec.cr-mse,dec.cr-psnr,dec.d1-mse,dec.d1-psnr,dec.enc.match,dec.ext.maxrssk,dec.ext.utime,dec.framecount,dec.numpoints,dec.status,dec.utime,dec.wtime,dec.y-mse,dec.y-psnr,enc.bits,enc.bits.colour,enc.bits.geometry,enc.bpp.colour,enc.bpp.geometry,enc.ext.bits,enc.ext.maxrssk,enc.ext.utime,enc.status,enc.utime,enc.wtime,frame,src.framecount,src.numpoints
#/home/datnguyen/Projects/MPEG/tmc13-v14/cfg_attribute/octree-raht/lossless-geom-lossy-attrs/redandblack_vox10_1550/r02,loot_vox10_1000.ply,0,0.13.5,4.84124e-05,43.1504,5.32272e-05,42.7387,0,inf,ok,184164,2.59,1,784142,0 0,2.511,2.649,0.000810446,30.9128,760976,13576,746928,0.0173132,0.952542,760976,238216,5.28,0,4.72,5.356,loot_vox10_1000.ply,1,784142


