# Homebrew Tap

Personal Homebrew tap for custom formulae.

## Usage

```bash
brew tap zamua/tap
brew install <formula>        # command-line tools
brew install --cask <name>    # apps
```

## Available Casks

### sitesearch

Custom website search for Spotlight on macOS Tahoe. Configure keyword-to-URL
mappings, then search any of them from Spotlight: `ss`, pick a site, Tab, your
query. Bookmarks open directly with `sb`. Ships a stdio MCP server so an agent
can manage sites without the GUI.

```bash
brew install --cask zamua/tap/sitesearch
```

Requires macOS 26 (Tahoe) - running App Intents actions from Spotlight is a
macOS 26 feature.

## Available Formulae

### hunktastic

Terminal diff viewer for agent changesets, with [difftastic](https://difftastic.wilfred.me.uk)
structural diffs. Fork of [hunk](https://github.com/modem-dev/hunk).

```bash
brew install zamua/tap/hunktastic
```

Pulls in `difftastic`, which the structural engine runs as a subprocess. The command is
`hunkt`, and the structural engine is on by default; `--engine pierre` opts out, and
config lives at `~/.config/hunkt/config.toml`. macOS arm64 only for now.

### termdaw

Terminal-based Digital Audio Workstation with vim-style navigation.

```bash
brew install zamua/tap/termdaw
```
