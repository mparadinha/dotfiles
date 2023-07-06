# this is a lightly adapted version of:
# /usr/share/doc/ranger/examples/shell_automatic_cd.sh

function ranger_cd
    set -f temp_file (mktemp -t "ranger_cd.XXXXXXXXXX")
    ranger --choosedir=$temp_file
    cd (cat $temp_file)
    rm $temp_file
end