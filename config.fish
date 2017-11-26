# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
# run screenfetch
neofetch

# fish vi mode
fish_vi_key_bindings

# set colors
set -lx TERM screen-256color-bce;

# swap escape with capslock
setxkbmap -option caps:swapescape

# pyenv config
# set -x PATH "/home/xeno/.pyenv/bin" $PATH
# status --is-interactive; and . (pyenv init -|psub)
# status --is-interactive; and . (pyenv virtualenv-init -|psub)

# set /usr/local/bin to PATH
set -g -x PATH /usr/local/bin $PATH
abbr -a vr vim ~/.vimrc
abbr -a v vim
abbr -a vv vim ~/p/vim
abbr -a va vim ~/.config/alacritty/alacritty.yml
abbr -a vn vim ~/.config/nvim/init.vim
abbr -a sf source ~/.config/fish/config.fish
abbr -a sb source ~/.bashrc
abbr -a vf vim ~/.config/fish/config.fish
abbr -a red redshift -O 1700K
abbr -a ad sudo apt update
abbr -a ag sudo apt upgrade
abbr -a p python3
abbr -a yx youtube-dl -x
abbr -a yv youtube-dl
abbr -a pl livereload
abbr -a ga git add -A
abbr -a gc git commit -m ''
abbr -a gp git push
abbr -a ng npm list -g --depth=0
abbr -a db cd /media/xeno/BAK
abbr -a dv cd /media/xeno/BAK/Videos
abbr -a dn ~/p/night
abbr -a dp ~/p/python
abbr -a de ~/p/neo
abbr -a dx ~/p/nuxt
abbr -a gy python3 ~/p/neo/igp.py
abbr -a gd python3 ~/p/neo/igd.py
abbr -a gv python3 ~/p/neo/igv.py
abbr -a pe pipenv run python
abbr -a pi pipenv install
abbr -a ppa vim /etc/apt/sources.list.d/
abbr -a r ranger

