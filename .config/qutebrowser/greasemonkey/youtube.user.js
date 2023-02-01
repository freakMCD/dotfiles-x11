// ==UserScript==
// @name         reddit to teddit
// @namespace    https://gist.github.com/bitraid/d1901de54382532a03b9b22a207f0417
// @version      1.0
// @description  youtube to yewtu.be
// @match 			 *://*.youtube.com/results*
// @grant        none
// @run-at       document-start
// ==/UserScript==

(function () {
	'use strict';
	top.location.hostname = "inv.riverside.rocks";
})();
