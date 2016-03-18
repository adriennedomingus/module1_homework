var min = function(numOne, numTwo) {
  if (numOne > numTwo) {
    return numTwo;
  }
  return numOne;
}

var recursiveEven = function(number) {
  if (number < 1) {
    number = number * -1
  }
  if (number === 0) {
    return true;
  } else if (number === 1 ) {
    return false;
  } else if (number > 1) {
    return recursiveEven(number - 2);
  }
}

var countChar = function(string, character) {
  var counter = 0
  for (var i = 0; i < string.length; i++) {
    if (string.charAt(i) === character) {
      counter++
    }
  }
  return counter
}

var countBs = function(string) {
  return countChar(string, "B")
}
