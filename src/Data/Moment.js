/* global exports */
"use strict";

// module Data.Moment

var moment = require('moment');

exports.now = function () {
  return moment();
};

exports.invalid = function () {
  return moment.invalid();
};