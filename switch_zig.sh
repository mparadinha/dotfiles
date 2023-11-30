#!/usr/bin/bash

echo "Current version is $(zig version)"

echo "Available version:"
ls -l --color=auto /usr/bin/zig-*

while true; do
    read -p "Choose version: " version
    if [[ -f "/usr/bin/zig-$version" ]]; then break; fi
done

sudo ln -sf /usr/bin/zig-$version /usr/bin/zig
echo "Current version is $(zig version)"
