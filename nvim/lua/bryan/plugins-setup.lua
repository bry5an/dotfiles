local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer plugin manager
  use 'wbthomason/packer.nvim'
  -- My plugins

  use 'bluz71/vim-nightfly-guicolors' -- preferred colorscheme
  use 'christoomey/vim-tmux-navigator' -- tmux & split window navigation
  use 'szw/vim-maximizer' -- maximizes and restores current window
--  use 'nathom/filetype.nvim'
  use 'hashivim/vim-terraform'

  -- essential plugins
  use 'tpope/vim-surround' 
  use 'vim-scripts/ReplaceWithRegister'
  use 'nvim-lua/plenary.nvim'

  -- commenting with gc
  use 'numToStr/Comment.nvim'

  -- file explorer
  use 'nvim-tree/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'

  -- statusline
  use 'nvim-lualine/lualine.nvim'

  -- fuzzy finding w/ telescope
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- dependency for better sorting performance
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' } -- fuzzy finder

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
