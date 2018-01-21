#!/usr/bin/env perl
# Main code with the implementation of the operations. 
# It is not using directly OOP but it is using an Object CalcResult which it is.

use Scalar::Util::Numeric qw(isint);
use Scalar::Util qw(looks_like_number);
use Getopt::Long;
use CalcResult;

sub add {
   # adds a variable number of numbers and checks for errors. 
   # returns an object CalcResult, containing a json, the result, human message and error code 

   my $n = scalar(@_);
   my $sum = 0, $error = 0;

   foreach my $item (@_){
      if (looks_like_number($item)){
        $sum += $item;
      }
      else {
        $error = 1;
      }
   }

  $result = CalcResult->new($sum, "add result of @_ = $sum\n", $error);

  return $result;
}


sub multiply {
   # multiplies a variable number of numbers. 
   # returns an object CalcResult, containing a json, the result, human message and error code 

   my $n = scalar(@_);
   my $multiplication = 1, $error=0;

   foreach my $item (@_){
      if (looks_like_number($item)){
        $multiplication *= $item;
      }
      else {
        $error = 1;
      }
   }

  $result = CalcResult->new($multiplication, "multiplication result of @_ = $multiplication\n", $error);
  return $result;
}


sub factorial {
   # Returns the factorial of an integer, and checks for other errors. 
   # returns an object CalcResult, containing a json, the result, human message and error code 

   # Factorial could use multiply
   my $n = $_[0];
   my $message="", $fact=1, $error=0;

   if ( isint($n) && $n >= 0 )
   {
     for( my $i = 1; $i <= $n ; $i=$i+1 ){
        $fact *= $i;
     } 
     $message = "factorial $n! = $fact\n";
   }
   else {
     $fact = -1;
     $message = "error: Cannot do a factorial of $n because it is not a non-negative integer\n";
     $error = 1;
   }
   $result = CalcResult->new($fact, $message, $error);
   return $result;
}


sub substract {
   # substracts only two numbers. Could actually reuse add if we wanted.
   # returns an object CalcResult, containing a json, the result, human message and error code 

   my $n = scalar(@_);
   my $message, $substraction, $error;

   if ($n == 2 && looks_like_number($_[0]) && looks_like_number($_[1]))
   {
     my $a = $_[0];
     my $b = $_[1];

     $substraction = $a - $b;

     $message = "substraction result of @_ = $substraction\n";
  }
  else 
  { 
     $message = "error: substraction of @_: we only can substract two numbers.\n";
     $error = 1;
  }

  $result = CalcResult->new($substraction, $message, $error);
  return $result;
}


sub divide {
   # Divide a / b
   # avoid division by 0 
   my $message, $division, $error;
   my $a = $_[0];
   my $b = $_[1];

   if ($b != 0 ){
      $division = $a / $b;
      $message = "division result $a / $b = $division\n"; 
   }
   else {
      $message = "error: Not even us can divide by 0 ($a / $b)\n";
   }

   $result = CalcResult->new($division, $message, $error);
   return $result;
}


1;
