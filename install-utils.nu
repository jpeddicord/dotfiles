#!/usr/bin/env nu

let repos = [
    [repo, bins];
    [starship/starship, [
        starship
    ]],
    [carapace-sh/carapace-bin, [
        carapace
    ]]
    [jdx/mise, [
        mise
    ]],
    [sxyazi/yazi, [
        yazi
    ]],
    [sharkdp/bat, [
        bat
    ]],
    [BurntSushi/ripgrep, [
        rg
    ]],
    [neovim/neovim, [
        nvim
    ]]
]

$repos | each {|r|
    let target = [~/.local/bin, ($r.bins | first)] | path join
    if ($target | path exists) {
        return {
            ...$r,
            status: 'skipped'
            path: $target
        }
    }

    let install_files = $r.bins | each {|b| ['-I', $b]} | flatten 
    dra download -a -o ~/.local/bin ...$install_files $r.repo
    return {
        ...$r,
        status: 'installed'
        path: $target
    }
}