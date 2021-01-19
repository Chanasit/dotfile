export OSTYPE = $(shell uname)

fonts: ## install font package
	echo "fonts install \n"
	cp -r ${PWD}/.fonts/. ${HOME}/Library/Fonts/NerdFonts/

brew: ## install brew package (osx)
	brew install --formula $(shell cat brew_formula.txt)
	brew install --cask $(shell cat brew_cask.txt)

snap: ## TODO: install snap package (ubuntu)
	echo "......"

config: ## install configuration
	echo "install vim plug \n"
	curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "install powerlevel10k \n"
	rm -rf ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k
	git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k
	echo "install oh-my-tmux \n"
	rm -rf ${HOME}/.tmux
	git clone https://github.com/gpakosz/.tmux.git ${HOME}/.tmux
	echo "symlink dotfile config \n"
	ln -vsf ${PWD}/.config/alacritty ${HOME}/.config/alacritty
	ln -vsf ${PWD}/.config/htop ${HOME}/.config/htop
	ln -vsf ${PWD}/.config/ranger ${HOME}/.config/ranger
	ln -vsf ${PWD}/.config/nvim ${HOME}/.config/nvim
	ln -vsf ${PWD}/.editorconfig ${HOME}/.editorconfig
	ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsf ${PWD}/.tmux.conf.local ${HOME}/.tmux.conf.local
	ln -vsf ${PWD}/.p10k.zsh ${HOME}/.p10k.zsh
	ln -vsf ${PWD}/.curlrc ${HOME}/.curlrc
	vim '+PlugInstall'

install: ## install all packages base on OSTYPE
ifeq (${OSTYPE}, Linux)
	echo ".........."
endif
ifeq (${OSTYPE}, Darwin)
	make -i fonts brew config
endif

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
