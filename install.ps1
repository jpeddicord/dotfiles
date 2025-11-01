# windows variant of install.sh
scoop install nu mise

$mise_config_dir = Join-Path $home '.config/mise'
if (!(Test-Path $mise_config_dir)) {
    $target = Resolve-Path 'files/_config/mise'
    New-Item -ItemType SymbolicLink -Path $mise_config_dir -Value $target
}
$mise_confd = Join-Path $home '.config/mise/conf.d'
if (!(Test-Path $mise_confd)) {
    New-Item -ItemType Directory -Path $mise_confd
}
$mise_dotfiles = Join-Path $home '.config/mise/conf.d/dotfiles.toml'
if (!(Test-Path $mise_dotfiles)) {
    $target = Resolve-Path 'mise.global.toml'
    New-Item -ItemType SymbolicLink -Path $mise_dotfiles -Value $target
}

mise doctor
mise install
mise run setup
