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
abbr -a pl livereload 
abbr -a ga git add -A
abbr -a gc git commit -m ''
abbr -a gp git push 
abbr -a tf tslint --fix 

# castle
abbr -a dc ~/elm/cloves
alias cn="cd ~/elm/cloves;nvim ."
alias cl="cd ~/elm/cloves;and yarn dev"

# violet
abbr -a vid ~/proj/inf/violet
alias vin="cd ~/proj/inf/violet;nvim ."
alias vil="cd ~/proj/inf/violet;and yarn dev"

# res
abbr -a nid ~/proj/claud/res
alias nhd="cd ~/proj/claud/res;and serverless deploy function -f home"
alias nin="cd ~/proj/claud/res;nvim ."


# commands
function nc
cd ~/inf/castle
nvim .
end

# load direnv
eval (direnv hook fish)
