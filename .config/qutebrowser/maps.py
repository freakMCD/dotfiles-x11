# Key mappings
# 'Leader' key binding -- for general personal maps
leader = "<Space>"
# 'LocalLeader' key binding -- intended for 'in-page' personal maps
lleader = ","

config.bind(leader + "tt", 'config-cycle tabs.show switching always')
config.bind(lleader + "m", "hint links spawn --detach mpv {hint-url}")
config.bind(lleader + "M", "spawn --detach mpv {url}")

config.bind(leader + "js", "config-cycle content.javascript.enabled true false")
config.bind(leader + "VV", "config-source")

config.bind('/', 'set statusbar.show always;; set-cmd-text /')
config.bind('<Escape>', 'mode-enter normal;; set statusbar.show in-mode', mode='command')
config.bind('<Return>', 'command-accept;; set statusbar.show in-mode', mode='command')

config.bind("/", "set statusbar.show always;; set-cmd-text /")
config.bind("J", "tab-next")
config.bind("K", "tab-prev")
config.bind("h", "scroll-px -100 0")
config.bind("j", "scroll-px 0 200")
config.bind("k", "scroll-px 0 -200")
config.bind("l", "scroll-px 100 0")
config.bind("i", "hint inputs")
config.unbind("q", mode="normal")


