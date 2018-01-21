Who said Perl is old? Here is an example using Perl with Object Oriented Programming

# General README

The code is structured in 4 files. 

calc_cli.pl - the CLI driver
calc_api.pl - the web api driver
CalcCore.pm - the shared code or the kernel of the app
CalcResult.pm - class used for the return of the functions and representing the display of both CLI and Web API.

# requirements
You can use a perl package manager like pm. In my case I used ubuntu's repository, just because it is what I found faster. 

# to install the packages in ubuntu
sudo apt get install libdancer-perl libtemplate-perl libscalar-util-numeric-perl libdancer-plugin-rest-perl libjson-perl

Please see README_cli.txt for the CLI app
Please see README_api.txt for the web app

Notice that there are obviously a lot of improvements, but for a hiring test I wanted to keep it under the 2-3 hours work. 

There are some error checking such as invalid numbers, division by 0, factorial of a non-positive integer, addition of multiple number of floats, and some others. 


