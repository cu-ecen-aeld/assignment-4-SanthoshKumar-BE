#!/bin/bash
# Clean script for Buildroot
# Usage:
#   ./clean.sh            -> light clean
#   ./clean.sh distclean  -> full clean

BUILDROOT_DIR=./buildroot

if [ "$1" == "distclean" ]; then
    echo "Performing FULL clean (distclean)..."
    make -C ${BUILDROOT_DIR} distclean
else
    echo "Performing LIGHT clean (clean)..."
    make -C ${BUILDROOT_DIR} clean
fi
