var range = function(start, end) {
  var range = []
  for( var i = arguments[0]; i <= arguments[1]; i++) {
    range.push(i)
  }
  return range
}

var sum = function(range) {
  var total = 0
  for (var i = 0; i < range.length; i++) {
    total += range[i]
  }
  return total
}
function reverseArray(array) {
  newArray = []
  while(array.length > 0) {
    newArray.push(array.pop());
  }
  return newArray
}
