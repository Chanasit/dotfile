all:
	@echo Run \'make install\' to install my dotfile.
	@echo Run \'make fonts\' to install Hack Nerd Fonts.
fonts:
	@echo "fonts install on ${HOME}/Library/Fonts/NerdFonts/"
	@cp -r .fonts/. ${HOME}/Library/Fonts/NerdFonts/
install:
	@echo "symlink config to ${HOME}\n"
	@ln -s -f ~/dotfile/.editorconfig ~/.editorconfig
	@ln -s -f ~/dotfile/.vimrc ~/.vimrc
	@ln -s -f ~/dotfile/.config/htop/htoprc ~/.config/htop/htoprc
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@ln -s -f ~/dotfile/.config/nvim/init.vim ~/.config/nvim/init.vim
	@echo "cleanup old powerlevel10k config on ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k\n"
	@rm -rf ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k
	@echo "install powerlevel10k to ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k\n"
	@git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k
	@ln -s -f ~/dotfile/.zshrc ~/.zshrc
	@echo "cleanup old tpm ${HOME}/.tmux/plugins/tpm\n"
	@rm -rf ${HOME}/.tmux/plugins/tpm
	@echo "install tpm to ${HOME}/.tmux/plugins/tpm\n"
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	@ln -s -f ~/dotfile/.tmux.conf ~/.tmux.conf
	@ln -s -f ~/dotfile/.p10k.zsh ~/.p10k.zsh
	@ln -s -f ~/dotfile/.curlrc ~/.curlrc
	@ln -s -f ~/dotfile/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
	@nvim '+PlugInstall'
