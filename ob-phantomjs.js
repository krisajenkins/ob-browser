/*jslint browser: true*/
/*global $: true, phantom: true*/
"use strict";

var page = require('webpage').create();
var system = require('system');
var filename = system.args[1];

try {
    page.onConsoleMessage = function (message) {
	console.log(message);
    };

    page.content = system.stdin.readLine();

    page.evaluate(function () {
	document.bgColor = 'white';
    });

    page.clipRect = page.evaluate(function () {
	return document.documentElement.getBoundingClientRect();
    });

    page.render(filename);
} finally {
    page.close();
}

phantom.exit();
