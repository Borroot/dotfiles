config.load_autoconfig(False)  # don't load settings configured through the GUI

#c.content.private_browsing = True
c.content.blocking.method = "both"
c.content.blocking.hosts.lists.append(str(config.configdir) + "/blocked")
