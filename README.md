# Homebrew Tap

Personal Homebrew tap for custom formulae.

## Usage

```bash
brew tap zamua/tap
brew install <formula>
```

## Available Formulae

### hunktastic

Terminal diff viewer for agent changesets, with [difftastic](https://difftastic.wilfred.me.uk)
structural diffs. Fork of [hunk](https://github.com/modem-dev/hunk).

```bash
brew install zamua/tap/hunktastic
```

Pulls in `difftastic`, which the structural engine runs as a subprocess. Turn it on
per run with `hunk diff --engine difftastic`, or set `engine = "difftastic"` in
`~/.config/hunk/config.toml`. Conflicts with the `hunk` formula, since both install a
`hunk` binary. macOS arm64 only for now.

### termdaw

Terminal-based Digital Audio Workstation with vim-style navigation.

```bash
brew install zamua/tap/termdaw
```
