

# To run calc_cli.pl just make sure it is executable 
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

# Try calc_api.pl -t to run some tests. Results are not checked with a testing library just to make this test a bit shorter but they would obviously be if it was done through a normal job. 
# In my tests I am preventing some apps to receive incorrectly strings, and other invalid parameters (such as a float when expecting a natural number)

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


# Since it is using GetOpts long some parameters allow a variable number of arguments. 
./calc_cli.pl -a 3 -a 3 -add 5
>add result of 3 3 5 = 11

./calc_cli.pl -f 3
> factorial 3! = 6

Give a try to rest of the options described in help. 


