#! /usr/bin/perl
use strict;
my $usage="waitok.pl <url1, e.g. 0.test.frontend.gws.lezhao.vh-q.borg.google.com> [url2 ...]\n";

my @urls=();
while(my $u = shift){
 push @urls, $u;
}
push @urls, "0.test.frontend.gws.lezhao.vh-q.borg.google.com" if scalar @urls == 0;
waitOk(\@urls);

sub waitOk{
 my $a=shift;
 autoflush STDOUT 1;
 print "********\nINFO: Waiting for ", join ", ", @$a, " to start.\n";
 my $counter=0;
 while(1){
  last if checkOk($a);
  print ".";
  $counter++;
  print " should be up by now " if $counter == 34;
  sleep 10;
 }
 my $quant = "All ";$quant="Both " if scalar @$a == 2;$quant="" if scalar @$a==1;
 my $plural="s"; $plural="" if scalar @$a<=1;
 print scalar $quant,scalar @$a, " job$plural up!\n";
}
sub checkOk{
 my $a=shift;
 my $health=1;
 for(my $i=0;$i<scalar @$a;$i++){
  if(!healthok(@$a[$i])){
   $health=0;
   last;
  }
 }
 return $health;
}
sub healthok{
 my $a=shift;
 my $cmd="rpcget -deadline 10 $a/healthz 2> /dev/null";
 my $c=`$cmd`;chomp $c;
 return $c eq "ok";#==0;
}

