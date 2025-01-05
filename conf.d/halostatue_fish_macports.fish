# @halostatue/fish-macports/conf.d/halostatue_fish_macports.fish:v1.1.0

# Find macports at /opt/local/bin/port, unless we already have it.
if ! command --query port && ! test -x /opt/local/bin/port
    return 0
end

if contains -- /opt/local/bin $fish_user_paths
    return 0
end

set --local bin /usr/bin /bin
set --local sbin /usr/sbin /sbin

if command --query brew
    set --local prefix (brew --prefix)

    if test $prefix != /usr/local
        set --prepend bin /usr/local/bin
        set --prepend sbin /usr/local/sbin
    end

    set --local bin_fup (contains -i -- $prefix/bin $fish_user_paths)
    set --local sbin_fup (contains -i -- $prefix/sbin $fish_user_paths)

    switch $__halostatue_macports_homebrew_order
        case homebrew
            if test -z $bin_fup
                set --prepend bin $prefix/bin /opt/local/bin
            end

            if test -z $sbin_fup
                set --prepend sbin $prefix/sbin /opt/local/sbin
            end
        case macports ''
            if test -z $bin_fup
                set --prepend bin /opt/local/bin $prefix/bin
            end

            if test -z $sbin_fup
                set --prepend sbin /opt/local/sbin $prefix/sbin
            end
        case '*'
            echo >&2 "warning: invalid __halostatue_macports_homebrew_order value: $__halostatue_macports_homebrew_order"
    end
end


if ! contains -- /opt/local/bin $bin
    set --prepend bin /opt/local/bin
end

if ! contains -- /opt/local/sbin $sbin
    set --prepend sbin /opt/local/sbin
end

fish_add_path --append --move --path $bin $sbin
