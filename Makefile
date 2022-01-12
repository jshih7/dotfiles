all: git tmux vim zsh

bash: FORCE
	rm -f ~/.bashrc
	rm -f ~/.bash_profile
	ln -s ${PWD}/bash/.bashrc ~/.bashrc
	ln -s ${PWD}/bash/.bash_profile ~/.bash_profile

git: FORCE
	rm -f ~/.gitconfig
	ln -s ${PWD}/git/.gitconfig ~/.gitconfig

tmux: FORCE
	rm -rf ~/.tmux.conf
	ln -s ${PWD}/tmux/.tmux.conf ~/.tmux.conf

vim: vimrc vim-plugins

vimrc: FORCE
	rm -f ~/.vimrc
	rm -f ~/.ctrlpignore
	ln -s ${PWD}/vim/.vimrc ~/.vimrc
	ln -s ${PWD}/vim/.ctrlpignore ~/.ctrlpignore

vim-plugin-manager: FORCE
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim-plugins: FORCE vim-plugin-manager
	rm -rf ~/.vim/plugged
	mkdir -p ~/.vim/autoload ~/.vim/plugged
	vim +'PlugInstall --sync' +qa

oh-my-zh: FORCE
	@# oh-my-zsh needs to be installed first, because it will create its own .zshrc
	@# this will also stop the other make targets from running, probably because the shell was updated
	@# To address: https://github.com/ohmyzsh/ohmyzsh#unattended-install
	-sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

zsh: FORCE oh-my-zh
	rm -f ~/.zshrc
	ln -s ${PWD}/zsh/.zshrc ~/.zshrc
	source ~/.zshrc

FORCE:
