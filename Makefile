all:
	 @echo "symlink config to ${HOME}"
	 @ln -s -f ~/dotfile/.vimrc ~/.vimrc
	 @ln -s -f ~/dotfile/.zshrc ~/.zshrc
	 @ln -s -f ~/dotfile/.tmux.conf ~/.tmux.conf
	 @ln -s -f ~/dotfile/.curl.rc ~/.curlrc
	 @echo "vim plug install"
	 @vim +PlugInstall
