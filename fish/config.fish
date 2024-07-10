if status is-interactive

# Fix with ostree
if [ $PWD = "/var/home/$USER" ]
		cd
end

set LSCMD "eza"
set LSCMDARGS "--icons --git -l"
set EDITOR "nvim"

if [ -d "$HOME/.bin" ] ;
  set PATH "$HOME/.bin:$PATH"
end
if [ -d "$HOME/.local/bin" ] ;
  set PATH "$HOME/.local/bin:$PATH"
end
if [ -d "$HOME/.cargo/bin" ] ;
  set PATH "$HOME/.cargo/bin:$PATH"
end
if [ -d "$HOME/.nix-profile/bin" ] ;
  set PATH "$HOME/.nix-profile/bin:$PATH"
end
if [ -d "$HOME/.config/emacs/bin" ] ;
  set PATH "$HOME/.config/emacs/bin:$PATH"
end

alias getip "dig +short myip.opendns.com @resolver1.opendns.com"
alias nvidia "sudo envycontrol -s nvidia"
alias hybrid "sudo envycontrol -s hybrid"
alias integrated "sudo envycontrol -s integrated"
alias cp "rsync -a"
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
