#!/usr/bin/env perl
use strict;
use Spreadsheet::Read qw(row rows ReadData);
use Text::CSV;
use Data::Dumper;

my $csv = new Text::CSV;
my $dir = "Hate\ Crime\ Statistics\ 2013\ Tables/Table\ 14\ state\ cuts";
opendir T14, $dir 
	or die "cannot open directory: $!";
my @files = grep { /\.xls$/ } readdir(T14);
$csv->combine("State","Agency Type","Agency Name","Q1","Q2","Q3","Q4","Population");
print $csv->string, "\n";
foreach my $xls ( @files ) {
	my $state = $xls;
	$state =~ s/^Table_14_Hate_Crime_Zero_Data_Submitted_per_Quarter_by_//;
	$state =~ s/_by_Agency_2013.xls$//;
	my $wb = ReadData("$dir/$xls", "attr"=>"true");
	bless $wb;
	my $where;
	my $last;
	foreach my $row ( 8..1000 ) {
		my @row = row($wb->[1], $row);
		last unless ( $row[1] );
		$where = $row[0] if ( $row[0] );
		$row[0] = $where;
		if ( $row[1] =~ /:$/ ) {
			$last = $row[1];
			next;
		}
		if ($wb->[1]{"attr"}[2][$row]{"halign"} eq "left") {
			$row[1] = $last . " " . $row[1];
		}
		$csv->combine($state,@row);
		print $csv->string, "\n";
	}
}
