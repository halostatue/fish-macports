# @halostatue/fish-macports/conf.d/halostatue_fish_macports.fish

# Find macports at /opt/local/bin/port, unless we already have it.
if ! command --query port && ! test -x /opt/local/bin/port
    return
end

set --local paths \
    /opt/local/bin \
    /opt/homebrew/bin \
    /usr/local/bin \
    /usr/bin \
    /bin \
    /opt/local/sbin \
    /opt/homebrew/sbin \
    /usr/local/sbin \
    /usr/sbin \
    /sbin

if ! test -d /opt/homebrew
    set --local i (contains -i -- /opt/homebrew/bin $paths)
    and set -e paths[$i]

    set --local i (contains -i -- /opt/homebrew/sbin $paths)
    and set -e paths[$i]
end

fish_add_path --append --move --path $paths
