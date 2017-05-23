# run screenfetch
neofetch
# screenfetch

# fish vi mode
fish_vi_key_bindings

# variables
# set -gx PATH $PATH ~/bin
# export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
# export ANDROID_HOME=$HOME/Android/Sdk
# set PATH $PATH /home/oak/Android/Sdk/tools
set PATH $PATH /home/zeal/.cargo/bin
set PATH $PATH /home/zeal/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# set variables
# -x export, -U universal across fish shells

# variable for vim fzf interop
set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# function location
# ~/.config/fish/functions

# set colors
set -lx TERM screen-256color-bce;

# swap escape with capslock
setxkbmap -option caps:swapescape

# abbreviations
abbr -a dd /media/zeal/Data
abbr -a dm /media/zeal/Data/Music
abbr -a n nvim
abbr -a v vim
abbr -a vv vim ~/vim
abbr -a nn nvim ~/vim
abbr -a neo nvim ~/.config/nvim/init.vim
abbr -a vr vim ~/.vimrc
abbr -a sf source ~/.config/fish/config.fish
abbr -a vf vim ~/.config/fish/config.fish
abbr -a vt vim ~/.tmux.conf.local
abbr -a red redshift -O 2700K
abbr -a ast /usr/local/bin/android-studio/bin/studio.sh
abbr -a ls ls -lah

abbr -a yp yarn prod
abbr -a yd yarn dev
abbr -a yad yarn add -D
abbr -a ya yarn add
abbr -a yr yarn remove
abbr -a yi yarn info
abbr -a yg yarn upgrade
abbr -a yn yarn generate

abbr -a yx youtube-dl -x
abbr -a yv youtube-dl
abbr -a pl livereload
abbr -a ga git add -A
abbr -a gc git commit -m ''
abbr -a gp git push
abbr -a tf tslint --fix
abbr -a ef eslint --fix
abbr -a cr cargo run --bin
abbr -a dp ~/p/palantir

# alacritty
# abbr -a va vim $HOME/.config/alacritty/alacritty.yml
abbr -a vim vim

# dsel project
abbr -a ds ~/p/dsel
alias vd="cd ~/p/dsel;vim ."
alias vb="cd ~/p/dsel;and cargo run --bin show_posts"

# dsel project
abbr -a dl ~/p/palantir
alias vl="cd ~/p/palantir;vim ."
# alias vb="cd ~/p/palantir;and cargo run --bin show_posts"

# rsync dotfiles
alias rsd="rsync -avz ~/.vimrc /media/zeal/Data/g/dotfiles;rsync -avz ~/.config/nvim/init.vim /media/zeal/Data/g/dotfiles;rsync -avz ~/.config/fish/config.fish /media/zeal/Data/g/dotfiles;rsync -avz ~/.tmux.conf.local /media/zeal/Data/g/dotfiles;cd /media/zeal/Data/g/dotfiles;git add -A"

# rsync vim
alias rsv="rsync -avz --exclude='.*' ~/vim /media/zeal/Data/g/vim;cd /media/zeal/Data/g/vim"

# android emulator
# alias emulator="$ANDROID_SDK/emulator/emulator -use-system-libs"

# aws
alias s3="aws s3 sync . s3://nightshell-dev-s3-8n7y3sducxly --content-encoding 'gzip'"
abbr -a gz gzip -9 -n

# https://d2j3o9k0z9e36f.cloudfront.net/

# castle
abbr -a dc ~/p/vue/cloves
alias cn="cd ~/p/vue/cloves;nvim ."
alias cl="cd ~/p/vue/cloves;and yarn dev"

# violet
abbr -a vid ~/proj/inf/violet
alias vin="cd ~/proj/inf/violet;nvim ."
alias vil="cd ~/proj/inf/violet;and yarn dev"

# taurus
abbr -a td ~/p/vue/taurus
alias tn="cd ~/p/vue/taurus;nvim ."
alias tl="cd ~/p/vue/taurus;and yarn dev"
alias tg="cd ~/p/vue/taurus;and yarn generate"
alias tp="cd ~/p/vue/taurus/dist;and netlify deploy -s car-park-attendant-jack-43088"

# aries
abbr -a ad ~/p/vue/aries
alias an="cd ~/p/vue/aries;nvim ."
alias al="cd ~/p/vue/aries;and yarn dev"
alias agen="cd ~/p/vue/aries;and yarn generate"
alias ap="cd ~/p/vue/aries/dist;and netlify deploy -s car-park-attendant-jack-43088"

# lavender
abbr -a ld ~/p/vue/cloves
alias lv="cd ~/p/vue/cloves;vim ."
alias ldev="cd ~/p/vue/cloves;and yarn dev"

# weex
abbr -a wd ~/p/weex/

# archon
# alias rv="cd ~/p/weex/archon/src;vim ."
# alias rb="cd ~/p/weex/archon;yarn build"
# alias rc="cd ~/p/weex/archon;yarn copy:android"
# alias rs="cd ~/p/weex/archon;yarn serve"

# docs
alias dnor="cd ~/p/vue/nuxtjs.org;and nvim ."
alias dvux="cd ~/p/vue/vuex;and nvim ."
alias dnux="cd ~/p/vue/nuxt.js;and nvim ."

# res
abbr -a nid ~/p/claud/res
alias nhd="cd ~/p/claud/res;and serverless deploy function -f home"
alias nin="cd ~/p/claud/res;nvim ."


# commands
function nc
  cd ~/inf/castle
  nvim .
end

# load direnv
# eval (direnv hook fish)

# OPAM configuration
# source /home/oak/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
