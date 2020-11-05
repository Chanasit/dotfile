all:
	@echo "symlink config to ${HOME}"
	@sleep 0.6
	@ln -s -f ~/dotfile/.vimrc ~/.vimrc
	@ln -s -f ~/dotfile/.zshrc ~/.zshrc
	@ln -s -f ~/dotfile/.tmux.conf ~/.tmux.conf
	@ln -s -f ~/dotfile/.curlrc ~/.curlrc
	@echo "vim plug install on ${HOME}/.vim/plugged"
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@sleep 0.6
	@vim '+PlugInstall'
	@vim '+CocInstall coc-tsserver coc-python coc-go coc-html coc-css coc-vetur'
