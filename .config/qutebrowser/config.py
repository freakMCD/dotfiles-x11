import os
from urllib.request import urlopen

# load your autoconfig, use this, if the rest of your config is empty!
config.load_autoconfig()

if not os.path.exists(config.configdir / "theme.py"):
    theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
    with urlopen(theme) as themehtml:
        with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))

if os.path.exists(config.configdir / "theme.py"):
    import theme
    theme.setup(c, 'mocha', True)

c.content.user_stylesheets = ["~/.config/qutebrowser/css/catppuccin-mocha-everywhere.css"]
config.bind('<Ctrl-R>', 'config-cycle content.user_stylesheets "~/.config/qutebrowser/css/catppuccin-mocha-everywhere.css"')
                            

config.source('redirects.py')
config.source('mappings.py')

# Adblock
c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.content.blocking.adblock.lists = ['https://easylist.to/easylist/easylist.txt',
                                    'https://easylist.to/easylist/easyprivacy.txt',
                                    'https://easylist.to/easylist/fanboy-social.txt',
                                    'https://secure.fanboy.co.nz/fanboy-annoyance.txt',
                                    'https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt',
                                    'https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt',
                                    'https://www.i-dont-care-about-cookies.eu/abp/',
                                    'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt']
c.content.blocking.whitelist = [
'https://click.redditmail.com',
]

c.content.javascript.enabled = True

# Prevents *all* tabs from being loaded on restore, only loads on activating them
c.session.lazy_restore = True
c.tabs.show = "always"


c.qt.args += [  'ignore-gpu-blocklist',
                'autoplay-policy=user-gesture-require',
              'enable-features=VaapiIgnoreDriverChecks', 
             ]
c.url.searchengines = {
    "DEFAULT": "https://lite.duckduckgo.com/lite/?q={}",
    "r": "lite.duckduckgo.com/lite/?q={}%20site%3Areddit.com",
    "yt": "farside.link/invidious/search?q={}",
    "chat": "twitch.tv/popout/{}/chat?popout=",
}

