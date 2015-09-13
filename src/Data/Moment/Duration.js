/* global exports */
"use strict";

// module Data.Moment.Duration

var moment = require('moment');

exports.durToMDurImpl = function durToMDurImpl (n, s) {
  return moment.duration(n, s);
};
