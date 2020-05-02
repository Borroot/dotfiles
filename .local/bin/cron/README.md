# Environment variables
These cronjobs have components that require information about your current
display in order to show notifications correctly. When you add them as
cronjobs, precede the command with `cronenv` as shown below.

	/home/borroot/.local/bin/cron/cronenv 'script args'

This ensures that notifications will display and that environmental variables
will work. A complete example is shown below.

	0 9 * * * /home/borroot/.local/bin/cron/cronenv 'check-repos all'
