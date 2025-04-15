# https://www.nushell.sh/book/configuration.html

$env.path = [
    "~/.local/bin",
    "/opt/homebrew/bin",
    "/usr/local/bin"
] ++ $env.path

$env.config.show_banner = false
$env.config.history.isolation = true

$env.config.edit_mode = "vi"
$env.config.buffer_editor = ["nvim"]
$env.VISUAL = "nvim"
$env.EDITOR = "nvim"

alias l = ls
alias la = ls -a
alias ll = ls -la

if ((which code | length) > 0) {
    $env.config.buffer_editor = ["code", "-w"]
}