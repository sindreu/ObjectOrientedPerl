#!/usr/bin/env perl
# Main driver for the CLI version of the program
# Uses GetOpts which makes the hard work of the help and option parsing through Command Line

use CalcCore;

sub test {
   # general test function, it should check the responses, but for this simple code should be enough.  
   add(2)->print_CLI();
   add(2,3)->print_CLI();
   add(2,3,3,4)->print_CLI();
   substract()->print_CLI();
   substract(2)->print_CLI();
   substract(2,3)->print_CLI();
   substract(2,3,3,4)->print_CLI();
   multiply(2,3,3,4)->print_CLI();
   divide(2,3)->print_CLI();
   divide(2,0)->print_CLI();
   divide(2)->print_CLI();
   factorial(-2)->print_CLI();
   factorial(5)->print_CLI();
   factorial(5.3)->print_CLI();
   factorial(0)->print_CLI();
   add("saf-2")->print_CLI();
}

sub help {
  # Description of all options available in the program
  print "Options: \n\n";
  print "-h \nprint help\n\n";
  print "-t \n basic tests\n\n";
  print "-add [float] -add [float] ... \n add several floats\n\n";
  print "-multiply [float] -multiply [float] ... \n multiply several floats\n\n";
  print "-substract1 [float] -substract2 [float]\n substract1-substract2 floats\n\n";
  print "-divide1 [float] -divide2 [float]\n divide1/divide2 floats\n\n";
  print "-factorial [integer]\n factorial integer!\n\n";
}



GetOptions("h"=>\$help,
           "t"=>\$test,
            "add=f@"=>\@add,
            "multiply=f@"=>\@multiply,
            "substract1=f"=>\$substract1,
            "substract2=f"=>\$substract2,
            "divide1=f"=>\$divide1,
            "divide2=f"=>\$divide2,
            "factorial=i"=>\$factorial);

# Run all options that were introduced in the CLI
help() if $help;
test() if $test;
add(@add)->print_CLI() if @add;
multiply(@multiply)->print_CLI() if $multiply;
substract($substract1,$substract2)->print_CLI() if $substract1 && $substract2;
divide($divide1, $divide2)->print_CLI() if $divide1 && $divide2;
factorial($factorial)->print_CLI() if $factorial;

print "Unrecognized option(s)\n" if $ARGV[0];
foreach (@ARGV) {
  print "$_\n";
}
 
