# 🚀 Neovim Config — Personal Development Setup

> A fast, minimal, and productivity-focused Neovim configuration for modern development.

---

## ✨ Overview

This repository contains my personal Neovim setup, designed with a strong focus on:

- ⚡ **Performance** — fast startup, no unnecessary plugins  
- 🧠 **Productivity** — keymaps and workflows optimized for real-world coding  
- 🧩 **Modularity** — clean structure, easy to extend and maintain  
- 💻 **Multi-language development** — supports Rust, C/C++, JavaScript, and more  

---

## 🧩 Features

### 🧠 Core Editor
- Fully configured in Lua (no legacy Vimscript)
- Efficient window navigation
- Custom keymaps designed for speed
- Heavy use of `<leader>` for quick actions

---

### 🔍 Search & Navigation
- Powered by Telescope:
  - `<leader>ff` → Find files  
  - `<leader>fg` → Live grep  
  - `<leader>fb` → Buffers  
- Fast project navigation

---

### 📌 File Management (Harpoon)
- Quickly mark important files
- Instant navigation between them
- Ideal for large projects

---

### 🌿 Git Integration
- Inline git change indicators
- Navigate between hunks
- Perform actions directly from the editor

---

### 🧱 LSP (Language Server Protocol)
- Intelligent autocompletion
- Real-time diagnostics
- Go to definition / references
- Hover documentation

---

### ⚡ Autocompletion
- Configured completion engine
- Snippet support
- Fast and contextual suggestions

---

### 🎨 UI / UX
- Custom dashboard on startup
- Clean and distraction-free interface
- Icons via devicons

---

### 🖥️ Integrated Terminal
- Run programs without leaving Neovim
- Optimized workflow for Rust (`cargo run`)
- Smooth development loop

---

## ⌨️ Keymaps

### Window Navigation
```
Ctrl + h → left  
Ctrl + j → down  
Ctrl + k → up  
Ctrl + l → right  
```

### Telescope
```
<leader>ff → Find files  
<leader>fg → Live grep  
<leader>fb → Buffers  
```

### Harpoon
```
<leader>a → Add file  
<leader>1-8 → Navigate between marked files  
```

### Git
```
<leader>gs → Git actions  
```

---

## 📁 Project Structure

```
nvim/
├── init.lua
├── lua/
│   ├── core/
│   │   ├── options.lua
│   │   ├── keymaps.lua
│   │   ├── system.lua
│   │   └── autocmds.lua
│   ├── plugins/
│   │   ├── init.lua
│   │   ├── theme.lua
│   │   ├── telescope.lua
│   │   ├── harpoon.lua
│   │   ├── treesitter.lua
│   │   ├── lsp.lua
│   │   ├── gitsigns.lua
│   │   ├── fugitive.lua
│   │   ├── conform.lua
│   │   ├── toggleterm.lua
│   │   ├── flash.lua
│   │   ├── lualine.lua
│   │   ├── multicursor.lua
│   │   ├── oil.lua
│   │   └── dashboard.lua
```

---

## ⚙️ Installation

### 1. Clone the repository
```
git clone https://github.com/itscovart/nvim-cova ~/.config/nvim
```

### 2. Launch Neovim
```
nvim
```

### 3. Install plugins
Plugins will be installed automatically via the configured plugin manager.

---

## 🛠️ Requirements

- Neovim ≥ 0.9  
- Git  
- Node.js (for some LSPs)  
- gcc-15/g++-15 (for c/c++ programs)
- ripgrep (for Telescope)  
- Cargo (for Rust development)  

---

## 🧪 Supported Languages

- Rust 🦀  
- C / C++  
- Python 

---

## 🚀 Philosophy

This setup is not trying to be:

- ❌ Over-engineered  
- ❌ Bloated with plugins  
- ❌ Fancy but slow  

Instead, it aims to be:

- ✅ Fast  
- ✅ Predictable  
- ✅ Maintainable  
- ✅ Focused on real productivity  

---

## 🔮 Roadmap

- [ ] Better debugging integration  
- [ ] Advanced snippet system  
- [ ] Improved support for large-scale projects  
- [ ] Enhanced dashboard UX  

---

## 🤝 Contributions

This is a personal setup, but suggestions and improvements are always welcome.

---

## 📌 Final Notes

This configuration evolves as I continue learning about:

- Systems programming  
- Low-level languages  
- Developer tooling  

