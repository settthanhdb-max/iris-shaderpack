#!/usr/bin/env bash
# build_zip.sh — produces Iris-1.21.11-Shaders.zip at repo root
set -e
OUT=Iris-1.21.11-Shaders.zip
rm -f "$OUT"
# include top-level metadata and the shaders folder
zip -r "$OUT" iris-shaderpack.json shaders README.md LICENSE
echo "Created $OUT"
