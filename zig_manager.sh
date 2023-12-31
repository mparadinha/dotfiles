#!/usr/bin/bash

show_help() {
    echo "manage multiple installations of the zig compiler"
    echo ""
    echo "  update   download latest version (master)"
    echo "  install  install a specific version of the compiler"
    echo "  switch   choose which installation is active @ '/usr/bin/zig'"
}

error() {
    echo $1
    exit 1
}

to_lower() {
    echo "$1" | tr "[:upper:]" "[:lower:]"
}

install_from_url() {
    if [[ -z "$1" ]]; then error "missing arg: 'url'"; fi
    if [[ -z "$2" ]]; then error "missing arg: 'install_name'"; fi
    download_url=$1
    install_name=$2
    echo "[install_from_url] url=$download_url, install_name=$install_name"

    zig_dir=$install_name
    rm -rf $zig_dir

    archive_filename=$(basename $download_url)
    curl $download_url -o $archive_filename
    tar -xvf $archive_filename
    rm -rf $archive_filename

    untar_dir=$(echo $archive_filename | sed -r "s/.tar.xz//")
    mv $untar_dir $zig_dir

    sudo ln -sf $(realpath $zig_dir)/zig /usr/bin/$install_name
}

switch_to() {
    if [[ ! -z "$1" ]]; then
        version=$1;
        if [[ ! -f "/usr/bin/zig-$version" ]]; then
            error "'zig-$version' not installed"
        fi
    else
        echo "Current version is $(zig version)"
        echo "Available version:"
        ls -l --color=auto /usr/bin/zig-*
        while true; do
            read -p "Choose version: " version
            if [[ -f "/usr/bin/zig-$version" ]]; then break; fi
        done
    fi

    sudo ln -sf /usr/bin/zig-$version /usr/bin/zig
    echo "Current version is $(zig version)"
}

update() {
    download_url=$(\
        curl -s https://ziglang.org/download/index.json | \
        grep tarball | \
        grep "builds/zig-linux-x86_64" | \
        awk -F '"' '{ print $4 }' \
    )
    install_from_url $download_url zig-master

    switch_to master
}

install() {
    if [[ -z "$1" ]]; then error "missing arg: 'version'"; fi
    version=$1

    system_pair=$(to_lower $(uname -s))-$(uname -m)
    if [[ "$system_pair" != "linux-x86_64" ]]; then
        error "'$system_pair' not supported"
    fi

    download_url="https://ziglang.org/download/$version/zig-$system_pair-$version.tar.xz"
    install_from_url $download_url "zig-$version"

    switch_to $version
}

case $1 in
    --help)
        show_help
        ;;
    update)
        update
        ;;
    install)
        install $2
        ;;
    switch)
        switch_to $2
        ;;
    *)
        echo "unknown command '$1'"
        show_help
        exit 1
        ;;
esac
