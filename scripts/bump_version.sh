#!/bin/bash

FILE=pubspec.yaml

CURRENT=$(grep '^version:' "$FILE" | sed 's/version: //')

NAME=$(echo "$CURRENT" | cut -d+ -f1)
BUILD=$(echo "$CURRENT" | cut -d+ -f2)

NEXT=$((BUILD + 1))

sed -i.bak "s/version: .*/version: $NAME+$NEXT/" "$FILE"

rm -f pubspec.yaml.bak

echo "Version updated to $NAME+$NEXT"