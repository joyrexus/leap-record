{createWriteStream} = require 'fs'
readline = require 'readline'
ws = require 'websocket-stream'

module.exports = (path) ->
  prompt = readline.createInterface(
    input: process.stdin
    output: process.stdout
  )

  prompt.question 'Hit return to start recording ... ', ->
    stream = ws 'ws://localhost:6437'
    filename = process.argv[2] or 'sample.ldj'
    toFile = createWriteStream filename
    stream.pipe(toFile)

    prompt.question 'Hit return again to stop recording ... ', -> 
      stream.end()
      prompt.close()
      console.log "Sample written to #{filename}"
      process.exit 0
