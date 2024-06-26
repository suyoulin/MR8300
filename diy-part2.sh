#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/OpenWrt/Linksys/g' package/base-files/files/bin/config_generate

# Open wifi
# sed -i 's/36/44/g;s/VHT80/HE20/g' package/network/config/wifi-scripts/files/lib/wifi/mac80211.sh
# sed -i 's/disabled=1/disabled=0/g' package/network/config/wifi-scripts/files/lib/wifi/mac80211.sh
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# sed -i 's/PKG_VERSION:=1.8.11/PKG_VERSION:=1.8.14/g' feeds/kid/xray-core/Makefile
# sed -i 's/PKG_VERSION:=1.8.9/PKG_VERSION:=1.8.14/g' feeds/kid/sing-box/Makefile
rm -rf feeds/packages/lang/golang
# rm -rf feeds/packages/adguardhome
# rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}
# git clone https://github.com/kenzok8/golang feeds/packages/lang/
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
git clone https://github.com/suyoulin/helloxray package/helloxray
./scripts/feeds install -a

rm -rf feeds/packages/net/xray-core
# rm -rf feeds/kid/luci-app-bypass
rm -rf feeds/kid/luci-app-passwall
rm -rf feeds/kid/luci-app-ssr-plus
