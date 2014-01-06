{createWriteStream} = require 'fs'
readline = require 'readline'
ws = require 'websocket-stream'

filter = require('stream').Transform()

filter._transform = (data, encoding, done) ->
  @push data + "\n"   # append newline delimiter
  done()

module.exports = (path) ->
  prompt = readline.createInterface(
    input: process.stdin
    output: process.stdout
  )

  prompt.question 'Hit return to start recording ... ', ->
    filename = process.argv[2] or 'sample.ldj'
    toFile = createWriteStream filename
    stream = ws 'ws://localhost:6437'
    stream
      .pipe(filter)
      .pipe(toFile)

    prompt.question 'Hit return again to stop recording ... ', -> 
      stream.end()
      prompt.close()
      console.log "Sample written to #{filename}"
      process.exit 0
