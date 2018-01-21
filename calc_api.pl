#!/usr/bin/env perl


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

dance;
