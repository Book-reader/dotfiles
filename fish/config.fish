if status is-interactive

# fix the garbage new default
bind ctrl-c cancel-commandline

if [ "$TTY" = "TTY0" ]
	# I sure hope this works, it will likely be over a week before I have to test this
	uwsm start select
end

# Fix with ostree
if [ $PWD = "/var/home/$USER" ]
    cd
end

set LSCMD "eza"
set LSCMDARGS "--icons --git -l"
set EDITOR "kak"
set EDITORARGS ""

fish_add_path "$HOME/.bin" "$HOME/.local/bin" "$HOME/.cargo/bin" "$HOME/.nix-profile/bin" "$HOME/.config/emacs/bin" "$HOME/go/bin"

alias getip "dig +short txt ch whoami.cloudflare @1.0.0.1"
alias nvidia "sudo envycontrol -s nvidia"
alias hybrid "sudo envycontrol -s hybrid"
alias integrated "sudo envycontrol -s integrated"
# alias cp "rsync -a --info=progress2 --no-i-r -h"

alias nixbld "sudo nixos-rebuild switch --flake ~/nix/.#$hostname --impure -I nixos-config=$HOME/nix/configuration.nix";

alias \\\\ "command"
abbr g "git"
abbr c "cd"
abbr ns "nix-shell"
if type -q "$EDITOR"
  alias vim "$EDITOR $EDITORARGS"
end
abbr v "vim"
if type -q "$LSCMD"
  alias ls "$LSCMD $LSCMDARGS"
  alias la "$LSCMD $LSCMDARGS -a"
end

if type -q "bat"
    alias cat "bat -pp"
end

alias yt1080 "yt-dlp -f bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"
if type -q "pipx"
	alias pip "pipx"
end
abbr gc "git clone"
if type -q "trash"
  alias rm "trash -v"
end
if type -q "gtrash"
  alias tp "gtrash put -v"
  alias tr "gtrash restore"
end

if type -q "nala"
  alias apt "sudo nala"
end
abbr y "yay"

if type -q "starship"
  starship init fish | source
end
#if type -q "zoxide"
#  zoxide init fish --cmd cd | source
#end
if type -q "fastfetch"
  fastfetch
end

function fish_command_not_found
  bash -c "~/.config/fish/bash.command-not-found"
  __fish_default_command_not_found_handler $argv
end

alias hist "history | awk 'NF {print \$1}' | sort | uniq -c | sort -nr | head -10"

end
