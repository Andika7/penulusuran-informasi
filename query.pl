use strict;
use Data::Dumper;

# file.pl index.file query queryNext ...

my $indexFile=`cat $ARGV[0]`;
my %index;

for my $lines(split "\n",$indexFile){
	my @line=split " ",$lines;
	my @list;
	for my $col (@line[1 .. $#line]){
		my @dataCol=split ':',$col;
		my %doc=(
			'doc'=> $dataCol[0],
			'score'=> $dataCol[1]
		);
		push @list,\%doc;
	}
	$index{$line[0]}=\@list;

}

print Dumper(\%index{$ARGV[1]});

# my @docRank;
# my $counter=0;
# foreach my $a(@ARGV[1.. $#ARGV]) {
# 	# print Dumper(\%index{$a});
# 	foreach my $data($index{$a}){
# 		print ${@{$data}[0]}{'score'}."\n";
# 	}
# 	$counter++;
# }