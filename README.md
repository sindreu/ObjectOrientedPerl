# Introduction

Who said Perl is old? Here is an example using Perl with Object Oriented Programming

The code implements a number calculator using a REST API and a CLI. 

It uses Perl 6, OOP, Dancer for the web API, GetOpts long for the CLI and a few other things. This is part of a quick project to test some "new" functionalities in Perl. 

# Project Structure

The code is structured in 4 files. 

- calc_cli.pl: the CLI driver
- calc_api.pl: the web api driver
- CalcCore.pm: the shared code or the main class of the app
- CalcResult.pm: return object, for both the CLI and Web API.

# Requirements
You can use a perl package manager like "pm" or use the packet manager from your OS. 

This is one way to install the requirements in Ubuntu: 
>sudo apt get install libdancer-perl libtemplate-perl libscalar-util-numeric-perl libdancer-plugin-rest-perl libjson-perl

# Command line usage

To start the Dancer webserver simply call:

./calc_api.pl

Then you can visit some URLs, which will give you valid json responses: 

http://0.0.0.0:3000/multiply/3/44

	{
	  result: "132",
	  message: "multiplication result of 3 44 = 132 ",
	  error: "0"
	}

http://0.0.0.0:3000/factorial/3

	{
	result: "6",
	message: "factorial 3! = 6 ",
	error: "0"
	}

http://0.0.0.0:3000/factorial/3sdf

	{
	result: "-1",
	message: "Error. Cannot do a factorial of 3sdf because it is not a non-negative integer ",
	error: "1"
	}

http://0.0.0.0:3000/divide/3/0

	{
	result: "",
	message: "Error. Not even us can divide by 0 (3 / 0) ",
	error: "1"
	}

http://0.0.0.0:3000/add/3/3

	{
	result: "6",
	message: "add result of 3 3 = 6 ",
	error: "0"
	}

The field error indicates if an error occurred and the message field adds a human touch to its interface. 

# Command Line usage 


To run calc_cli.pl just make sure it is executable 
chmod +x calc_api.pl

./calc_api.pl -h 

	Options: 
	
	-h 
	print help
	
	-t 
	 basic tests
	 
	-add [float] -add [float] ... 
	 add several floats
	 
	-multiply [float] -multiply [float] ... 
	 multiply several floats
	 
	-substract1 [float] -substract2 [float]
	 substract1-substract2 floats
	 
	-divide1 [float] -divide2 [float]
	 divide1/divide2 floats
	 
	-factorial [integer]
	 factorial integer!

Try calc_api.pl -t to run some tests. Results are not checked with a testing library just to make this test a bit shorter but they would obviously be if it was done through a normal job. 

The app is preventing some apps to receive incorrectly strings, and other invalid parameters (such as a float when expecting a natural number)

./calc_cli.pl -t 

	add result of 2 = 2
	add result of 2 3 = 5
	add result of 2 3 3 4 = 12
	error: substraction of : we only can substract two numbers.
	error: substraction of 2: we only can substract two numbers.
	substraction result of 2 3 = -1
	error: substraction of 2 3 3 4: we only can substract two numbers.
	multiplication result of 2 3 3 4 = 72
	division result 2 / 3 = 0.666666666666667
	error: Not even us can divide by 0 (2 / 0)
	error: Not even us can divide by 0 (2 / )
	error: Cannot do a factorial of -2 because it is not a non-negative integer
	factorial 5! = 120
	error: Cannot do a factorial of 5.3 because it is not a non-negative integer
	factorial 0! = 1
	add result of saf-2 = 0


Since it is using GetOpts long some parameters allow a variable number of arguments:

./calc_cli.pl -a 3 -a 3 -add 5

	add result of 3 3 5 = 11

./calc_cli.pl -f 3

	 factorial 3! = 6

Give a try to test the rest of the options described in help. 



