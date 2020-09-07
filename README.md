# dotvim

## install

First, get vim-plug:

https://github.com/junegunn/vim-plug

Install as it says in the instruction.

Then run installer:

```sh
./install.sh
```

First time opening `vim` might give you some errors, those are the missing plugins

## install plugins

```sh
:PlugInstall
```

Reboot vim or nvim or gvim or macvim (it works on all).

I use `coc` for the auto-complete, each extension requires its own care, but in general you need `nodejs` installed, install via apt or do:

```sh
curl -sL install-node.now.sh/lts | bash
```

And that's it, enjoy.