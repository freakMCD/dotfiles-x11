# load additional settings configured via autoconfig.yml
config.load_autoconfig()

c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.content.blocking.adblock.lists = ['https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt', 'https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt', 'https://www.i-dont-care-about-cookies.eu/abp/', 'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt']
c.content.blocking.whitelist = [
'https://click.redditmail.com',
]

c.content.javascript.enabled = False
js_whitelist = [
    "*://*.youtube.com/*",
    "*://127.0.0.1/*",
    "*://calendar.google.com/*",
    "*://deepl.com/*",
    "*://duckduckgo.com/*",
    "*://fosstodon.org/*",
    "*://github.com/*",
    "*://gitlab.com/*",
    "*://localhost/*",
    "*://*.google.com/*",
    "*://*.reddit.com/*",
    "*://translate.google.com/*",
    "*://*.stackexchange.com/*",
    "*://*.qwant.com/*",
    "chrome://*/*",
    "file://*",
    "qute://*/*",
]
for page in js_whitelist:
    with config.pattern(page) as p:
        p.content.javascript.enabled = True

# Prevents *all* tabs from being loaded on restore, only loads on activating them
c.session.lazy_restore = True
config.source('theme.py')
config.source('redirects.py')
config.source('maps.py')

#c.qt.args = ["disable-gpu"]

c.url.searchengines = {
    "DEFAULT": "https://lite.duckduckgo.com/lite/?q={}",
    "al": "https://wiki.archlinux.org/?search={}", 
    "g": "https://www.google.com/search?q={}",
    "gh": "https://github.com/search?q={}",
    "map": "https://www.google.com/maps/search/?api=1&query={}",
    "yt": "farside.link/invidious/search?q={}",
    "r": "reddit.com/r/{}",
    "R": "https://lite.duckduckgo.com/lite/?q={}%20site%3Areddit.com",
    "wm": "https://wiki.melvoridle.com/index.php?search={}",
    "rm": "https://lite.duckduckgo.com/lite/?q={}%20site%3Areddit.com/r/melvoridle",
}
