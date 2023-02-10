// ==UserScript==
// @match *://*.steampowered.com/*
// @match *://web.whatsapp.com/
// @match *://masterychart.com/*
// ==/UserScript==

const meta = document.createElement('meta');
meta.name = "color-scheme";
meta.content = "dark light";
document.head.appendChild(meta);
