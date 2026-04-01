Output demo.gif

Set Shell "zsh"
Set FontSize 16
Set Width 1200
Set Height 700
Set Theme "Catppuccin Mocha"
Set Padding 20
Set TypingSpeed 35ms
Set CursorBlink false
Set LoopOffset 99%

# Initialize environment invisibly
Hide
Type "source ~/.zshenv 2>/dev/null; source ~/.zshrc 2>/dev/null; cd ~/dotfiles; clear"
Enter
Sleep 4s
Show

# 1. Let the beautiful Starship prompt shine
Sleep 2s

# 2. Gorgeous file listing — icons, colors, git status (ls → eza)
Type "ls"
Enter
Sleep 2.5s

# 3. Tree view of the project with beautiful icons
Type "lt"
Enter
Sleep 3s

# 4. Syntax-highlighted file preview (cat → bat)
Type "cat Brewfile"
Enter
Sleep 3.5s

# 5. Beautiful git diffs with syntax highlighting (delta)
Type "gd HEAD~1"
Enter
Sleep 3.5s

# 6. Smart directory navigation — jump anywhere instantly
Type "z ~"
Enter
Sleep 1s
Type "z dotfiles"
Enter
Sleep 2s

# 7. Fuzzy file finder with live preview (Ctrl+T)
Ctrl+T
Sleep 2.5s
Escape
Sleep 1s

# 8. Pretty git log with graph
Type "gl"
Enter
Sleep 3s

# 9. Quick weather check — one command
Type "weather"
Enter
Sleep 3s

# End — let the beauty sink in
Type "clear"
Enter
Sleep 1s
Type "echo '  All of this. One install command. Zero config.'"
Enter
Sleep 4s
