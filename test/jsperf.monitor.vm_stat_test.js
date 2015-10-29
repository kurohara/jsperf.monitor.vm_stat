'use strict';

var jsperf_monitor_vm_stat = require('../jsperf.monitor.vm_stat.js');
var jsperf = require('jsperf');
var fs = require('fs');

/*
  ======== A Handy Little Nodeunit Reference ========
  https://github.com/caolan/nodeunit

  Test methods:
    test.expect(numAssertions)
    test.done()
  Test assertions:
    test.ok(value, [message])
    test.equal(actual, expected, [message])
    test.notEqual(actual, expected, [message])
    test.deepEqual(actual, expected, [message])
    test.notDeepEqual(actual, expected, [message])
    test.strictEqual(actual, expected, [message])
    test.notStrictEqual(actual, expected, [message])
    test.throws(block, [error], [message])
    test.doesNotThrow(block, [error], [message])
    test.ifError(value)
*/

exports['awesome'] = {
  setUp: function(done) {
    // setup here
    done();
  },
  'no args': function(test) {
    test.expect(1);
    // tests here
    var controller = new jsperf.Controller(jsperf_monitor_vm_stat);
    var indata = fs.readFileSync(__dirname + '/out.txt', 'utf8');
    controller._processdata(indata);
    controller._processclose();
    test.ok(true);
    test.done();
  },
};
