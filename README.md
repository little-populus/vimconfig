# vimconfig

## Install Plug-Manager

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim
```

Using above command to install Plug-Manager into your computer

then 

input `:PlugInstall` to install Plugs you want to install in `.vimrc`

input `:PlugUpdate` to upgrade Plugs you have installed

input `:PlugClean` to remove Plugs you have installed

intput `:PlugUpgrade` to upgrade itself

## analyze performance

```sh
vim --startuptime startup.log
```

using this to generate launch time every Plug takes

input `:profile start profile.log`

input `:profile func *`

input `:profile file *`

and then test what you want to analyze

finally input `:q`

to gain result
