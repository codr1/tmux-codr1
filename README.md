
# tmux-codr1
TMux configs.  These are my prefs. If you have good ideas - please share.  But it is my prefs.  So if I don't pref it, it won't make it in.  

## Basic Install
Clone this repo and then clone the TPM (TMux Plugin Manager)
```bash
git clone https://github.com/codr1/tmux-codr1.git ~/.config/tmux
mkdir -p ~/.config/tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

After you clone the repos, you need to install the plugins with the TPM - Tmux Plugin Manager.  To do this start Tmux.  Then Ctrl-b and then Shift-I (capital i).

## Basic Theming
This is going to install TPM, and several themes.  To view the full list of themes, run 
```bash
~/.config/tmux/switch-theme.sh
```

Selecting one of them will reload tmux.  Example:
```bash
~/.config/tmux/switch-theme.sh dracula
```


