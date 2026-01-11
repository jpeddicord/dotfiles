# https://www.nushell.sh/book/configuration.html

$env.path = [
  "~/.local/bin",
  "~/.local/share/mise/shims",
  "/opt/homebrew/bin",
  "/usr/local/bin"
] ++ $env.path

$env.config.show_banner = false
$env.config.history.file_format = "sqlite"
$env.config.history.isolation = true

$env.config.edit_mode = "vi"
$env.config.buffer_editor = ["nvim"]
$env.VISUAL = "nvim"
$env.EDITOR = "nvim"
$env.COLORTERM = "truecolor"
$env.LANG = "en_US.UTF-8"

$env.PROMPT_INDICATOR_VI_NORMAL = {||
  let C = (ansi {fg: "#3d3d3d", bg: "#8AB900"})
  let R = (ansi reset)
  $"($C) ($R)"
}
$env.PROMPT_INDICATOR_VI_INSERT = " "

alias l = ls
alias la = ls -a
alias ll = ls -la

alias cz = chezmoi
alias m = mise
alias z = zellij

def scripts [] {
  let files = glob ~/.local/scripts/* | each {|s| $s | path basename}
  let choice = "[cancel]" | append $files | input list -f
  if $choice == "[cancel]" { return }
  print $"(ansi { fg: "#3d3d3d", bg: "#5ac9ef" }) ($choice) (ansi reset)"
  nu ~/.local/scripts/($choice)
}

# addons
let autoload = $nu.data-dir | path join "vendor/autoload"
mkdir $autoload

$env.CARAPACE_BRIDGES = 'zsh,fish,bash'
^mise activate nu | save -f ($autoload | path join "mise.nu")
^carapace _carapace nushell | save -f ($autoload | path join "carapace.nu")
^starship init nu | save -f ($autoload | path join "starship.nu")
