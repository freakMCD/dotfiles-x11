# load additional settings configured via autoconfig.yml
config.load_autoconfig()

c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.content.blocking.adblock.lists = ['https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt', 'https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt', 'https://www.i-dont-care-about-cookies.eu/abp/', 'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt']
c.content.blocking.whitelist = [
'https://click.redditmail.com',
]

c.content.javascript.enabled = True

# Prevents *all* tabs from being loaded on restore, only loads on activating them
c.session.lazy_restore = True
config.source('theme.py')
config.source('redirects.py')
config.source('maps.py')

c.qt.args += ['enable-accelerated-video-decode',
             'enable-gpu-rasterization',
             'ignore-gpu-blacklist',
             'enable-quic',
]

c.url.searchengines = {
    "DEFAULT": "https://lite.duckduckgo.com/lite/?q={}",
    "al": "https://wiki.archlinux.org/?search={}", 
    "gh": "https://github.com/search?q={}",
    "yt": "farside.link/invidious/search?q={}",
    "r": "https://lite.duckduckgo.com/lite/?q={}%20site%3Areddit.com",
}
