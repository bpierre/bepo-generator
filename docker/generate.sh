#!/bin/sh

BUILD_DIR="/tmp/build"
EXPORT_DIR="/export"

if [ ! -d "$EXPORT_DIR" ]; then
  echo ""
  echo "The /export directory doesn’t exist!"
  echo "Please use the -v option to mount an export directory."
  echo ""
  echo "Example:"
  echo ""
  echo "  mkdir export && docker run -v \`pwd\`/export:/export bpierre/bepo"
  exit 1
fi

# We work on a copy of the project to prevent any overwriting,
# as files are generated in several places of the project.

rm -rf "$BUILD_DIR"
cp -r "/pilotes" "$BUILD_DIR"
rm -rf "$BUILD_DIR/configGenerator/results"
mkdir -p "$BUILD_DIR/configGenerator/results"

cd "$BUILD_DIR/configGenerator"

echo "Generate layouts…"
./genAll.sh

echo "Copy layouts…"
./cpAll.sh

cp -r "./results" "$EXPORT_DIR/results"
cp -r "../macosx" "$EXPORT_DIR/macos"
cp -r "../windows" "$EXPORT_DIR/windows"
cp -r "../keymaps" "$EXPORT_DIR/linux"

echo "\nDone."
