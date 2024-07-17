if status is-interactive

# Fix with ostree
if [ $PWD = "/var/home/$USER" ]
    cd
end

set LSCMD "eza"
set LSCMDARGS "--icons --git -l"
set EDITOR "nvim"

fish_add_path "$HOME/.bin" "$HOME/.local/bin" "$HOME/.cargo/bin" "$HOME/.nix-profile/bin" "$HOME/.config/emacs/bin"

alias getip "dig +short txt ch whoami.cloudflare @1.0.0.1"
alias nvidia "sudo envycontrol -s nvidia"
alias hybrid "sudo envycontrol -s hybrid"
alias integrated "sudo envycontrol -s integrated"
alias cp "rsync -a --info=progress2 --no-i-r -h"
alias \\\\ "command"
abbr g "git"
abbr c "cd"
if type -q "$EDITOR"
  alias vim "$EDITOR"
end
abbr v "vim"
if type -q "$LSCMD"
  alias ls "$LSCMD $LSCMDARGS"
  alias la "$LSCMD $LSCMDARGS -a"
end

alias yt1080 "yt-dlp -f bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"
if type -q "pipx"
	alias pip "pipx"
end
abbr gc "git clone"
if type -q "trash"
  alias rm "trash -v"
end
if type -q "nala"
  alias apt "sudo nala"
end
abbr y "yay"

if type -q "starship"
  starship init fish | source
end
if type -q "zoxide"
  zoxide init fish --cmd cd | source
end
if type -q "fastfetch"
  fastfetch
end

end
