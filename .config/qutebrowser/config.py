import subprocess

config.load_autoconfig()

c.content.blocking.adblock.lists = ['https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt', 'https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt', 'https://www.i-dont-care-about-cookies.eu/abp/', 'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt']

def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xresources = read_xresources('*')
clrbg = xresources['*.background']
clrselect = xresources['*.color10']
clrfg = xresources['*.color15']
clrhl = xresources['*.color5']

#Colors
c.colors.completion.category.bg = f"qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 {clrselect}, stop:1 {clrbg})"
c.colors.completion.item.selected.bg = clrhl
c.colors.completion.item.selected.border.bottom = clrbg 
c.colors.completion.item.selected.border.top = clrbg

c.colors.hints.bg = clrhl
c.colors.messages.error.bg = xresources['*.color1']
c.colors.statusbar.normal.bg = clrbg

c.colors.tabs.even.bg = clrbg
c.colors.tabs.even.fg = clrfg
c.colors.tabs.odd.bg = clrbg 
c.colors.tabs.odd.fg = clrfg
c.colors.tabs.pinned.selected.even.bg = clrselect
c.colors.tabs.pinned.selected.odd.bg = clrselect
c.colors.tabs.selected.even.bg = clrselect
c.colors.tabs.selected.even.fg = clrbg
c.colors.tabs.selected.odd.bg = clrselect
c.colors.tabs.selected.odd.fg = clrbg 

c.colors.webpage.bg = "#101010"

c.colors.contextmenu.disabled.fg = xresources['*.color8']
c.colors.contextmenu.menu.bg = clrbg
c.colors.contextmenu.menu.fg = clrfg
c.colors.contextmenu.selected.bg = clrselect
c.colors.contextmenu.selected.fg = clrbg

c.hints.border = "1px solid clrbg"

