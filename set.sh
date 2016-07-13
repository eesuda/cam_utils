#!/bin/sh
media-ctl -r -l '"mt9p031 1-005d":0->"OMAP3 ISP CCDC":0[1], "OMAP3 ISP CCDC":2->"OMAP3 ISP preview":0[1], "OMAP3 ISP preview":1->"OMAP3 ISP preview output":0[1]'
# media-ctl -r -l '"mt9p031 1-005d":0->"OMAP3 ISP CCDC":0[1], "OMAP3 ISP CCDC":2->"OMAP3 ISP preview":0[1], "OMAP3 ISP preview":1->"OMAP3 ISP resizer":0[1], "OMAP3 ISP resizer":1->"OMAP3 ISP resizer output":0[1]'
case "$1" in
    "0") media-ctl -V '"mt9p031 1-005d":0 [SGRBG12/2592x1944], "OMAP3 ISP CCDC":2 [SGRBG10/2592x1944], "OMAP3 ISP preview":0 [(16,12)/2560x1920], "OMAP3 ISP preview":1 [UYVY/2560x1920]' ;;
    "1") media-ctl -V '"mt9p031 1-005d":0 [SGRBG12/1296x972], "OMAP3 ISP CCDC":2 [SGRBG10/1296x972], "OMAP3 ISP preview":0 [(16,12)/1264x948], "OMAP3 ISP preview":1 [UYVY/1264x948]' ;;
    *) media-ctl -V '"mt9p031 1-005d":0 [SGRBG12/648x486], "OMAP3 ISP CCDC":2 [SGRBG10/648x486], "OMAP3 ISP preview":0 [(12,8)/624x468], "OMAP3 ISP preview":1 [UYVY/624x468]' ;;
esac

if [ ! -e /tmp/tele ] ; then
    mkdir /tmp/tele
fi
