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

$env.PROMPT_INDICATOR_VI_NORMAL = {||
    let C = (ansi {fg: "#3d3d3d", bg: "#8AB900"})
    let R = (ansi reset)
    $"($C) ($R)"
}
$env.PROMPT_INDICATOR_VI_INSERT = " "

alias l = ls
alias la = ls -a
alias ll = ls -la

if ((which code | length) > 0) {
    $env.config.buffer_editor = ["code", "-w"]
}