alias tetris="tint"
alias space="ninvaders"
alias pacman="pacman4console"
alias Session="~/Session"
alias LibreWolf="~/LibreWolf"
alias py="python3"
alias pip="pip3"
alias venv="python3 -m venv env"
alias activate="source env/bin/activate.fish"
alias freeze="pip3 freeze"
alias GET="curl"

function POST
  curl -X POST -H "Content-Type: applications/json" \
    -d $argv
end

function attend
  open https://make.sc/attend/$argv
end

function get-audio
  youtube-dl --extract-audio --audio-format mp3 "$argv"
end

# pyenv init
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end
