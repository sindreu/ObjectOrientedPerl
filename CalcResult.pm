#!/usr/bin/perl

# This is a ResponseClass used for both the CLI and Web API

package CalcResult;

sub new
{
   my $class = shift;
   my $self = {
      _result => shift,    # the result of the calcuation
      _message  => shift,  # Human message for the consumer  
      _error       => shift, # boolean to know if there was an error. 
   };

   return bless $self, $class;   
}

sub print_CLI {
   # responsible to print in the CLI app
   my( $self ) = @_;
   if ($self->{_error})
   {
     print STDERR $self->{_message};
   }
   else {
     print $self->{_message};
   }
}

sub print_json {
   # responsible to print in the Web API
   # this should be done using JSON library for easier mantainance

   my( $self ) = @_;
   my $result = '{ "result": "'.$self->{_result}.'", "message": "'.$self->{_message}.'", "error": "'.$self->{_error}.'"}';
   return $result;
}

1;
