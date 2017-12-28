# fix screen
xrandr --output HDMI-1 --left-of eDP-1
# xrandr --output eDP-1 --left-of HDMI-1
# disable trackpad
synclient TouchpadOff=1

# alias
alias am5="cd ~/p/sys;python3.6 -c 'from ifpex import amo5;amo5.root()'"
alias am7="cd ~/p/sys;python3.6 -c 'from ifpex import amo7;amo7.root()'"
alias am8="cd ~/p/sys;python3.6 -c 'from ifpex import amo8;amo8.root()'"
alias am9="cd ~/p/sys;python3.6 -c 'from ifpex import amo9;amo9.root()'"
alias am10="cd ~/p/sys;python3.6 -c 'from ifpex import amo10;amo10.root()'"
alias amp1="cd ~/p/sys;python3.6 -c 'from ifpex import amp1;amp1.root()'"
alias amp2="cd ~/p/sys;python3.6 -c 'from ifpex import amp2;amp2.root()'"
alias lts1="cd ~/p/sys;python3.6 -c 'from ifpex import lts1;lts1.root()'"
alias lts2="cd ~/p/sys;python3.6 -c 'from ifpex import lts2;lts2.root()'"
alias smtp2="cd ~/p/sys;python3.6 -c 'from ifpex import smtp2;smtp2.root()'"
alias ns1="cd ~/p/sys;python3.6 -c 'from ifpex import ns1;ns1.root()'"
alias blog="cd ~/p/sys;python3.6 -c 'from ifpex import blog;blog.root()'"
alias lock='xscreensaver-command -l'
alias igd='python3.6 ~/p/neo/igd.py'
alias ice='cd ~/m/sys;python ice.py'
alias sh='pipenv shell'
alias vm='vim ~/m/mail'
alias l='exa -lh'
alias la='exa -lah'
alias vd='vim ~/Documents/todo'
alias vl='vim ~/Documents/login'
alias vb='vim ~/.bashrc'
alias td='synclient TouchpadOff=1'
alias te='synclient TouchpadOff=0'
alias dv='cd ~/Videos'
alias dkb='docker build - < Dockerfile'
alias dkl='docker images'
alias dkp='docker ps'
alias dkk='docker kill'
alias dki='docker info | head -n 6'
alias dka='docker rm -f (docker ps -a -q)'
alias dkr='docker rmi'
alias dkt='docker tag'
alias dkb='docker run -it t1 bash'
alias vt='vim ~/.tmux.conf.local'
alias vp='vim ~/.ptpython/config.py'
alias pt='ptpython'
alias el='exa -l'
alias ea='exa -la'
alias x='xonsh'

# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
# run screenfetch
# neofetch

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

# path pip3
# set -gx PATH "/home/zeal/.cargo/bin"

# add to path
set -gx PATH /home/ice/.cargo/bin $PATH
set -gx PATH /home/ice/.local/bin $PATH
set -gx PATH /home/ice/n/bin $PATH
set -gx PATH /home/ice/.fzf/bin $PATH
set -gx PATH /home/ice/apps/thonny/bin $PATH


abbr -a gg python ~/m/sys/gitgud.py
abbr -a vr vim ~/.vimrc
abbr -a v vim
abbr -a vv vim ~/m/vim
abbr -a va vim ~/.config/alacritty/alacritty.yml
abbr -a vn vim ~/Documents
abbr -a vy vim ~/m/neo
abbr -a vs vim ~/m/sys
abbr -a vi vim ~/m/sys/ice.py
abbr -a vp vim ~/.ptpython/config.py
abbr -a ds cd ~/m/sys
abbr -a dm cd ~/Music
abbr -a sf source ~/.config/fish/config.fish
abbr -a sb source ~/.bashrc
abbr -a vf vim ~/.config/fish/config.fish
abbr -a red redshift -O 1700K
abbr -a ff /opt/firefox/firefox
abbr -a ad sudo apt update
abbr -a ag sudo apt upgrade
abbr -a eu sudo eopkg up
abbr -a p python3.6
abbr -a yx youtube-dl -x
abbr -a yv youtube-dl
abbr -a pl livereload
abbr -a ga git add -A
abbr -a gc git commit -m ''
abbr -a gp git push
abbr -a ng npm list -g --depth=0
abbr -a db cd /media/xeno/BAK
abbr -a dn ~/p/neo
abbr -a dp ~/p/python
abbr -a dy ~/p/neo
abbr -a dx ~/p/nuxt
abbr -a gy python3.6 ~/p/neo/igy.py
abbr -a gd python3.6 ~/p/neo/igd.py
abbr -a gv python3.6 ~/p/neo/igv.py
abbr -a pe pipenv run python
abbr -a pi pipenv install
abbr -a ppa vim /etc/apt/sources.list.d/
abbr -a r ranger
abbr -a hr1 python ~/m/neo/hr1.py
abbr -a hr2 python ~/m/neo/hr2.py
abbr -a hr3 python ~/m/neo/hr3.py
abbr -a hm python mail.py
abbr -a pes pipenv shell
abbr setclip "xclip -selection c"
abbr getclip "xclip -selection c -o"
