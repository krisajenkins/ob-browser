/*jslint browser: true*/
/*global $: true, phantom: true*/
"use strict";

var system = require('system');
var filename = system.args[1];

var page = require('webpage').create();

page.content = system.stdin.read();
page.evaluate(function () {
    document.bgColor = document.bgColor || 'white';
});
page.onConsoleMessage = console.log;

page.onLoadFinished = function (status) {
    page.clipRect = page.evaluate(function () {
	return document.documentElement.getBoundingClientRect();
    });

    page.render(filename);
    page.close();
    phantom.exit();
};
