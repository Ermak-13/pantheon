/*
Phantomjs is required.

Usage:
phantomjs screenshot.js 'http://www.google.com' '~/google.png'
*/

var page = require('webpage').create(),
  system = require('system');

var siteUrl = system.args[1],
  imagePath = system.args[2];

page.open(siteUrl, function () {
  page.render(imagePath);
  phantom.exit();
});
