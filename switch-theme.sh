#!/bin/bash
# ~/.config/tmux/switch-theme.sh

THEMES_DIR="$HOME/.config/tmux/themes"
CURRENT_THEME_FILE="$THEMES_DIR/current_theme.conf"

# Get the active tmux config file
TMUX_CONFIG=$(tmux display-message -p "#{config_files}" | cut -d',' -f1)

# Fallback to default locations if tmux command fails
if [ -z "$TMUX_CONFIG" ]; then
    if [ -f "$HOME/.config/tmux/tmux.conf" ]; then
        TMUX_CONFIG="$HOME/.config/tmux/tmux.conf"
    elif [ -f "$HOME/.tmux.conf" ]; then
        TMUX_CONFIG="$HOME/.tmux.conf"
    else
        echo "Error: Could not determine tmux config location"
        exit 1
    fi
fi

echo "Using tmux config: $TMUX_CONFIG"

# Check if a theme name was provided
if [ -z "$1" ]; then
    echo "Error: No theme specified"
    echo "Usage: $0 <theme_name>"
    echo "Available themes:"
    ls -1 "$THEMES_DIR" | grep "\.conf$" | sed 's/\.conf$//'
    exit 1
fi

THEME_NAME="$1"
THEME_FILE="$THEMES_DIR/${THEME_NAME}.conf"

# Check if the theme file exists
if [ ! -f "$THEME_FILE" ]; then
    echo "Error: Theme '$THEME_NAME' not found"
    echo "Available themes:"
    ls -1 "$THEMES_DIR" | grep "\.conf$" | sed 's/\.conf$//'
    exit 1
fi

# Create symbolic link to the selected theme
ln -sf "$THEME_FILE" "$CURRENT_THEME_FILE"

# Reload tmux configuration
if tmux source-file "$TMUX_CONFIG" 2>/dev/null; then
    echo "Theme switched to $THEME_NAME"
else
    echo "Error: Failed to reload tmux configuration"
    exit 1
fi
