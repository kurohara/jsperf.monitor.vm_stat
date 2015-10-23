/**
 * jsperf.monitor.vm_stat.js
 * Monitor module of jsperf for 'vm_stat' command.
 * This module is for The 'vm_stat' command for 'macosx'.
 *
 * Copyright(C) 2015 Hiroyoshi Kurohara(Microgadget,inc.) all rights reserved.
 */

var fs = require('fs');

var monitor = module.exports = {
  syntax: fs.readFileSync(require('path').resolve(__dirname,'vm_stat.jison'), 'utf8'),
  oscommand: "/usr/bin/vm_stat",
  args: [ "1" ],
  dataname: "vm_stat",
};


