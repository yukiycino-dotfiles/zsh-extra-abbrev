typeset -g -A EXTRA_ABBREV
EXTRA_ABBREV=()

function extra-abbrev() {
  if [ -z "$RBUFFER" ] ; then
    extra-abbrev-aux
  else
    zle end-of-line
  fi
}

function extra-abbrev-aux() {
  local init last value addleft addright
  init=$(echo -nE "$LBUFFER" | sed -e "s/[_a-zA-Z0-9]*$//")
  last=$(echo -nE "$LBUFFER" | sed -e "s/.*[^_a-zA-Z0-9]\\([_a-zA-Z0-9]*\\)$/\\1/")
  value=${EXTRA_ABBREV[$last]}
  if [[ $value = *_\|_* ]] ; then
    addleft=${value%%_\|_*}
    addright=${value#*_\|_}
  else
    addleft=$value
    addright=""
  fi
  if [ "$last" = "PWD" ] ; then
    LBUFFER=""
    RBUFFER="$PWD"
  else
    LBUFFER=$init${addleft:-$last }
    RBUFFER=$addright$RBUFFER
  fi
}
zle -N extra-abbrev
