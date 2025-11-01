# don't run this directly; use install.sh

const workdir = path self ..

def main [] {
    cd $workdir
    clean_broken_links ~
    clean_broken_links ~/.config
    clean_broken_links ~/.ssh

    create_new_links files ~
    create_new_links files/_config ~/.config
    create_new_links files/_ssh ~/.ssh

    if (is_macos) {
        create_new_links files-macos ~
        create_new_links files-macos/_config ~/.config
    }

    if (is_windows) {
        make_link $nu.default-config-dir ./files/_config/nushell
    }
}

def clean_broken_links [dir: path] {
    let broken = ls -al $dir | where $it.type == 'symlink' and not ($it.target | path exists);

    if (($broken | length) > 0) {
        print $broken;
        print "Broken links found. Remove them? (y/n)"

        if ((input) == 'y') {
            $broken | each {|link| rm -v $link.name}
        }
    }
}

def create_new_links [source_dir: path, target_dir: path] {
    # 'glob' on windows doesn't work with backslashes or drive letters
    let glob_path = [$source_dir, '*'] | path join | str replace --all '\' '/'
    let to_link = glob --exclude ["_*", ".DS_Store", "._*"] $glob_path
    for link_target in $to_link {
        let link_path = [$target_dir, ($link_target | path basename)] | path join
        make_link $link_path $link_target
    }
}

def make_link [link_name: path, link_target: path] {
    let full_target = $link_target | path expand
    if ($link_name | path exists -n) {
        let existing_type = $link_name | path type
        let expanded = $link_name | path expand
        if $existing_type != "symlink" {
            print $"Skipping ($link_name) \(($existing_type)\) (ansi bg_y)\(existing file\)(ansi rst)"
        } else if $expanded != $link_target {
            print $"Skipping ($link_name) -> ($expanded) (ansi bg_y)\(mistargeted\)(ansi rst)"
        } else {
            print $"(ansi d)Skipping ($link_name) -> ($expanded)(ansi rst)"
        }
    } else {
        print $"(ansi bg_b)Linking ($link_name) -> ($link_target)(ansi rst)"
        if (is_windows) {
            let flags = if ($link_target | path type) == 'dir' {['/d']} else {[]}
            ^mklink ...$flags $link_name $full_target
        } else {
            ln -s $full_target $link_name
        }
    }
}

def is_macos [] {
    (sys host | get name) == "Darwin"
}

def is_windows [] {
    (sys host | get name) == "Windows"
}
