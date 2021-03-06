#!/bin/bash

info() {
    echo -e "\033[34m$@\033[m" # blue
}

warn() {
    echo -e "\033[33m$@\033[m" # yellow
}

error() {
    echo -e "\033[31m$@\033[m" # red
}

unset https_proxy

if [[ ! -d ~/.oh-my-zsh ]]; then
    info "Install zsh-syntax-highlighting"
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
    info "Install zsh-syntax-highlighting"
    pushd ~/.oh-my-zsh/custom/plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    popd
fi

if [[ ! -f ~/.oh-my-zsh/themes/beer.zsh-theme ]]; then
    info "Install oh-my-zsh-theme"
    curl -fsSL https://raw.github.com/shinji62/oh-my-zsh-random-emoji-theme/master/random-emoji.zsh-theme >> ~/.oh-my-zsh/themes/random-emoji.zsh-theme
fi

if [[ ! -d ~/.zjump ]]; then
    info "Install z"
    git clone https://github.com/rupa/z.git ~/.zjump
fi


if [[ ! -d ~/.oh-my-zsh/custom/plugins/cf ]]; then
    info "Install CF Plugin"
    pushd ~/.oh-my-zsh/custom/plugins
    git clone https://github.com/frodenas/cf-zsh-autocomplete-plugin.git cf
    popd
fi



if [[ ! -f ~/.oh-my-zsh/completions/hub/hub.zsh_completion ]]; then
    info "Install Hub Completion"
    mkdir -p ~/.oh-my-zsh/completions/hub
    pushd ~/.oh-my-zsh/completions/
    curl -fsSL https://raw.githubusercontent.com/github/hub/master/etc/hub.zsh_completion >> ~/.oh-my-zsh/completions/hub/hub.zsh_completion
    popd
fi


if [[ ! -f ~/.oh-my-zsh/custom/plugins/docker/ ]]; then
    info "Install Docker completion"
    mkdir -p ~/.oh-my-zsh/custom/plugins/docker/
    pushd ~/.oh-my-zsh/custom/plugins
    curl -fsSL https://raw.github.com/felixr/docker-zsh-completion/master/_docker >> ~/.oh-my-zsh/custom/plugins/docker/docker.zsh_completion
    popd
fi


if [[ ! -f ~/.oh-my-zsh/custom/plugins/kubectl/ ]]; then
    info "Install Kubectl completion"
    mkdir -p ~/.oh-my-zsh/custom/plugins/kubectl/
    pushd ~/.oh-my-zsh/custom/plugins
    curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/plugins/kubectl/kubectl.plugin.zsh >> ~/.oh-my-zsh/custom/plugins/kubectl/kubectl.zsh_completion
    popd
fi
