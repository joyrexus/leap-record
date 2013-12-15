{createWriteStream} = require 'fs'
readline = require 'readline'

ws = require 'websocket-stream'
filter = require 'filter/hands'

module.exports = (path) ->
  prompt = readline.createInterface(
    input: process.stdin
    output: process.stdout
  )

  prompt.question 'Hit return to start recording ... ', ->
    stream = ws 'ws://localhost:6437'
    toFile = createWriteStream(process.argv[2] or 'sample.json.lsv')

    stream
      .pipe(filter)
      .pipe(toFile)

    prompt.question 'Hit return again to stop recording ... ', -> 
      stream.end()
      prompt.close()
