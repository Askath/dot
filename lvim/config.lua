lvim.colorscheme = "catppuccin_macchiato"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.opt.relativenumber = true
vim.opt.shell = "/bin/sh"

vim.opt.showtabline = 0
lvim.builtin.bufferline.active = false

lvim.transparent_window = true

lvim.builtin.telescope.extensions = {
  file_browser = {
    hijack_netrw = true,
    theme = "dropdown",
    path = "%:p:h",
    respect_gitignore = true,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
  },
}

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "file_browser")
  pcall(telescope.load_extension, "neoclip")
  -- any other extensions loading
end


vim.keymap.set('n', ',tt', ":ToggleTerm<CR>", { desc = "Show Code Structure" })
vim.keymap.set('n', ',cs', ":SymbolsOutline<CR>", { desc = "Show Code Structure" })
vim.keymap.set('n', 'gt', ":TodoTrouble keywords=FIX,HACK,WARN,PERF,TEST,AGENDA<CR>", { desc = "Show TODOs" })
vim.keymap.set('n', 'gs', ":SymbolsOutline<CR>", { desc = 'Structure' })
vim.keymap.set('n', ',?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', ',se', ":Telescope file_browser<CR>", { desc = '[F]ile [B]rowser' })
vim.keymap.set('n', ',/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })


-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.treesitter.rainbow = {
  enable = true,
  -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
  extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  max_file_lines = nil, -- Do not enable for files with more than n lines, int
  -- colors = {}, -- table of hex strings
  -- termcolors = {} -- table of colour name strings
}

lvim.plugins = {
  { 'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup()
    end
  },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "MunifTanjim/eslint.nvim" },
  { 'catppuccin/vim' },
  { 'j-hui/fidget.nvim' },
  {
    "ggandor/lightspeed.nvim"
  },
  { "arcticicestudio/nord-vim" },

  {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {
        default_mappings = true
      }
    end
  },


  { "p00f/nvim-ts-rainbow" },
  { 'karb94/neoscroll.nvim' },
  { 'kdheepak/lazygit.nvim' },
  { "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup {
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "info" },
          AGENDA = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        }
      }
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { 'simrat39/symbols-outline.nvim' }
}

require('neoscroll').setup()

local opts = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  relative_width = true,
  width = 25,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { '', '' },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = { "<Esc>", "q" },
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = { icon = "", hl = "TSURI" },
    Module = { icon = "", hl = "TSNamespace" },
    Namespace = { icon = "", hl = "TSNamespace" },
    Package = { icon = "", hl = "TSNamespace" },
    Class = { icon = "𝓒", hl = "TSType" },
    Method = { icon = "ƒ", hl = "TSMethod" },
    Property = { icon = "", hl = "TSMethod" },
    Field = { icon = "", hl = "TSField" },
    Constructor = { icon = "", hl = "TSConstructor" },
    Enum = { icon = "ℰ", hl = "TSType" },
    Interface = { icon = "ﰮ", hl = "TSType" },
    Function = { icon = "", hl = "TSFunction" },
    Variable = { icon = "", hl = "TSConstant" },
    Constant = { icon = "", hl = "TSConstant" },
    String = { icon = "𝓐", hl = "TSString" },
    Number = { icon = "#", hl = "TSNumber" },
    Boolean = { icon = "⊨", hl = "TSBoolean" },
    Array = { icon = "", hl = "TSConstant" },
    Object = { icon = "⦿", hl = "TSType" },
    Key = { icon = "🔐", hl = "TSType" },
    Null = { icon = "NULL", hl = "TSType" },
    EnumMember = { icon = "", hl = "TSField" },
    Struct = { icon = "𝓢", hl = "TSType" },
    Event = { icon = "🗲", hl = "TSType" },
    Operator = { icon = "+", hl = "TSOperator" },
    TypeParameter = { icon = "𝙏", hl = "TSParameter" }
  }
}
require("symbols-outline").setup(opts)
require "fidget".setup {}



local null_ls = require("null-ls")
local eslint = require("eslint")

null_ls.setup()

eslint.setup({
  bin = 'eslint', -- or `eslint_d`
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "save", -- or `save`
  }
}
)
require("lvim.lsp.manager").setup("angularls")
