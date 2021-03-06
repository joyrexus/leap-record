// Generated by CoffeeScript 1.6.3
(function() {
  var createWriteStream, filter, readline, ws;

  createWriteStream = require('fs').createWriteStream;

  readline = require('readline');

  ws = require('websocket-stream');

  filter = require('stream').Transform();

  filter._transform = function(data, encoding, done) {
    this.push(data + "\n");
    return done();
  };

  module.exports = function(path) {
    var prompt;
    prompt = readline.createInterface({
      input: process.stdin,
      output: process.stdout
    });
    return prompt.question('Hit return to start recording ... ', function() {
      var filename, stream, toFile;
      filename = process.argv[2] || 'sample.ldj';
      toFile = createWriteStream(filename);
      stream = ws('ws://localhost:6437');
      stream.pipe(filter).pipe(toFile);
      return prompt.question('Hit return again to stop recording ... ', function() {
        stream.end();
        prompt.close();
        console.log("Sample written to " + filename);
        return process.exit(0);
      });
    });
  };

}).call(this);
