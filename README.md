vimrc
=====

My [vimrc](https://github.com/rubinovk/.vim/blob/master/vimrc) is a compilation of the most useful vimrc's I've seen so far


## Install Vim environment on a machine

```bash
cd ~
git clone http://github.com/rubinovk/.vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule update --init
```

## Add new bundles

```bash
git submodule add http://github.com/foo.git bundle/foo
```

## Upgrade all bundled plugins

Each installed plugin that comes from github is a submodule in this project.  
To updrade all the plugins just run: 

```bash
cd ~/.vim
git submodule foreach git pull origin master
```

---
inspired by [vimcasts.org](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)
