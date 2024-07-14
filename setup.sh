#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

files="netpower;utils/get_wol_cmd.sh;utils/install_wol.sh;src/add.sh;src/remove.sh;src/up.sh"

IFS=';'

for file in $files; do
    full_path="$script_dir/$file"
    if [ -f "$full_path" ]; then
        chmod +x "$full_path"
        echo "Made executable: $file"
    else
        echo "File not found: $file"
    fi
done

unset IFS

add_to_path_file() {
    local config_file="$1"
    if [ -f "$config_file" ]; then
        if ! grep -q "export PATH=.*$script_dir" "$config_file"; then
            echo "export PATH=\$PATH:$script_dir" >> "$config_file"
            echo "Added $script_dir to $config_file"
        else
            echo "$script_dir already in $config_file"
        fi
    fi
}

# Detect shell and update appropriate config file
case "$SHELL" in
    */zsh)
        add_to_path_file "$HOME/.zprofile"
        echo "Please run 'source ~/.zprofile' to update the PATH in the current shell"
        ;;
    */bash)
        add_to_path_file "$HOME/.bashrc"
        echo "Please run 'source ~/.bashrc' to update the PATH in the current shell"
        ;;
    *)
        echo "Unsupported shell. Please add the following line to your shell configuration file:"
        echo "export PATH=\$PATH:$script_dir"
        ;;
esac
