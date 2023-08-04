# Key mappings
# 'Leader' key binding -- for general personal maps
leader = "<Space>"
# 'LocalLeader' key binding -- intended for 'in-page' personal maps
lleader = ","

c.hints.chars = "asdghjkl"
config.bind('f', 'mode-leave', mode='hint')

config.set('hints.selectors', {'videos': ['a[href]'],**c.hints.selectors}, pattern='*')
config.set('hints.selectors', {'videos': ['ytd-thumbnail > #thumbnail']}, pattern='*://*.youtube.com/*')
config.set('hints.selectors', \
        {'all':      ['.choice, .next-button, .reply-button, .comments, [rel="nofollow"]:not([data-event-action])'], \
            'videos':   ['a[href*="youtu"]:not([href*="domain"]), a[href*=".gifv"]'], \
            'expando':  ['.expando-button'], }, pattern='*://*.reddit.com/*')
config.set('hints.selectors', {'all': ['.nav-main-link.nav-compact.pointer-enabled']}, pattern='*://melvoridle.com/*')

bind = {
	leader + "js": "config-cycle content.javascript.enabled true false",
	leader + "t": "config-cycle tabs.show switching always",
	leader + "v": "config-source ;; message-info 'qutebrowser reloaded'",

    lleader + "m": "hint videos userscript qutebrowser-mpv",
    ";" + "m": "hint --rapid videos spawn umpv {hint-url}",
    lleader + "M": "spawn mpv {url}",
    "e": "hint expando",
    "<Alt+e>": "hint rddt-comments",

	'/': 'set statusbar.show always;; set-cmd-text /',
	"/": "set statusbar.show always;; set-cmd-text /",
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

config.bind('o', 'set statusbar.show always;; set-cmd-text -s :open')
config.bind('O', 'set statusbar.show always;; set-cmd-text -s :open -t')
config.bind(':', 'set statusbar.show always;; set-cmd-text :')
config.bind('<Escape>', 'mode-enter normal;; set statusbar.show in-mode', mode='command')
config.bind('<Return>', 'command-accept;; set statusbar.show in-mode', mode='command')

config.unbind("q", mode="normal")
