var fs = require('fs');

var monitor = module.exports = {
  syntax: fs.readFileSync(require('path').resolve(__dirname,'vm_stat.jison'), 'utf8'),
  oscommand: "/usr/bin/vm_stat",
  args: [ "1" ],
};


