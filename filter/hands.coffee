thru = require 'through'

module.exports = (->
  start = null                            # starting timestamp

  write = (data) ->                       # write callback for thru
    if data
      data = JSON.parse(data)
      if data.id
        start = data.timestamp if not start
        d =                               # get attributes of interest
          id: data.id
          time: data.timestamp - start
          hands: data.hands
        @queue JSON.stringify(d) + '\n'   # queue your filtered data

  end = -> @queue null                    # append EOF string if desired

  thru(write, end)
)()
