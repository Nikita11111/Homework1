package SecretSanta;

use 5.010;
use strict;
use warnings;
use DDP;

sub calculate {
	my @members = @_;
	my @res;
	my %hash = ();
	my %hash1 = ();
	my %pary = ();
	my $shcet = 0;
	my $uspex;

	for my $var (@members) {
   		 if (ref $var) {
       			 $hash1{ $shcet } = $var->[0];
       			 $hash1{ $shcet + 1} = $var->[1];
       			 $pary{ $shcet } = $var;
       			 $pary{ $shcet + 1} = $var;
       			 $shcet += 2;  }
   		 else {
       			 $hash1{ $shcet } = "$var";
      			 $shcet++;  }
   				 }
	my $i;
        my $b;
until ($uspex) {
    $i = 0;
    $uspex = 1;
    %hash = %hash1;
    @res = ();
    while (keys(%hash) - 1) {
        $b =int rand($shcet); 
        if (($i != $b) && ((!exists $pary{$b}) || ($pary{$i} ne $pary{$b})) && (exists $hash{$b}))  {  
       	 push @res,[$hash{$i}, $hash{$b}];
       	 delete $hash{$i};
       	 $i = $b;}
        else { 
            if ((keys(%hash) == 2) && (exists $pary{$b}) && ($pary{$i} eq $pary{$b}) && ($i != $b)) { 
                $uspex = 0;
                last;    }
              } }

	if ((!exists $pary{0}) || ($pary{0} != $pary{$i}) && ($uspex)) {
   	 push @res, [$hash{$i}, $hash1{0}]; 
			}
	else { $uspex = 0};

 }    
    

	return @res;
}

1;
