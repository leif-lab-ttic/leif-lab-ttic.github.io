#!/usr/bin/env python3
"""Zero the alpha channel in a rectangular region of ship-logo.png.

Useful for clearing sail icons before redrawing them.

Usage:
  python3 scripts/logo-editing/erase_region.py Y0 Y1 X0 X1

Example — erase the binary tree area:
  python3 scripts/logo-editing/erase_region.py 340 620 490 660
"""
import sys
from PIL import Image
import numpy as np

SRC = "assets/images/ship-logo.png"

if len(sys.argv) != 5:
    print("Usage: erase_region.py Y0 Y1 X0 X1")
    sys.exit(1)

y0, y1, x0, x1 = map(int, sys.argv[1:])

img = Image.open(SRC).convert("RGBA")
px = np.array(img, dtype=np.uint8)

before = (px[y0:y1, x0:x1, 3] > 50).sum()
px[y0:y1, x0:x1, 3] = 0
Image.fromarray(px).save(SRC)
print(f"Erased region y={y0}:{y1}, x={x0}:{x1} — cleared {before} opaque pixels")
