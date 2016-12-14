# Screenfetch
screenfetch

# Keybindings: switch tab with esc
/usr/bin/setxkbmap -option "caps:swapescape"
ns=/home/oak/git/night
dz=/home/oak/git/zerg
dh=/home/oak/git/hydra
dm=/home/oak/git/mazda
ms=/home/oak/git/mazda/resources/public/css/style.scss
mw=/home/oak/git/mazda/resources/public/css/
vd=/home/oak/vim

# Alias
alias 'v=nvim'
alias 't=tmux'
alias 'vn=v /home/oak/note'
alias 'vneo=v /home/oak/.config/nvim/init.vim'
alias 'vz=v /home/oak/.zshrc'
alias 'vv=cd $vd;v .'
alias 'vzs= source /home/oak/.zshrc'
alias 'zn=cd $dz;v .'
alias 'hn=cd $dh;v .'
alias 'nn=cd $ns;v .'
alias 'ndh=cd $ns; serverless deploy function -f home'
alias 'ndc=s3cmd put /home/oak/git/mazda/resources/public/css/style.css s3://night-dev-zergs3-9hxv27xdysnv -m text/css'
alias 'ndm=s3cmd put /home/oak/git/mazda/resources/public/css/style.css.map s3://night-dev-zergs3-9hxv27xdysnv -m text/css'
alias 'mdj=aws s3 cp /home/oak/git/mazda/resources/public/js/compiled/app.js s3://night-dev-zergs3-9hxv27xdysnv'
alias 'zdj=aws s3 cp /home/oak/git/zerg/resources/public/js/compiled/zerg.js s3://night-dev-zergs3-9hxv27xdysnv'
alias 'zb=cd $dz;lein do clean, cljsbuild once min'
alias 'lf=lein clean; lein figwheel dev'
alias 'mb=cd $dm; lein clean; lein cljsbuild once min'
alias 'ml=cd $dm; lf'
alias 'mn=cd $dm; v .'
alias 'ms=v $ms'
alias 'mw=sass --watch $mw'
alias 'yd=youtube-dl'
alias 'yx=youtube-dl -x'
alias 'yn=youtube-dl --no-playlist'


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/oak/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="/home/oak/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="$HOME/usr/bin/xclip:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
