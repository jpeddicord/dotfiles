for dir in ~/.config/fish/modules/*
    set fish_function_path $fish_function_path[1] $dir/functions $fish_function_path[2..-1]
    set fish_complete_path $fish_complete_path[1] $dir/completions $fish_complete_path[2..-1]

    for file in $dir/conf.d/*.fish
        source $file
    end
end