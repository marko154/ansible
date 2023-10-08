# ansible for macos and ubuntu

## remove/fix personal folder, node debugger

## setup dotfiles stow, install script

### Vim plug is not installing in the correct location

??

## Ohmyzsh

- doesn't work because of the user.
- also you cannot re-install it or else it breaks.
  - had to put a little file exist protector

### Permissions with ssh

I think its a user issue. I think that if I redo it with --become-user theprimeagen it will work better.
remove all become_user root

### Plug

I manually installed it..
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

### NVIM

bad order of tasks.

### NVIDIA Drivers

- I just don't have them...

### Where was shutter

- Come on, man

### Ansible pull

no vault
make it clone
--become-user theprimeagen
-t install . I just keep forgetting this...

- clone it with https then change remote to ssh once ssh is up.
