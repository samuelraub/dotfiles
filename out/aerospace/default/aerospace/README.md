# AeroSpace keys

**Hyper** = cmd+alt+ctrl+shift (ZMK). Plain alt is left alone so ä/ö/ü keep
working.

## Apps

Each app has its own workspace. The key jumps there and launches the app if it
isn't running.

| Hyper + | App         | Notes                               |
| ------- | ----------- | ----------------------------------- |
| A       | Thunderbird |                                     |
| B       | Firefox     | starts on the MacBook screen        |
| C       | Calendar    |                                     |
| F       | Finder      |                                     |
| G       | Chrome      |                                     |
| P       | 1Password   | floating workspace (with Reminders) |
| R       | Reminders   | floating workspace (with 1Password) |
| S       | Signal      | shares a workspace with Telegram    |
| T       | kitty       |                                     |
| Z       | Telegram    | shares a workspace with Signal      |

System Settings and Alfred Preferences float over whatever workspace you're on.

## Everyday

| Keys          | Action                                                  |
| ------------- | ------------------------------------------------------- |
| Hyper + ←↓↑→  | focus window                                            |
| Ctrl + ←↓↑→   | focus window; in kitty, tmux pane or Neovim split       |
| Hyper + W / Q | next / previous window on this workspace                |
| Hyper + Tab   | previous workspace                                      |
| Hyper + Space | enter move mode                                         |

## Move mode

Press **Hyper + Space**, let go of Hyper, then press one key. Most keys return
to normal mode right away.

| Key          | Action                                                                                |
| ------------ | ------------------------------------------------------------------------------------- |
| ←↓↑→         | move window                                                                           |
| Shift + ←↓↑→ | join with neighbour (e.g. split the right half top–bottom)                            |
| letter       | send window to that app's workspace (Z → Signal/Telegram, P → the floating workspace) |
| Tab          | move the whole workspace to the other screen                                          |
| Shift + Tab  | move only the window to the other screen                                              |
| `-` / `=`    | shrink / grow (stays in move mode, leave with Esc)                                    |
| Space        | toggle floating / tiling                                                              |
| Enter        | fullscreen                                                                            |
| `/`          | tiles layout, toggle side-by-side / stacked                                           |
| `,`          | accordion layout                                                                      |
| Backspace    | reset layout                                                                          |
| Esc          | reload config and leave                                                               |

## Ctrl-arrows across Neovim, tmux and AeroSpace

Ctrl + ←↓↑→ moves through Neovim splits, then tmux panes, then AeroSpace
windows, on either screen. Each layer hands over at its edge:

1. **Neovim** moves between splits. Past the last split it runs the same tmux
   command as step 2 (`navigate()` in nvim-kickstart's
   `lua/custom/plugins/init.lua`).
2. **tmux** moves between panes. In the outer pane (`#{pane_at_left}` etc.) it
   runs `aerospace focus --boundaries all-monitors-outer-frame` (C-arrow
   bindings in `.tmux.conf.erb`). Servers without AeroSpace keep wrapping.
3. **AeroSpace** focuses the neighbouring window, also on the other screen.

AeroSpace bindings are global, so it also catches ctrl-arrows meant for the
terminal. `nav` sorts them out: with kitty focused, it replays the key into
tmux (`tmux send-keys -K`), and everywhere else it calls `aerospace focus`.
kitty is assumed to always run tmux.

To switch it off, delete the four `ctrl-…` lines in `aerospace.toml`; kitty
gets ctrl-arrows back right away. To remove it completely, revert the
`feat(aerospace): move between windows with ctrl-arrows` commit here and
`feat: hand ctrl-arrows on to aerospace past the last split` in
nvim-kickstart, then run `dotdotdotfiles compile` and
`tmux source-file ~/.tmux.conf`.

## Recipes

- **Three windows, 50/50 with the right half split:** focus the rightmost
  window, then Hyper + Space, Shift + ←.
- **Firefox back on the MacBook screen** (after re-plugging the monitor):
  Hyper + B, then Hyper + Space, Tab.
- **Screen shows the wrong workspace:** jump to another workspace and back.

## CLI

```sh
aerospace list-windows --all      # every window and its workspace
aerospace list-workspaces --monitor all --visible
aerospace reload-config           # shows config errors
```
