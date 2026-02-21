# Neovim Configuration — LazyVim + Neovide

A performance-oriented Neovim configuration built on the LazyVim framework and optimized specifically for the Neovide graphical interface.

This setup is designed to deliver a clean, modular, and production-ready development environment with smooth rendering and consistent behavior across workflows.

---

## Overview

This configuration leverages the modular architecture of LazyVim to provide a structured and maintainable setup. It integrates modern Lua-based plugins while applying GUI-specific optimizations for Neovide to ensure high-quality text rendering and fluid interaction.

The objective is to provide a stable, scalable, and professional development environment suitable for daily use.

---

## Design Principles

- Performance-focused initialization using Lazy.nvim
- Modular plugin architecture for scalability and maintainability
- GUI optimization tailored for Neovide
- Clean structure with minimal redundancy
- Sensible defaults aligned with professional development standards

---

## System Requirements

The following components are required for full functionality:

| Component | Requirement |
|-----------|-------------|
| Neovim | Version 0.9.0 or higher |
| Neovide | Latest stable release ( winget install Neovide.Neovide )|
| Nerd Font | Patched font (JetBrainsMono Nerd Font recommended) |
| Git | Required for plugin management |
| Ripgrep | Required for Telescope live grep functionality |

---

## Neovide Optimization

This configuration includes:

- GUI-specific rendering optimizations
- High-DPI display support
- Refined font configuration
- Controlled animation behavior
- Stable and consistent visual output

These adjustments ensure Neovide operates with minimal latency while preserving visual clarity.

---

## Installation

### 1. Backup Existing Configuration

#### 🪟 Windows (PowerShell)

```powershell
Rename-Item $env:LOCALAPPDATA\nvim nvim.bak -ErrorAction SilentlyContinue
Rename-Item $env:LOCALAPPDATA\nvim-data nvim-data.bak -ErrorAction SilentlyContinue
```

#### 🐧 Linux / macOS

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

---

### 2. Clone the Repository

> Replace the repository URL below with your actual GitHub repository link.

#### 🪟 Windows (PowerShell)

```powershell
git clone https://github.com/nileshpratapsingh/neovim-config.git $env:LOCALAPPDATA\nvim
```

#### 🐧 Linux / macOS

```bash
git clone https://github.com/nileshpratapsingh/neovim-config.git ~/.config/nvim
```

---

### 3. Launch Neovim

```bash
nvim
```

On first launch, Lazy.nvim will automatically install all required plugins.

### 4. Launch using neovide
```bash
neovide
```
---

## Notes

- Ensure a Nerd Font is installed and configured in Neovide.
- Ripgrep must be available in your system PATH for Telescope live grep functionality.
- This configuration is optimized for Neovide but works in terminal Neovim as well.


