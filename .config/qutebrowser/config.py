
config.load_autoconfig()
c.content.blocking.adblock.lists = ['https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt', 'https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt', 'https://www.i-dont-care-about-cookies.eu/abp/', 'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt']

config.bind (',y2o', 'open https://invidious.baczek.me{url:path}?{url:query}')
config.bind('/', 'set statusbar.show always;; set-cmd-text /')
config.bind('<Escape>', 'mode-enter normal;; set statusbar.show in-mode', mode='command')
config.bind('<Return>', 'command-accept;; set statusbar.show in-mode', mode='command')
config.bind('xx', 'config-cycle tabs.show switching always')

config.source('theme.py')
config.source('redirects.py')
