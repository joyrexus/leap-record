#!/usr/bin/env coffee
path = require('path').dirname(__filename) 
require(path + "/../index")(process.argv[2])
