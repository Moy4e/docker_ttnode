#!/bin/bash
case "$(uname -m)" in
x86_64)
	dpkg --add-architecture arm64
	apt-get update
	apt-get -y --no-install-recommends install libc6:arm64 libstdc++6:arm64
	apt-get clean
	apt-get purge -y --auto-remove

	qemu="/usr/bin/qemu-arm-static"
	curl -L -o $qemu https://github.com/multiarch/qemu-user-static/releases/download/v5.2.0-2/qemu-aarch64-static && chmod +x $qemu
	# curl -L -k -o /usr/node/ttnode https://cdn.jsdelivr.net/gh/ericwang2006/docker_ttnode/$(uname -m)/ttnode
	# curl -L -k -o /usr/node/ttnode http://o7coj731m.bkt.clouddn.com/tiantang/arm64/$ttnode_filename
	curl -L -k -o /usr/node/ttnode https://github.com/ericwang2006/docker_ttnode/raw/master/aarch64/ttnode && chmod +x /usr/node/ttnode
	;;
aarch64)
	curl -L -k -o /usr/node/ttnode https://github.com/ericwang2006/docker_ttnode/raw/master/aarch64/ttnode && chmod +x /usr/node/ttnode
	;;
armv7l)
	curl -L -k -o /usr/node/ttnode https://github.com/ericwang2006/docker_ttnode/raw/master/armv7l/ttnode && chmod +x /usr/node/ttnode
	;;
*)
	echo "unsupported CPU architecture!"
	exit 1
	;;
esac
