#!/bin/bash
BBLUE='\033[1;34m'
NC='\033[0m' # No Color
cd ../../../..
echo -e "${BBLUE}We are gonna patch system/core${NC}"
cd system/core
patch -p1 < ../../device/meizu/m3note/patches/system/core/0001-init-Re-allow-services-without-SELinux-contexts-defi.patch
cd ../..
