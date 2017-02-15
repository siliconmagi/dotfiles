# swap escape with capslock
setxkbmap -option caps:swapescape

# abbreviations
abbr -a n nvim
abbr -a nn nvim ~/vim
abbr -a fs source ~/.config/fish/config.fish
abbr -a fn nvim ~/.config/fish/config.fish
abbr -a red redshift -O 1700K
abbr -a yp yarn prod
abbr -a yd yarn dev
abbr -a yad yarn add -D
abbr -a ya yarn add
abbr -a yx youtube-dl -x
abbr -a yv youtube-dl
abbr -a neo nvim ~/.config/nvim/init.vim 

# castle
abbr -a dc ~/elm/cloves
alias cn="cd ~/elm/cloves;nvim ."
alias cl="cd ~/elm/cloves;and yarn dev"

# commands
function nc
cd ~/inf/castle
nvim .
end

# load direnv
eval (direnv hook fish)
