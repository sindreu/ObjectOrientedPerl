#!/usr/bin/perl

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
   # responsible for print in the CLI app
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
   # responsible for printing for the Web API
   # this should be done using JSON library, but for this test I think it serves its purpose

   my( $self ) = @_;
   my $result = '{ "result": "'.$self->{_result}.'", "message": "'.$self->{_message}.'", "error": "'.$self->{_error}.'"}';
   return $result;
}

1;
