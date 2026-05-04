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
<leader>1-4 → Navigate between marked files  
```

### Git
```
<leader>gl → Git actions  
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
│   │   └── autocmds.lua
│   ├── plugins/
│   │   ├── telescope.lua
│   │   ├── lsp.lua
│   │   ├── harpoon.lua
│   │   ├── gitsigns.lua
│   │   └── dashboard.lua
│   └── config/
```

---

## ⚙️ Installation

### 1. Clone the repository
```
git clone https://github.com/your-username/nvim-config ~/.config/nvim
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
- ripgrep (for Telescope)  
- Cargo (for Rust development)  

---

## 🧪 Supported Languages

- Rust 🦀  
- C / C++  
- JavaScript / TypeScript  
- Python (optional)  

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

