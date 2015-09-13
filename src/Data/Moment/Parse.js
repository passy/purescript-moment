/* global exports */
"use strict";

// module Data.Moment.Parse

var moment = require('moment');

exports.parseUnix_ = function (u) {
  return moment.unix(u);
};

exports.parseString_ = function (Nothing, Just, strict, fs, s) {
  var m = moment(s, fs, strict);
  return m.isValid() ? Just(m) : Nothing;
};

exports.unsafeToMoment = function (e) {
  return moment(e);
};
