const assert = require('assert');
const LinkedList = require('../');

describe('LinkedList', function() {
  it('should exist', function(){
    assert(LinkedList);
  });

  it('should be a function', function(){
    assert.strictEqual(typeof LinkedList, 'function');
  });
});
