#!/bin/sh
rm /tmp/tele/*uyvy
if [ -e /tmp/tele/run.lock ]; then
    exit 0
fi

case "$1" in
    "0") size="2560x1920" ;;
    "1") size="1264x948" ;;
    *) size="624x468" ;;
esac

touch /tmp/tele/run.lock
i=0;
while [ -e /tmp/tele/run.lock ]; do
    rm /tmp/tele/*uyvy
    yavta -f UYVY -s $size --capture=1 --file=/tmp/tele/image.uyvy -n 1 /dev/video4
    gm convert -size $size /tmp/tele/image.uyvy -density 96x96 \
        /tmp/tele/image${i}.jpg
    ln -s -f /tmp/tele/image${i}.jpg /tmp/tele/image.jpg
    i=$((($i + 1) % 2))
done
