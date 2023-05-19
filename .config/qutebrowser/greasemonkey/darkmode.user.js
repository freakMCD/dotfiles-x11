// ==UserScript==
// @match *://*.steampowered.com/*
// @match *://*.google.com/maps/*
// ==/UserScript==

const meta = document.createElement('meta');
meta.name = "color-scheme";
meta.content = "dark light";
document.head.appendChild(meta);
