.PHONY: install
install: /etc/hosts.backup
	# Make an initial backup of the original hosts file.
	[ -f /etc/hosts.backup ] && cp /etc/hosts /etc/hosts.backup || true
	./update-hosts
