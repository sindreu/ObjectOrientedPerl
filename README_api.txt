
# to run simply call 

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
message: "error: Cannot do a factorial of 3sdf because it is not a non-negative integer ",
error: "1"
}

http://0.0.0.0:3000/divide/3/0

{
result: "",
message: "error: Not even us can divide by 0 (3 / 0) ",
error: "1"
}

http://0.0.0.0:3000/add/3/3

{
result: "6",
message: "add result of 3 3 = 6 ",
error: "0"
}

JSON was chosen as a modern, succint approach for web APIs. The field error indicates if an error occurred, and message adds a human touch to its interface. There was no customization of 404 pages, or intensive checking of error 500 possibilities, which would be done in a real scenario. 

