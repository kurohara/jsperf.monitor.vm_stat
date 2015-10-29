/**
 * jsperf.monitor.vm_stat.js
 * Monitor module of jsperf for 'vm_stat' command.
 * This module is for The 'vm_stat' command for 'macosx'.
 *
 * Copyright(C) 2015 Hiroyoshi Kurohara(Microgadget,inc.) all rights reserved.
 */

'use strict';

var fs = require('fs');

var Monitor = function Monitor(params) {
  this.args = [ "" + params.interval ];
  this.dataname = "vm_stat";
  this.syntax = fs.readFileSync(__dirname + '/vm_stat.jison', 'utf8');
}

module.exports = Monitor;
