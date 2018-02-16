# zsh-extra-abbrev

zsh-extra-abbrev is more powerful than alias -g and is an abbrev expansion that can also specify the cursor position after expansion.

## Installation

### Using zgen

```
zgen load yukiycino-dotfiles/zsh-extra-abbrev
```

### Using zplug

```
zplug "yukiycino-dotfiles/zsh-extra-abbrev"
```

### Using Antigen

```
antigen bundle yukiycino-dotfiles/zsh-extra-abbrev
```

## Settings

Add the following lines to your .zshrc:

`_|_` will be the cursor position after expansion.

```
EXTRA_ABBREV=(
  "DN"  "&> /dev/null"
  "L"   "| $PAGER "
  "G"   "| grep "
  "S"   "| sed '_|_'"
  "R"   " rm "
  "M"   " mkdir "
  "C"   " cat "
  "TX"  " tar -xvzf "
  "TC"  " tar -cvzf "
  "RS"  "rsync -av --exclude '\#*' --exclude '*~' "
  "FX"  "find _|_ -print0 | xargs -0 "
  "PWD" "")

bindkey "^e" extra-abbrev
```

## Usage

```
Input:
$ some-command L

Push: <C-e>
$ some-command | less

Inpug:
$ FX

Push: <C-e>
$ find <cursor> -print0 | xargs -0
```

Read:
* http://d.hatena.ne.jp/keno_ss/20140214/1392330322
