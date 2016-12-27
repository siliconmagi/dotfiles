# Screenfetch
screenfetch

# Keybindings: switch tab with esc
/usr/bin/setxkbmap -option "caps:swapescape"
DN=/home/oak/git/night
DM=/home/oak/git/mazda
MW=/home/oak/git/mazda/resources/public
VD=/home/oak/vim

# Alias
alias 'v=nvim'
alias 't=tmux'
alias 'vn=v /home/oak/note'
alias 'vneo=v /home/oak/.config/nvim/init.vim'
alias 'vz=v /home/oak/.zshrc'
alias 'vv=cd $VD;v .'
alias 'vzs= source /home/oak/.zshrc'
alias 'jr=java -cp /home/oak/Downloads/clojure-1.8.0/clojure-1.8.0.jar clojure.main'
alias 'wg=wget -L -r -nc -nd -k -p -np'

alias 'nn=cd $DN;v .'
alias 'nh=cd $DN;v home.js'
alias 'ns=v $DN/src/entry.js'
alias 'ndh=cd $DN; serverless deploy function -f home'

alias 'mb=v $MW/src/entry.js'

alias 'mbc=cleancss -o $MW/css/style-min.css $MW/css/style.css && echo clean && gzip -9 -n $MW/css/style-min.css && echo gzip && mv $MW/css/style-min.css.gz $MW/css/style-min.css && echo mv'
alias 'mdc=aws s3 cp $MW/css/style-min.css s3://night-dev-mazdas3-v2bpo388b5qy --content-encoding "gzip" --content-type "text/css"'
alias 'mdj=aws s3 cp $MW/js/compiled/app.js s3://night-dev-mazdas3-v2bpo388b5qy'
alias 'lf=lein clean; lein figwheel dev'
alias 'mbj=cd $DM; lein clean; lein cljsbuild once min'
alias 'ml=cd $DM; lf'
alias 'mn=cd $DM; v .'
alias 'mw=sass --watch $MW/css'

alias 'yd=youtube-dl'
alias 'yx=youtube-dl -x'
alias 'yn=youtube-dl --no-playlist'

# yarn path
export PATH="$PATH:`yarn global bin`"

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
