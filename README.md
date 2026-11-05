# Dotfiles

Dotfiles collection managed with [GNU Stow](https://www.gnu.org/software/stow/)

## Overview

The dotfiles are grouped in so called _stow packages_.
Each _package_ represents the file structure relative to `~` for a collection of dotfiles.

Here is a very basic example:

```plaintext
.
├── kitty
│   └── .config
│       └── kitty
│           └── kitty.conf
├── mc
│   └── .config
│       └── mc
│           ├── ini
│           └── menu
└── nvim
    └── .config
        └── nvim
            └── init.lua
```

Running `stow nvim` inside the dotfiles directory would then create a symlink like:

`~/.config/nvim/init.lua -> path/to/dotfiles/nvim/.config/nvim/init.lua`

This happens for every file in a _package_.

## Creating a stow package

Here's an example for creating a _stow package_ for `nvim`:

```sh
# Create the package direcotry.
mkdir -p ~/dotfiles/nvim

# Copy existing dotfiles to the package including their relative parent dirs.
# Repeat this for every file you want to include in the package.
cd ~
cp --parents .config/nvim/init.lua ~/dotfiles/nvim/

# Install the stow package.
# This replaces the original files with symlinks to the stow package.
cd ~/dotfiles
stow nvim
```

_This example assumes your `dotfiles` direcotry is located at `~/dotfiles`. The actual location does not matter though._
