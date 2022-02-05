#!/bin/bash
set -euxo pipefail
location="$(realpath "$DATADIR")"

# make sure we're not requiring running as root
if [[ "$(stat -c %U "$location")" == root ]] || [[ "$(stat -c %G "$location")" == root ]]; then
	echo >&2 "ERROR: do not run this as root"
fi

# start the thing
exec podman run \
	-a stdout -a stderr \
	--rm \
	-v "$location":/data:z \
	-e PUID="$(stat -c %u "$location")" \
	-e PGID="$(stat -c %u "$location")" \
	--env-file "$CONFIG" \
	"$IMAGE"
