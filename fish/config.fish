if status is-interactive
    hyfetch
    eza -l
end
theme_gruvbox dark hard
export CPM_SOURCE_CACHE=$HOME/.cache/CPM
fish_add_path /usr/local/GNUstep/Apps/
alias cls clear
alias la "eza -l"
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
    ssh -p 2222  franchesca@192.168.0.50
end

function fishconfigedit
    micro ~/.config/fish/config.fish
end
