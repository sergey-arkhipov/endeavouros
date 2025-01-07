# Description

This repo has some setup files for Endeauvor OS and some steps, prepared for comfortable work
with RoR

## Install necessary and helpful packages

`yay -S fzf mc fd ripgrep tree github-cli glab lazygit gitui broot \
postgresql-libs zsh direnv go ncdu duf vim neovim`

| Name            | Description                                                                |
| --------------- | -------------------------------------------------------------------------- |
| broot           | Fuzzy Search + tree + cd                                                   |
| direnv          | A shell extension that manages your environment                            |
| duf             | Disk Usage/Free Utility                                                    |
| fd              | Simple, fast and user-friendly alternative to find                         |
| fzf             | Command-line fuzzy finder                                                  |
| github-cli      | The GitHub CLI                                                             |
| gitui           | Blazing fast terminal-ui for git written in Rust                           |
| glab            | Cli tool to help work seamlessly with GitLab from the command line         |
| go              | Core compiler tools for the Go programming language                        |
| lazygit         | Simple terminal UI for git commands                                        |
| mc              | A file manager that emulates Norton Commander                              |
| ncdu            | Disk usage analyzer with an ncurses interface                              |
| neovim          | Fork of Vim aiming to improve user experience, plugins, and GUIs           |
| postgresql-libs | Libraries for use with PostgreSQL                                          |
| ripgrep         | A search tool that combines the usability of ag with the raw speed of grep |
| tree            | A directory listing program displaying a depth indented list of files      |
| vim             | Vi Improved, a highly configurable, improved version of the vi text editor |
| zsh             | A very advanced and programmable command interpreter (shell) for UNIX      |

## Install oh-my-zsh

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### Install some helpful plugins

```bash
git clone https://github.com/akarzim/zsh-docker-aliases.git  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker-aliases
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

```

## Install docker

```bash
yay -S docker
sudo usermod -aG docker $USER
sudo vim /etc/sysctl.conf
---
vm.overcommit_memory=1
----
sudo sysctl -f

sudo systemctl enable --now docker

```

Need logout and login after that.

## Stop rtkit-daemon from spamming logs

When there lot of messages in journalctl

```log
дек 28 13:15:32  rtkit-daemon[1857]: Supervising 7 threads of 4 processes of 1 users.
дек 28 13:15:32  rtkit-daemon[1857]: Supervising 7 threads of 4 processes of 1 users.
.....

```

```bash
sudo systemctl edit rtkit-daemon.service
# Add following
[Service]
LogLevelMax=4
#---
sudo systemctl daemon-reload
sudo systemctl restart rtkit-daemon.service

```

### Change system editor for sudo

1. Set EDITOR variable, for example `export EDITOR='nvim'`
2. Edit sudo conf

```bash
sudo visudo
# Find and edit string
Defaults env_keep += "SUDO_EDITOR EDITOR VISUAL"

```

## Add samba to connect windows and smb share

```bash
yay -S gvfs gvfs-smb

```

Optionally, can install additional deps for gvfs

````bash
yay -Qi gvfs
...
Optional Deps   : gvfs-afc: AFC support (Apple mobile devices) [installed]
                  gvfs-dnssd: DNS-SD and WebDAV support (macOS file sharing)
                  gvfs-goa: Gnome Online Accounts support (e.g. OwnCloud)
                  gvfs-google: Google Drive support
                  gvfs-gphoto2: gphoto2 support (PTP camera, MTP media player) [installed]
                  gvfs-mtp: MTP support (Android, media player) [installed]
                  gvfs-nfs: NFS support [installed]
                  gvfs-onedrive: Microsoft OneDrive support
                  gvfs-smb: SMB/CIFS support (Windows file sharing) [installed]
                  gvfs-wsdd: Web Services Dynamic Discovery support (Windows discovery)

```# Description

This repo has some setup files for Endeavor OS and some steps, prepared for comfortable work
with ROR

## Install necessary and helpful packages

`yay -S fzf mc fd ripgrep tree github-cli glab lazygit gitui broot \
postgresql-libs zsh direnv go ncdu duf vim neovim`

| Name            | Description                                                                |
| --------------- | -------------------------------------------------------------------------- |
| broot           | Fuzzy Search + tree + cd                                                   |
| direnv          | A shell extension that manages your environment                            |
| duf             | Disk Usage/Free Utility                                                    |
| fd              | Simple, fast and user-friendly alternative to find                         |
| fzf             | Command-line fuzzy finder                                                  |
| github-cli      | The GitHub CLI                                                             |
| gitui           | Blazing fast terminal-ui for git written in Rust                           |
| glab            | Cli tool to help work seamlessly with GitLab from the command line         |
| go              | Core compiler tools for the Go programming language                        |
| lazygit         | Simple terminal UI for git commands                                        |
| mc              | A file manager that emulates Norton Commander                              |
| ncdu            | Disk usage analyzer with an ncurses interface                              |
| neovim          | Fork of Vim aiming to improve user experience, plugins, and GUIs           |
| postgresql-libs | Libraries for use with PostgreSQL                                          |
| ripgrep         | A search tool that combines the usability of ag with the raw speed of grep |
| tree            | A directory listing program displaying a depth indented list of files      |
| vim             | Vi Improved, a highly configurable, improved version of the vi text editor |
| zsh             | A very advanced and programmable command interpreter (shell) for UNIX      |

## Install oh-my-zsh

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### Install some helpful plugins

```bash
git clone https://github.com/akarzim/zsh-docker-aliases.git  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker-aliases
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

````

## Install docker

```bash
yay -S docker
sudo usermod -aG docker $USER
sudo vim /etc/sysctl.conf
---
vm.overcommit_memory=1
----
sudo sysctl -f

sudo systemctl enable --now docker

```

Need to logout and login after that.

## Stop rtkit-daemon from spamming logs

When there are a lot of messages in journal

```log
дек 28 13:15:32  rtkit-daemon[1857]: Supervising 7 threads of 4 processes of 1 users.
дек 28 13:15:32  rtkit-daemon[1857]: Supervising 7 threads of 4 processes of 1 users.
.....

```

```bash
sudo systemctl edit rtkit-daemon.service
# Add following
[Service]
LogLevelMax=4
#---
sudo systemctl daemon-reload
sudo systemctl restart rtkit-daemon.service

```

### Change system editor for sudo

1. Set EDITOR variable, for example `export EDITOR='nvim'`
2. Edit sudo config

```bash
sudo visudo
# Find and edit string
Defaults env_keep += "SUDO_EDITOR EDITOR VISUAL"

```

## Add samba to connect windows and smb share

```bash
yay -S gvfs gvfs-smb

```

Optionally, can install additional deps for gvfs

```bash
yay -Qi gvfs
...
Optional Deps   : gvfs-afc: AFC support (Apple mobile devices) [installed]
                  gvfs-dnssd: DNS-SD and WebDAV support (macOS file sharing)
                  gvfs-goa: Gnome Online Accounts support (e.g. OwnCloud)
                  gvfs-google: Google Drive support
                  gvfs-gphoto2: gphoto2 support (PTP camera, MTP media player) [installed]
                  gvfs-mtp: MTP support (Android, media player) [installed]
                  gvfs-nfs: NFS support [installed]
                  gvfs-onedrive: Microsoft OneDrive support
                  gvfs-smb: SMB/CIFS support (Windows file sharing) [installed]
                  gvfs-wsdd: Web Services Dynamic Discovery support (Windows discovery)

```
