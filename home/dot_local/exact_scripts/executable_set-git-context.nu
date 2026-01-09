#!/usr/bin/env nu
#MISE description="Set dir-specific git/gh context"

print (pwd)

let NAME = (gum input --header 'Author Name?')
let EMAIL = (gum input --header 'Email?')

(mise set --file ./mise.local.toml
  "GH_CONFIG_DIR=$PWD/.gh"
  "GIT_AUTHOR_NAME=$NAME"
  "GIT_COMMITTER_NAME=$NAME"
  "GIT_AUTHOR_EMAIL=$EMAIL"
  "GIT_COMMITTER_EMAIL=$EMAIL")

mkdir .gh
gh auth status
