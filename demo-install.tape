Output demo-install.gif

Set Shell "zsh"
Set FontSize 14
Set Width 1200
Set Height 650
Set Theme "Catppuccin Mocha"
Set Padding 20
Set TypingSpeed 30ms
Set CursorBlink false

Sleep 500ms

# Show the clone + install command
Type "git clone https://github.com/Cyvid7-Darus10/dotfiles.git ~/dotfiles && cd ~/dotfiles && ./install.sh"
Enter
Sleep 2s

# Simulate installer output (hide the echo commands, show only output)
Hide
Type "clear"
Enter
Sleep 500ms
Type "echo ''"
Enter
Type "echo -e '\033[0;36m╔════════════════════════════════════════╗\033[0m'"
Enter
Type "echo -e '\033[0;36m║       Dotfiles Installation            ║\033[0m'"
Enter
Type "echo -e '\033[0;36m║       github.com/Cyvid7-Darus10       ║\033[0m'"
Enter
Type "echo -e '\033[0;36m╚════════════════════════════════════════╝\033[0m'"
Enter
Type "echo ''"
Enter
Type "echo -e '\033[0;36m━━━ Homebrew ━━━\033[0m'"
Enter
Type "echo -e '\033[0;32m[OK]\033[0m Homebrew already installed'"
Enter
Type "echo ''"
Enter
Type "echo -e '\033[0;36m━━━ Packages (Brewfile) ━━━\033[0m'"
Enter
Type "echo -e '\033[0;34m[INFO]\033[0m Installing packages from Brewfile...'"
Enter
Type "echo -e '\033[0;32m[OK]\033[0m Packages installed'"
Enter
Type "echo ''"
Enter
Type "echo -e '\033[0;36m━━━ Zinit (Zsh Plugin Manager) ━━━\033[0m'"
Enter
Type "echo -e '\033[0;32m[OK]\033[0m Zinit already installed'"
Enter
Type "echo ''"
Enter
Type "echo -e '\033[0;36m━━━ TPM (Tmux Plugin Manager) ━━━\033[0m'"
Enter
Type "echo -e '\033[0;32m[OK]\033[0m TPM already installed'"
Enter
Type "echo ''"
Enter
Type "echo -e '\033[0;36m━━━ Backup Existing Configs ━━━\033[0m'"
Enter
Type "echo -e '\033[0;32m[OK]\033[0m No existing configs to backup'"
Enter
Type "echo ''"
Enter
Type "echo -e '\033[0;36m━━━ Symlink Configs (GNU Stow) ━━━\033[0m'"
Enter
Type "echo -e '\033[0;32m[OK]\033[0m Stowed: zsh'"
Enter
Type "echo -e '\033[0;32m[OK]\033[0m Stowed: tmux'"
Enter
Type "echo -e '\033[0;32m[OK]\033[0m Stowed: nvim'"
Enter
Type "echo -e '\033[0;32m[OK]\033[0m Stowed: starship'"
Enter
Type "echo -e '\033[0;32m[OK]\033[0m Stowed: git'"
Enter
Type "echo -e '\033[0;32m[OK]\033[0m Stowed: bat'"
Enter
Type "echo -e '\033[0;32m[OK]\033[0m Stowed: ghostty'"
Enter
Type "echo -e '\033[0;32m[OK]\033[0m Stowed: lazygit'"
Enter
Type "echo ''"
Enter
Type "echo -e '\033[0;36m━━━ Done! ━━━\033[0m'"
Enter
Type "echo ''"
Enter
Type "echo -e '\033[0;32m[OK]\033[0m Installation complete!'"
Enter
Type "echo ''"
Enter
Type "echo -e '\033[0;34m[INFO]\033[0m Next steps:'"
Enter
Type "echo '  1. Restart your terminal or run: exec zsh'"
Enter
Type "echo '  2. In tmux, press Ctrl+Space then I to install plugins'"
Enter
Type "echo '  3. In Neovim, plugins will auto-install on first launch'"
Enter
Sleep 500ms
Show

Sleep 4s
