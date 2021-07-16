-- file type plugin
-- vim.g.Imap_UsePlaceHolders = 0
-- vim.g.Imap_StickyPlaceHolders = 0
-- vim.g.suppress_latex_suite = 1
vim.cmd 'packadd! matchit'

vim.opt.runtimepath:append('~/.vim/JpFormat.vim')
-- vim.opt.formatexpr=[[jpfmt#formatexpr()]]
vim.opt.formatexpr=[[jpvim#formatexpr()]]
vim.g.jpvim_remove_youon = 1
vim.g.JpFormatCursorMovedI = 1
vim.g.jpfmt_paragraph_regexp = '-^[「'
vim.cmd [[au BufRead *.txt JpSetAutoFormat]]
vim.cmd [[au BufRead *.md JpSetAutoFormat]]

-- Auto Packer Install
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
if not packer_exists then
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end
  local directory = string.format(
    '%s/site/pack/packer/opt/',
    vim.fn.stdpath('data')
  )
  vim.fn.mkdir(directory, 'p')
  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))
  print(out)
  print("Downloading packer.nvim...")
  return
end

require('packer').startup{ function(use)
  -- Packer
  use {'wbthomason/packer.nvim', opt = true}

  -- Utilities
  use 'skywind3000/asyncrun.vim'
  use 'easymotion/vim-easymotion'
  -- use 'vim-jp/vimdoc-ja'
  use 'junegunn/vim-easy-align'
  use 'tpope/vim-commentary'
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'lewis6991/gitsigns.nvim'}
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use '9mm/vim-closer'
  use 'MattesGroeger/vim-bookmarks'
  use 'kshenoy/vim-signature'
  use 'tpope/vim-fugitive'
  use 'yggdroot/indentline'
  use 'akinsho/nvim-toggleterm.lua'
  -- use 'sotte/presenting.vim'
  -- use 'kana/vim-textobj-user'
  -- use 'rbonvall/vim-textobj-latex'
  -- DashBoard
  use 'glepnir/dashboard-nvim'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-refactor'

  -- Appearance
  use {'morhetz/gruvbox', setup = function() vim.cmd 'colo gruvbox' end}
  use {'lifepillar/vim-gruvbox8'} -- GruvBox 8
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'honza/vim-snippets'
  use 'SirVer/ultisnips'

  -- File Operations
  use 'kyazdani42/nvim-tree.lua'
  -- use 'junegunn/fzf.vim'
  use 'kyazdani42/nvim-web-devicons'
  use 'tom-anders/telescope-vim-bookmarks.nvim'
  use {'nvim-telescope/telescope.nvim',
      disable = false}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', disable = false}
  use {'theHamsta/nvim_rocks'}
  use {'majutsushi/tagbar', disable = false}
  use {'godlygeek/tabular', opt = true}
  use {'puremourning/vimspector', opt = true}
  use {'lilydjwg/colorizer', opt = true, disable = true}
  use {'mbbill/undotree', opt = true}

  -- FileType Plugins
  use {'chrisbra/csv.vim', ft = {'csv', 'tsv'}}
  use {'junegunn/goyo.vim', ft = {'txt', 'markdown', 'md'}}
  use {'previm/previm', ft = {'markdown', 'md'}}
  use {'cespare/vim-toml', ft = 'toml'}
  use 'plasticboy/vim-markdown'
  use {'mattn/emmet-vim', ft = {'html', 'markdown', 'md'}}
  use {'vim-latex/vim-latex', ft = {'tex', 'markdown'}}
  use {'lervag/vimtex', ft = {'markdown', 'md', 'tex'}}
  use {'lvht/tagbar-markdown', ft = {'markdown', 'md'}}

  -- LSP
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/nvim-compe'}
  end,
  config = {
    display = {
      open_fn = require'packer.util'.float,
    },
    profile = {
      enable = true,
      threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
    }
  }
}
