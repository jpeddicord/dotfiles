# needs conf-after.d to load this from either .local/bin or system path
if type -q mise
    mise activate fish | source
    alias m mise
end