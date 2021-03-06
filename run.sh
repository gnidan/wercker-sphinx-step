# /bin/bash
if [ -n "$WERCKER_SPHINX_BASEDIR" ]; then
  WERCKER_SPHINX_OPTIONS=$WERCKER_SPHINX_OPTIONS" --directory "${WERCKER_SPHINX_BASEDIR}
fi

pip install Sphinx $WERCKER_SPHINX_PACKAGES

if [ -e "requirements.txt" ]; then
  info "Installing required packages."
  pip install -r requirements.txt
fi

info "Compiling the document."
make $WERCKER_SPHINX_TARGET $WERCKER_SPHINX_OPTIONS
