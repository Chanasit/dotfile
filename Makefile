install:
	@echo "symlink config to ${HOME}\n"
	@sleep 1.6
	@ln -s -f ~/dotfile/.vimrc ~/.vimrc
	@echo "cleanup old powerlevel10k config on ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k\n"
	@rm -rf ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k
	@sleep 1.6
	@echo "install powerlevel10k to ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k\n"
	@sleep 1.6
	@git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k
	@ln -s -f ~/dotfile/.zshrc ~/.zshrc
	@echo "install tpm to ${HOME}/.tmux/plugins/tpm\n"
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	@ln -s -f ~/dotfile/.tmux.conf ~/.tmux.conf
	@ln -s -f ~/dotfile/.p10k.zsh ~/.p10k.zsh
	@ln -s -f ~/dotfile/.curlrc ~/.curlrc
	@ln -s -f ~/dotfile/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
	@echo "vim plug install on ${HOME}/.vim/plugged\n"
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@sleep 1.6
	@vim '+PlugInstall'
fonts:
	@echo "fonts install on ${HOME}/Library/Fonts/NerdFonts/"
	@cp -r .fonts/. ${HOME}/Library/Fonts/NerdFonts/
ls:
	@echo "install coc.vim language server to ${HOME}/.config/coc/extensions/package.json"
	@sleep 1.6
	@vim '+CocInstall coc-tsserver coc-python coc-go coc-html coc-css coc-vetur coc-json coc-docker'
