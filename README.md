# leap-record

Record a gesture sample with your [Leap Motion](https://www.leapmotion.com) device.

![hands](hands.jpg)

You get `leap-record`, a simple command-line utility that redirects the JSON-encoded [frames](https://github.com/leapmotion/leapjs/blob/master/PROTOCOL.md#frames) emitted from [the Leap's websocket stream](https://github.com/leapmotion/leapjs/blob/master/PROTOCOL.md) to a file.  The resulting motion sample consists of [line-delimited JSON](http://en.wikipedia.org/wiki/Line_Delimited_JSON).  To indicate the nature of the formatting, you'll want to use either `.ldj` or `.ldjson` as your file extension.


## Usage

    leap-record [sample.ldj]

You'll get prompted to start and stop your recording:

    Hit return to start recording ...

After hitting return:
    
    Hit return again to stop recording ...


## Install

    npm install -g leap-record
