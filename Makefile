all: bash git tmux vim

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
	ln -s ${PWD}/vim/.vimrc ~/.vimrc

.vim/autoload/plug.vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim-plugins: FORCE .vim/autoload/plug.vim
	rm -rf ~/.vim/plugged
	mkdir -p ~/.vim/autoload ~/.vim/plugged
	vim +'PlugInstall --sync' +qa

FORCE:
