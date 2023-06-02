function lsize
    set -f path $argv[1]
    if not count $path > /dev/null
        set -f path .
    end
    du -hs $path/* | sort -h
end
