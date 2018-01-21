#!/usr/bin/env perl
# Main driver for the Web API. 
# It uses json as a response format
# Each end-point only takes 1 or two parameters, but most operations could easily be enhanced
# to receive multiple parameters


use CalcCore;
use CalcResult;

use Dancer;
use Dancer::Plugin::REST;


get '/factorial/:name' => sub {
   return factorial(params->{name})->json();
};

get '/add/:num_a/:num_b' => sub {
    return add(params->{num_a}, params->{num_b})->json();
};

get '/divide/:num_a/:num_b' => sub {
    return divide(params->{num_a}, params->{num_b})->json();
};

get '/substract/:num_a/:num_b' => sub {
    return substract(params->{num_a}, params->{num_b})->json();
};

get '/multiply/:num_a/:num_b' => sub {
    return multiply(params->{num_a}, params->{num_b})->json();
};

# start the webserver
dance;
