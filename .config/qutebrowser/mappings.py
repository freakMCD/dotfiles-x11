# Key mappings
# 'Leader' key binding -- for general personal maps
leader = "<Space>"
# 'LocalLeader' key binding -- intended for 'in-page' personal maps
lleader = ","

c.hints.chars = "asdghzxcvb"
config.bind('f', 'mode-leave', mode='hint')
config.bind('e', 'mode-leave', mode='hint')

hr = 'a[href^="https"][href*='
config.set('hints.selectors', {'videos': [hr+'youtu]', hr+'clips]', hr+'gifv]', hr+'"redd.it"'],**c.hints.selectors}, pattern='*')
config.set('hints.selectors', {'videos': ['a[id*="video-title"]']}, pattern='*://*.youtube.com/*')
config.set('hints.selectors', {'videos': ['article[data-a-target*="vod"] a[data-a-target*="preview-card-image"]']}, pattern='*://*.twitch.tv/*')
config.set('hints.selectors', {'all': ['.comments, .expando-button, .reply-button, .next-button, .md-container a[href]'],
                               'button': ['.choice'],
                               'videos': [hr+'youtu]', hr+'clips]', hr+'gifv]', hr+'"redd.it"']}, pattern='*://*.reddit.com/*')

bind = {

    "gd": "open https://discord.com/channels/@me",
    "gw": "open https://web.whatsapp.com",
    "gD": "open -t https://discord.com/channels/@me",
    "gW": "open -t https://web.whatsapp.com",
	leader + "js": "config-cycle content.javascript.enabled true false",
	leader + "t": "config-cycle tabs.show switching always",
	leader + "v": "config-source ;; message-info 'qutebrowser reloaded'",
    ## mpv 
    lleader + "m": "hint videos spawn --detach mpv {hint-url} --force-window=yes",
    lleader + "M": "hint links spawn --detach mpv {hint-url} --force-window=yes",
    ";" + "m": "hint --rapid videos spawn umpv {hint-url}",
    ## hints
    "e": "hint button",
	"i": "hint --first inputs",
    "I": "hint inputs",
    ## qutebrowser mappings
	'/': 'set statusbar.show always;; cmd-set-text /',
	"/": "set statusbar.show always;; cmd-set-text /",
	"J": "tab-prev",
	"K": "tab-next",
	"j": "scroll-px 0 200",
	"k": "scroll-px 0 -200",
	"l": "scroll-px 100 0",
}
for a, b in bind.items():
    config.bind(a, b)

config.bind('o', 'set statusbar.show always;; cmd-set-text -s :open')
config.bind('O', 'set statusbar.show always;; cmd-set-text -s :open -t')
config.bind(':', 'set statusbar.show always;; cmd-set-text :')
config.bind('<Escape>', 'mode-enter normal;; set statusbar.show in-mode', mode='command')
config.bind('<Return>', 'command-accept;; set statusbar.show in-mode', mode='command')

config.unbind("q", mode="normal")

