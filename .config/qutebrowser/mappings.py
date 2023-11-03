# Key mappings
# 'Leader' key binding -- for general personal maps
leader = "<Space>"
# 'LocalLeader' key binding -- intended for 'in-page' personal maps
lleader = ","

c.hints.chars = "asdghzxcvb"
config.bind('f', 'mode-leave', mode='hint')
config.bind('e', 'mode-leave', mode='hint')

config.set('hints.selectors', {'videos': ['a[href*="youtu"], a[href*=".gifv"]'],**c.hints.selectors}, pattern='*')
config.set('hints.selectors', {'videos': ['#video-title']}, pattern='*://*.youtube.com/*')
config.set('hints.selectors', {'videos': ['a[data-a-target*="preview-card-image"]']}, pattern='*://*.twitch.tv/*')

bind = {
	leader + "js": "config-cycle content.javascript.enabled true false",
	leader + "t": "config-cycle tabs.show switching always",
	leader + "v": "config-source ;; message-info 'qutebrowser reloaded'",

    ## mpv 
    lleader + "m": "hint videos userscript qutebrowser-mpv",
    ";" + "m": "hint --rapid videos spawn umpv {hint-url}",
    lleader + "M": "spawn mpv {url}",
    lleader + "v": "hint videos spawn --detach mpv {hint-url} --loop-playlist",

    ## Custom Selectors
	'/': 'set statusbar.show always;; cmd-set-text /',
	"/": "set statusbar.show always;; cmd-set-text /",
	"J": "tab-next",
	"K": "tab-prev",
	"h": "scroll-px -100 0",
	"j": "scroll-px 0 200",
	"k": "scroll-px 0 -200",
	"l": "scroll-px 100 0",

    ## hints
	"i": "hint --first inputs",
    "I": "hint inputs",
}
for a, b in bind.items():
    config.bind(a, b)

config.bind('o', 'set statusbar.show always;; cmd-set-text -s :open')
config.bind('O', 'set statusbar.show always;; cmd-set-text -s :open -t')
config.bind(':', 'set statusbar.show always;; cmd-set-text :')
config.bind('<Escape>', 'mode-enter normal;; set statusbar.show in-mode', mode='command')
config.bind('<Return>', 'command-accept;; set statusbar.show in-mode', mode='command')

config.unbind("q", mode="normal")

