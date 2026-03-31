Output demo.gif

Set Shell "zsh"
Set FontSize 14
Set Width 1200
Set Height 650
Set Theme "Catppuccin Mocha"
Set Padding 20
Set TypingSpeed 40ms
Set CursorBlink false

# Initialize environment invisibly
Hide
Type "source ~/.zshenv 2>/dev/null; source ~/.zshrc 2>/dev/null; cd ~/dotfiles; clear"
Enter
Sleep 4s
Show

# Wait for starship prompt to render
Sleep 1s

# eza: file listing with icons and git status
Type "eza -la --icons --git"
Enter
Sleep 3s

# eza: tree view of dotfiles structure
Type "eza --tree --level=1 --icons"
Enter
Sleep 3s

# bat: syntax highlighted file preview
Type "bat --line-range=1:20 --paging=never install.sh"
Enter
Sleep 3s

# git log with graph
Type "git log --oneline --graph --decorate -8"
Enter
Sleep 3s

# zoxide: smart directory navigation
Type "z ~"
Enter
Sleep 1s
Type "z dotfiles"
Enter
Sleep 2s

# Done
Type "echo 'Ready to code.'"
Enter
Sleep 3s
