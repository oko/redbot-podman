# RedBot under Podman

## Build image

Clone PhasecoreX's repository:

```
git clone https://github.com/PhasecoreX/docker-red-discordbot
cd docker-red-discordbot
```

Then build the image (could be in rootless mode, if you wanted):

```
sudo buildah build --layers -f Dockerfile -t redbot .
```

## Installation

In this repository:

```
sudo make install
```

This installs a systemd service template `redbot@.service` and a launcher script under `/usr/local/bin/`.

It also installs a systemd service and timer `redbot-restart@` which will restart the service at 2am daily,
to avoid some bugs observed in long-running Redbot instances.

## Configuration

Create `/etc/redbot` and copy `sample-config` from this repository to `/etc/redbot/$INSTANCENAME`:

```
cp sample-config /etc/redbot/myinstance
```

Edit the sample config to point to the image you built above:

```
DATADIR=/srv/redbot/myinstance
IMAGE=redbot
TOKEN=mysecrettoken
PREFIX="!"
```

If you already have an existing data directory, you can skip `TOKEN` and `PREFIX`.

File ownership for `PUID` and `PGID` variables is autodetected from the path provided by `DATADIR`.
