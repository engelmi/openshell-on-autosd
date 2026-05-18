#!/usr/bin/bash

aib --verbose \
      build \
      --osbuild-manifest build.json \
      --build-dir _build \
      --distro autosd10 \
      --arch x86_64 \
      --target qemu \
      openshell-rhivos.aib.yml \
      "localhost/openshell-rhivos" \
      openshell-rhivos.aib.x86_64.img
