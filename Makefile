fonts: ## install font package
	echo "fonts install on ${HOME}/Library/Fonts/NerdFonts/"
	cp -r ${PWD}/.fonts/. ${HOME}/Library/Fonts/NerdFonts/

brew: ## install brew package (osx)
	brew install --formula $(shell cat brew_formula.txt)
	brew install --cask $(shell cat brew_cask.txt)

snap: ## install snap package (ubuntu)
	echo "todo .. . ."

config: ## install configuration
	echo "install vim plug"
	curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	echo "cleanup old powerlevel10k config on ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k\n"
	rm -rf ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k

	echo "install powerlevel10k to ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k\n"
	git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k

	echo "symlink config to ${HOME}\n"
	ln -vsf ${PWD}/.editorconfig ${HOME}/.editorconfig
	ln -vsf ${PWD}/.gitconfig ${HOME}/.gitconfig
	ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
	ln -vsf ${PWD}/.config/htop/htoprc ${HOME}/.config/htop/htoprc
	ln -vsf ${PWD}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsf ${PWD}/.tmux.conf.local ${HOME}/.tmux.conf.local
	ln -vsf ${PWD}/.p10k.zsh ${HOME}/.p10k.zsh
	ln -vsf ${PWD}/.curlrc ${HOME}/.curlrc
	ln -vsf ${PWD}/.config/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml
	ln -vsf ${PWD}/.vim/coc-settings.json ${HOME}/.vim/coc-settings.json
	nvim '+PlugInstall'

install: ## install all packages base on OSTYPE
	make -i fonts brew config

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
