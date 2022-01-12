# Git branch in prompt
# https://www.themoderncoder.com/add-git-branch-information-to-your-zsh-prompt/
# https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
# https://timothybasanov.com/2016/04/23/zsh-prompt-and-vcs_info.html
autoload -Uz vcs_info
precmd() {
    vcs_info
}
zstyle ':vcs_info:*' formats '(%b)'
GIT_BRANCH='${vcs_info_msg_0_}'

# %n - username
# %m - macbook model
# %/ - full path
# %~ - directory from home
# %F/%f - start/end foreground color
# %K/%k - start/end background color
export PS1="%F{cyan}%n: %F{white}%~ %F{green}$GIT_BRANCH %F{red}$ %f"
