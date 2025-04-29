-- vim.cmd("set expandtab")
-- vim.cmd("set tabstop=4")
-- vim.cmd("set softtabstop=4")
-- vim.cmd("set shiftwidth=4")
vim.cmd("syntax enable")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.autoformat = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 20
vim.opt.mouse = "a"
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.opt.confirm = true
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
vim.opt.guicursor = ""
vim.opt.autowrite = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showmode = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.termguicolors = true

vim.cmd([[
  highlight DiffAdd    guibg=#133700 guifg=NONE
  highlight DiffDelete guibg=#370000 guifg=NONE
]])
