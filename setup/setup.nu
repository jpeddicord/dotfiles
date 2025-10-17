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

    if (sys host | get name) == "Darwin" {
      create_new_links files-macos ~
      create_new_links files-macos/_config ~/.config
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
    let to_link = glob --exclude ["_*"] $"($source_dir)/*"
    for link_target in $to_link {
        let link_path = [$target_dir, ($link_target | path basename)] | path join
        make_link $link_path $link_target
    }
}

def make_link [link_path: path, link_target: path] {
    if ($link_path | path exists -n) {
        let existing_type = $link_path | path type
        let expanded = $link_path | path expand
        if $existing_type != "symlink" {
            print $"Skipping ($link_path) \(($existing_type)\) (ansi bg_y)\(existing file\)(ansi rst)"
        } else if $expanded != $link_target {
            print $"Skipping ($link_path) -> ($expanded) (ansi bg_y)\(mistargeted\)(ansi rst)"
        } else {
            print $"(ansi d)Skipping ($link_path) -> ($expanded)(ansi rst)"
        }
    } else {
        ln -s $link_target $link_path
        print $"(ansi bg_b)Linked ($link_path) -> ($link_target)(ansi rst)"
    }
}
