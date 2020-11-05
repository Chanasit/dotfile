install:
	@echo "symlink config to ${HOME}"
	@sleep 1.6
	@ln -s -f ~/dotfile/.vimrc ~/.vimrc
	@ln -s -f ~/dotfile/.zshrc ~/.zshrc
	@ln -s -f ~/dotfile/.tmux.conf ~/.tmux.conf
	@ln -s -f ~/dotfile/.curlrc ~/.curlrc
	@echo "vim plug install on ${HOME}/.vim/plugged"
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@sleep 1.6
	@vim '+PlugInstall'

ls:
	@echo "install coc.vim language server to ${HOME}/.config/coc/extensions/package.json"
	@sleep 1.6
	@vim '+CocInstall coc-tsserver coc-python coc-go coc-html coc-css coc-vetur coc-json coc-docker'
