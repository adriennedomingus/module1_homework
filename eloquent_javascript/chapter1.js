var string = ""
for (var i = 1; string.length < 7; i++) {
  string = string + "#"
  console.log(string);
}

for(var i = 1; i < 101; i++) {
  if (i % 3 === 0 && i % 5 === 0) {
    console.log("FizzBuzz");
  } else if (i % 3 === 0) {
    console.log("Fizz");
  } else if (i % 5 === 0) {
    console.log("Buzz");
  } else {
    console.log(i)
  }
}

var row = ["#", " ", "#", " ", "#", " ", "#", " ", "\n", " ", "#", " ", "#", " ", "#", " ", "# "]
var twoRows = row.join("")
var board = twoRows + "\n" + twoRows + "\n" + twoRows + "\n" + twoRows
console.log(board)
