install:
	install -m 0644 redbot@.service /etc/systemd/system
	install -m 0755 redbot-launch.sh /usr/local/bin/
	systemctl daemon-reload
