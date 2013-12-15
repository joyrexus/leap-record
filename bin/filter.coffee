#!/usr/bin/env coffee 
thru = require 'through'
split = require 'split'


transform = (data) ->
    if data.id
      d =                               # queue attributes of interest
        id: data.id
        hands: data.hands


filter = (->

  write = (data) -> 
      data = transform data             
      @queue JSON.stringify(data) + "\n" if data

  end = -> @queue null                  # append EOF string if desired

  thru(write, end)

)()


process.stdin
  .pipe(split(JSON.parse))
  .pipe(filter)
  .pipe(process.stdout)
