alias to-bladnman='ssh bladnman@bladnman.com'
alias to-dexter='ssh dexter\ maher@DexterCraft.local'
alias start_apache='sudo apachectl start'
alias stop_apache='sudo apachectl stop'
alias restart_apache='sudo apachectl restart'
alias chromeNoSecurity='open -a Google\ Chrome --args --disable-web-security'


alias dash='openInDash'

# # # #
# Personal Aliases
openInWebstorm () {
    open -a /Applications/WebStorm.app $1
}
openInDash() {
  open dash://$1
}
alias webstorm='openInWebstorm';
alias ws='webstorm';
alias sub='sublime';

# set title of window (iterm2)
function title {
    echo -ne "\033]0;"$*"\007"
}
