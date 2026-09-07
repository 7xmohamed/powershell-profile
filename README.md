# Pretty PowerShell (7xmohamed's fork)

A clean PowerShell 7 profile for Windows Terminal with better colors, keybinds, Git shortcuts, file helpers, Terminal-Icons, oh-my-posh (cobalt2 theme), and zoxide.

> **Forked from** [ChrisTitusTech/powershell-profile](https://github.com/ChrisTitusTech/powershell-profile). All credit for the original design and architecture goes to Chris Titus Tech.

## What Changed from Upstream

This fork strips the profile down to a personal, self-managed setup:

| Area | Upstream | This fork |
|---|---|---|
| Auto-update | Auto-updates from GitHub every 7 days | Removed (managed manually) |
| WinUtil helpers | `winutil`, `winutildev`, `windev` | Removed (not used) |
| Editor priority | `nvim`, `pvim`, `vim`, `vi`, `code`, `codium`, `notepad++`, `sublime_text` | `nvim`, `vim`, `zed`, `code`, `notepad++` |
| Legacy module path | Not present | Added (`WindowsPowerShell\Modules` in `$env:PSModulePath`) |
| `gp` alias | Active (`Set-Alias gp gpush`) | Commented out (conflicts with `git pull` habit) |
| Theme file | Downloaded at setup time | `cobalt2.omp.json` bundled in this repo |

## Install

Run PowerShell as Administrator inside Windows Terminal:

```powershell
irm "https://github.com/7xmohamed/powershell-profile/raw/main/setup.ps1" | iex
```

The installer:

- Backs up an existing profile with a timestamped `oldprofile-*.ps1` file.
- Installs this repository's `Microsoft.PowerShell_profile.ps1`.
- Installs Oh My Posh, zoxide, Terminal-Icons, and the CaskaydiaCove Nerd Font.
- Downloads the `cobalt2.omp.json` theme into your PowerShell profile directory.

The profile itself does **not** auto-update, download themes, or upgrade PowerShell at shell startup. Missing optional tools are skipped with a warning.

After installing, restart Windows Terminal and set your PowerShell font to `CaskaydiaCove NF`.

## What's Included

- PSReadLine colors, list-view suggestions, and shell-friendly keybinds.
- Optional `Terminal-Icons`, `oh-my-posh` (cobalt2 theme), and `zoxide` startup.
- Git shortcuts: `gs`, `ga`, `gcom`, `gpush`, `gpull`, `gcl`, `lazyg`.
- File helpers: `touch`, `mkcd`, `trash`, `ff`, `head`, `sed`, `which`.
- Process/system helpers: `pgrep`, `pkill`, `k9`, `uptime`.
- Navigation/listing helpers: `g`, `docs`, `la`, `ll`.

Run `Show-Help` in PowerShell to see the full command list.

## Theme

By default, the profile uses the bundled `cobalt2.omp.json` theme placed in:

```
$Home\Documents\PowerShell\cobalt2.omp.json
```

Set `POSH_THEME` to use a different oh-my-posh theme path.

## Customize

Put personal customizations in your all-hosts profile:

```powershell
Edit-Profile
```

You can also place `CTTcustom.ps1` beside `Microsoft.PowerShell_profile.ps1`. It is loaded first before override variables and functions are read.

## Supported Overrides

Variables:

```powershell
$EDITOR_Override
$show_help_Override
```

Functions:

```powershell
Update-PowerShell_Override
Clear-Cache_Override
Get-Theme_Override
Set-PredictionSource_Override
```

Avoid calling the original function from its override, otherwise the override will recurse.
