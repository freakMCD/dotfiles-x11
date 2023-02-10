// ==UserScript==
// @name          Remove Background Image
// @namespace     http://www.unixdaemon.net/gmscripts/
// @description   Remove any background images.
// @match       http://hbpms.blogspot.com/*
// ==/UserScript==

(function() {
  document.body.style.backgroundImage = "none";
})();
