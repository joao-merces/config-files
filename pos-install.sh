#!/bin/bash

sudo pacman -S base-devel git firefox thunderbird discord libreoffice vim neovim gedit nautilus xdg-user-dirs baobab eog evince file-roller gnome-backgrounds gnome-calculator gnome-control-center gnome-disk-utility gnome-system-monitor gnome-tweaks vlc python-pip gvfs-mtp gvfs-gphoto2 rust yarn intellij-idea-community-edition glade 

# YAY
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si

# Fontes
yay -S ttf-jetbrains-mono-nerd
git clone https://aur.archlinux.org/ttf-ms-fonts.git
cd ttf-ms-fonts/
makepkg -si

# Fontes de emojis
mkdir .config/fontconfig
touch fonts.conf
echo "<?xml version=1.0?>
<fontconfig>
 <alias>
   <family>sans-serif</family>
   <prefer>
     <family>Noto Sans</family>
     <family>Noto Color Emoji</family>
     <family>Noto Emoji</family>
     <family>DejaVu Sans</family>
   </prefer> 
 </alias>

 <alias>
   <family>serif</family>
   <prefer>
     <family>Noto Serif</family>
     <family>Noto Color Emoji</family>
     <family>Noto Emoji</family>
     <family>DejaVu Serif</family>
   </prefer>
 </alias>

 <alias>
  <family>monospace</family>
  <prefer>
    <family>Noto Mono</family>
    <family>Noto Color Emoji</family>
    <family>Noto Emoji</family>
   </prefer>
 </alias>
</fontconfig>" > fonts.conf

# Outros
yay -S brave-bin
cargo install exa bat

# Desenvolvimento
yay -S jdk vscodium-bin visual-studio-code-bin
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)

# PowerLevel10K
yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

yay -S ttf-meslo-nerd-font-powerlevel10k powerline-fonts awesome-terminal-fonts

# Mudando de bash para zsh
chsh -s /usr/bin/zsh

# Alterando o .zshrc
echo"# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# LunarVim Path
export PATH=~/.cargo/bin:~/.local/bin:$PATH

# Aliases bat e exa
alias ls="exa --icons"
alias cat=bat --style=auto""

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/merces/.anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/merces/.anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/merces/.anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/merces/.anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
" > .zshrc

# Criando diretórios padrão do sistema
xdg-user-dirs

# Modificando aparencias

git clone https://github.com/daniruiz/flat-remix-gtk && git clone https://github.com/daniruiz/flat-remix
mkdir .themes .icons
mv flat-remix/* ~/.icons/
mv flat-remix-gtk/* ~/.themes/