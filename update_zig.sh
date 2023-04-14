#!/usr/bin/bash

download_url=$(\
    curl -s https://ziglang.org/download/index.json | \
    grep tarball | \
    grep "builds/zig-linux-x86_64" | \
    awk -F '"' '{ print $4 }' \
)
tarball_filename=$(basename $download_url)
curl $download_url -o $tarball_filename
tar -xvf $tarball_filename
rm -rf $tarball_filename

zig_dir=zig-nightly-version
untar_dir=$(echo $tarball_filename | sed -r "s/.tar.xz//")
rm -rf $zig_dir
mv $untar_dir $zig_dir

sudo ln -sf $(realpath $zig_dir)/zig /usr/bin/zig-nightly
