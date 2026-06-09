# Dependencies

Homebrew packages (formulae, casks, taps) are tracked in the [`Brewfile`](./Brewfile).

Install everything on a new system (after installing Homebrew itself):

```sh
brew bundle install --file=~/dotfiles/Brewfile
```

Refresh the Brewfile after installing/removing tools:

```sh
brew bundle dump --describe --force --file=~/dotfiles/Brewfile
```
