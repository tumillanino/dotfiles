
# Add deno completions to search path
if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then
  export FPATH="$HOME/.zsh/completions:$FPATH"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$PATH:/usr/bin/wezterm"
export SDL_VIDEODRIVER=wayland
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"
fpath+=(${ZDOTDIR:-$HOME}/.zsh_functions)

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_ignore_dups
setopt hist_verify

# Completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 5
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

source $HOME/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(zoxide init zsh)"

alias cd="z"
alias pacman="sudo pacman"
alias yz="yazi"
alias vi="nvim"
alias hx="helix"
alias ls="eza --icons=always"

# Enable vi keybindings
set -o vi

# Map "jk" to exit insert mode
bindkey -M viins 'jk' vi-cmd-mode

# Additional quality-of-life keybindings
bindkey -M vicmd '^R' history-incremental-search-backward # Ctrl+R for reverse search
bindkey -M vicmd '/' history-incremental-search-backward   # / for history search
bindkey -M vicmd '?' history-incremental-search-forward    # ? for forward search
bindkey -M viins '^U' backward-kill-line                  # Ctrl+U to clear line in insert mode
bindkey -M vicmd '^U' backward-kill-line                  # Ctrl+U to clear line in command mode
bindkey -M vicmd '^A' beginning-of-line                   # Ctrl+A to go to the beginning of the line in command mode
bindkey -M vicmd '^E' end-of-line                         # Ctrl+E to go to the end of the line in command mode

# pnpm setup
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

neofetch

# WINE prefix for DXVK
export WINEPREFIX="$HOME/wineprefix/vst"

export PATH="$HOME/.cargo/bin:$PATH"

eval "$(starship init zsh)"

export PATH="$PATH:$HOME/.spicetify"
. "$HOME/.deno/env"
