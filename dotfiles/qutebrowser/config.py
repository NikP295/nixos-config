config.load_autoconfig(False)

config.bind('<Alt-w>', 'tab-close')

# Dark mode
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = 'never'
c.colors.webpage.darkmode.policy.page = 'always'

# Adblock settings
c.content.blocking.enabled = True
c.content.blocking.method = 'auto'
c.content.blocking.adblock.lists = [
    'https://easylist.to/easylist/easylist.txt',
    'https://easylist.to/easylist/easyprivacy.txt',
    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt',
    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt',
]



# config.py

config.source('themes/qute-city-lights/city-lights-theme.py')








