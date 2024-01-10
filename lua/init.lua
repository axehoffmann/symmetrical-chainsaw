local o = vim.opt

o.number = true
o.relativenumber = true
o.ignorecase = true
o.virtualedit:append 'onemore'

-- init lazy.nvm
print(vim.fn.stdpath("data"))
local lazyPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazyPath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
    		"--branch=stable", -- latest stable release
    		lazypath,
  	})
end
vim.opt.rtp:prepend(lazyPath)


require("lazy").setup({
	{
		"nvim-treesitter/nvim-treesitter", 
		build = ":TSUpdate"
	}, 
	{
    		'nvim-telescope/telescope.nvim', tag = '0.1.5',
    		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim', 
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	}
})

