# My dot vim:

Clone this repository:

```
git clone --recursive https://github.com/wdalmut/dotvim.git .vim
```

Link vimrc file

```
ln -s ~/.vim/.vimrc ~/.vimrc
```

Now launch vim and issue the install command...

```
:BundleInstall
```

Reload the configuration

```
,V
```

## Tagbar for PHP

After install all bundles go into `bundle/tagbar-phpctags.vim` and create the phar using the Makefile

```
bundle/tagbar-phpctags.vim$ make

```

