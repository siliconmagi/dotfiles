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
abbr -a yr yarn remove
abbr -a yi yarn info
abbr -a yg yarn upgrade
abbr -a yn yarn generate

abbr -a yx youtube-dl -x
abbr -a yv youtube-dl
abbr -a neo nvim ~/.config/nvim/init.vim 
abbr -a pl livereload 
abbr -a ga git add -A
abbr -a gc git commit -m ''
abbr -a gp git push 
abbr -a tf tslint --fix 

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
alias ag="cd ~/p/vue/aries;and yarn generate"
alias ap="cd ~/p/vue/aries/dist;and netlify deploy -s car-park-attendant-jack-43088"

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
eval (direnv hook fish)

# OPAM configuration
source /home/oak/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
