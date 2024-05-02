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

## if clipboard reveals '-clipboard'

once try to copy or paste contents in system clipboard, someone suddenly finds his/her vim editor doesn't work at all, and print vim version shows that clipboard functionality is `-`

it puzzles a lot, luckily, here is a possible way of resolving this problem.

to install `vim-gtk3` or so.

if you are using ubuntu or debian, using apt will easily to install

```sh
sudo apt install vim-gtk3
```

then works

## config coc-nvim

```sh
CocInstall coc-clangd
CocInstall coc-json
```

```sh
{
  "clangd.arguments": [
    "--compile-commands-dir=build/"
  ],
  "suggest.noselect": true
}
```
