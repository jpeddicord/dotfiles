# https://www.nushell.sh/book/configuration.html

$env.path = [
    "~/.local/bin",
    "/opt/homebrew/bin",
    "/usr/local/bin"
] ++ $env.path

$env.config.show_banner = false
$env.config.edit_mode = "vi"
$env.config.buffer_editor = ["nvim"]
$env.VISUAL = "nvim"
$env.EDITOR = "nvim"

overlay use ($nu.default-config-dir | path join modules mise.nu)
overlay use ($nu.default-config-dir | path join modules starship.nu)
overlay use ($nu.default-config-dir | path join modules yazi.nu)

alias l = ls
alias la = ls -a
alias ll = ls -la

if ((which code | length) > 0) {
    $env.config.buffer_editor = ["code", "-w"]
}