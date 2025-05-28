if status is-interactive
    hyfetch
    ls -lh
end
theme_gruvbox dark hard
export CPM_SOURCE_CACHE=$HOME/.cache/CPM
fish_add_path /usr/local/GNUstep/Apps/
alias cls clear
function flinfo
    file $argv
    du -h $argv
end
function untargz
    tar -xzf $argv
end
function pacupt
    sudo pacman -Syu
end
function fish_greeting

end
function sshserver
    ssh -p 2222  franchesca@192.168.0.212
end
