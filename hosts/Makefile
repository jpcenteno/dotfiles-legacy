.PHONY: install

# The lack of dependencies ensures that the backup is going to be made only
# once.
/etc/hosts.backup:
	cp /etc/hosts /etc/hosts.backup

install: /etc/hosts.backup
	./update-hosts
