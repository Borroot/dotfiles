config.load_autoconfig(False)  # don't load settings configured through the GUI

config.bind(',r', 'config-source')  # reload config file
config.bind(',d', 'download-clear')
config.bind(',m', 'spawn mpv {url}')

config.bind('<Shift-j>', 'tab-prev')
config.bind('<Shift-k>', 'tab-next')

config.bind('<Shift-Ctrl-j>', 'tab-move -')
config.bind('<Shift-Ctrl-k>', 'tab-move +')

#c.content.private_browsing = True
c.content.blocking.method = 'both'
c.content.blocking.hosts.lists.append(str(config.configdir) + '/blocked')
