# Dependencies

Three tools, one job each.

| Tool         | Owns                                                                                                              | Declared in                                                           |
| ------------ | ----------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| **mise**     | Language runtimes, package managers, language servers and formatters: anything a project may pin at a version      | `out/mise/default/mise/config.toml` (global), `mise.toml` per project |
| **Homebrew** | Machine-wide CLIs, apps (casks), shell plugins, build libraries                                                   | [`Brewfile`](./Brewfile)                                              |
| **Nix**      | Per-project dev shells that need native libraries. Nothing at user or system level                                | `flake.nix` per project, entered via direnv                           |

Where does a new tool go?

- Would a project ever pin its version? → mise
- Is it just a tool I want everywhere? → Homebrew
- Does the project need a C/C++ toolchain or system libraries? → Nix flake

One exception: `terraform` lives in mise. It is not in homebrew-core any more
and is version-sensitive per project.

`rm` is aliased to Homebrew's `trash` by full path: the formula is keg-only,
and the built-in `/usr/bin/trash` rejects `rm` flags like `-rf`.

Runtimes that Homebrew installs as dependencies of other formulae (Python for
borgmatic and qmk, Ruby for fastlane) are fine. mise is ahead of Homebrew on
`PATH`, so they never answer to `python3` or `ruby`.

## New machine

1. Install Homebrew, then `brew bundle install --file=~/dotfiles/Brewfile`
2. `cd ~/dotfiles && dotdotdotfiles compile && dotdotdotfiles link` (the gem
   picks up `.dotfiles.yml` from the current directory; `link` then symlinks
   `~/.dotfiles.yml` to it, so later runs work from anywhere)
3. `mise install`
4. Install Determinate Nix; `direnv allow` in the projects whose flake you use

## Day to day

- `bi <formula>` installs with Homebrew and adds it to the Brewfile
  (`HOMEBREW_BUNDLE_FILE` points at it). Avoid `brew bundle dump --force`: it
  drops the `trusted: true` marker on red-cli, and the next
  `brew bundle cleanup` then removes the trust.
- `mise use -g <tool>@<version>` for a global runtime or language server,
  `mise use <tool>@<version>` inside a project.
- Team flakes in work projects stay untouched; only `direnv allow` a project
  when its Nix shell is the one you want there.
