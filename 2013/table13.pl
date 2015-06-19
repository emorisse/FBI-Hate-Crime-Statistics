#!/usr/bin/env perl
use strict;
use Spreadsheet::Read qw(row rows ReadData);
use Text::CSV;
use Data::Dumper;

my $csv = new Text::CSV;
my $dir = "Hate\ Crime\ Statistics\ 2013\ Tables/Table\ 13\ state\ cuts";
opendir T13, $dir 
	or die "cannot open directory: $!";
my @files = grep { /\.xls$/ } readdir(T13);
$csv->combine("State","Agency type","Agency name","Race","Religion","Sexual orientation","Ethnicity","Disability","Gender","Gender Identity","1st quarter","2nd quarter","3rd quarter","4th quarter","Population2");
print $csv->string, "\n";
foreach my $xls ( @files ) {
	my $state = $xls;
	$state =~ s/^Table_13_Hate_Crime_Incidents_per_Bias_Motivation_and_Quarter_//i;
	$state =~ s/_by_Agency_2013.xls$//i;
	my $wb = ReadData("$dir/$xls", "attr"=>"true");
	bless $wb;
	my $where;
	my $last;
	foreach my $row ( 9..1000 ) {
		my @row = row($wb->[1], $row);
		$where = $row[0] if ( $row[0] );
		$row[0] = $where;
		next unless ( $row[1] ); # skip totals by agency type
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
