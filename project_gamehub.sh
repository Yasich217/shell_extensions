##
##  NOTE:
##  NAMES WILL COLLIDE WITH OTHER SCRIPTS
##  take care to add this project's name to the
##  end of everything. SelectAll/Replace makes
##  it easy.
##

# -=-+-=-+-=-+-=-+
# -= ENV VARS
# -=-+-=-+-=-+-=-+
SCRIPT_DIR_GH=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")
SCRIPT_FULL_PATH_GH="$SCRIPT_DIR_GH/$(basename -- "$0")"


# -=-=-=-=-=-=-=-=-=-=-=-=
# -=  VARS
# -=-=-=-=-=-=-=-=-=-=-=-=
MANIFEST_FOLDER_GH=~/code/p/ppr-urlconfig-dev
CODE_FOLDER_GH=~/code/p/rnps-game-hub/packages/game-hub


# -=-=-=-=-=-=-=-=-=-=-=-=
# -=  ALIASES
# -=-=-=-=-=-=-=-=-=-=-=-=
alias cdgh='cd $CODE_FOLDER_GH'
alias gh_dev='bash $SCRIPT_FULL_PATH_GH -dev -serve'
alias gh_code='bash $SCRIPT_FULL_PATH_GH -dev'
alias gh_serve='bash $SCRIPT_FULL_PATH_GH -serve'
alias gh_link_concept='_link_concept_gamehub'
alias gh_link_product='_link_product_gamehub'
alias gh_link_title='_link_title_gamehub'


# -=-=-=-=-=-=-=-=-=-=-=-=
# -=  FUNCTIONS
# -=-=-=-=-=-=-=-=-=-=-=-=
_link_concept_gamehub() {
  p_cli execute shellui "openuri psgamehub:main?conceptId={$1}"
}
_link_product_gamehub() {
  p_cli execute shellui "openuri psgamehub:main?productId={$1}"
}
_link_title_gamehub() {
  p_cli execute shellui "openuri psgamehub:main?titleId={$1}"
}
_serve_manifest_gamehub() {
  cd $MANIFEST_FOLDER_GH
  yarn start &
  sleep 1
}
_serve_app_gamehub() {
  cd $CODE_FOLDER_GH
  yarn start &
  sleep 1
}
_open_editors_gamehub() {
  echo "Attempting to open editor to GAMEHUB"
  code $CODE_FOLDER_GH
}
_serve_all_gamehub() {
  echo "Starting Manifest and App servers"
  trap "exit" INT TERM ERR
  trap "kill 0" EXIT
  _serve_manifest_gamehub
  _serve_app_gamehub
  echo "P Manifest and App servers running ..."
  wait
}


# -=-=-=-=-=-=-=-=-=-=-=-=
# -=  MAIN
# -=-=-=-=-=-=-=-=-=-=-=-=
# DEV - open editors
if [[ $* == *"-dev"* ]]; then
  _open_editors_gamehub
fi

# SERVE - open editors
if [[ $* == *"-serve"* ]]; then
  _serve_all_gamehub
fi