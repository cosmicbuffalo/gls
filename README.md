# gls (Git-list)

A directory listing tool for developers that shows git status at a glance.

## Features

- Lists directories with git branch and status info
- Shows uncommitted changes (`*`), commits ahead (`↑`), and commits behind (`↓`)
- Detects nested git repos with changes inside non-repo directories
- Color-coded output:
  - **Cyan** — branch name (with remote tracking)
  - **Yellow** — branch name (no remote), dirty/ahead directory names, nested changes
  - **Bright red** — ahead count
  - **Bright blue** — behind count
  - **Gray** — non-repo directories with no nested changes

## Install

**One-liner:**

```bash
curl -fsSL https://raw.githubusercontent.com/cosmicbuffalo/gls/main/install.sh | bash
```

**From source:**

```bash
git clone https://github.com/cosmicbuffalo/gls.git
cd gls
./install.sh
```

Installs to `~/.local/bin` by default. Override with `GLS_INSTALL_DIR`:

```bash
GLS_INSTALL_DIR=/usr/local/bin ./install.sh
```

## Usage

```bash
gls            # list directories in current dir
gls ~/projects # list directories in a specific path
```

## Requirements

- zsh
- git

## License

MIT
