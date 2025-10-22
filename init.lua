-- theme & transparency
vim.cmd.colorscheme("unokai")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- Basic settings
vim.opt.number = true         -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true     -- Highlight current line
vim.opt.wrap = false          -- Don't wrap lines
vim.opt.scrolloff = 10        -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8     -- Keep 8 columns left/right of cursor

-- Indentation
vim.opt.tabstop = 2        -- Tab width
vim.opt.shiftwidth = 2     -- Indent width
vim.opt.softtabstop = 2    -- Soft tab stop
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true  -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true  -- Case sensitive if uppercase in search
vim.opt.hlsearch = true   -- Don't highlight search results
vim.opt.incsearch = true  -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true                      -- Enable 24-bit colors
vim.opt.signcolumn =
"yes"                                             -- Always show signcolumn also fixed weird jumping when editing on a new line
vim.opt.showmatch = true                          -- Highlight matching brackets
vim.opt.matchtime = 2                             -- How long to show matching bracket
vim.opt.cmdheight = 1                             -- Command line height
vim.opt.completeopt = "menuone,noselect,popup" -- Completion options
vim.opt.winborder = "none"                        -- Border Setting for completion
vim.opt.showmode = false                          -- Don't show mode in command line
vim.opt.pumheight = 10                            -- Popup menu height
vim.opt.pumblend = 10                             -- Popup menu transparency
vim.opt.winblend = 0                              -- Floating window transparency
vim.opt.conceallevel = 0                          -- Don't hide markup
vim.opt.concealcursor = ""                        -- Don't hide cursor line markup
vim.opt.lazyredraw = true                         -- Don't redraw during macros
vim.opt.synmaxcol = 300                           -- Syntax highlighting limit

-- File handling
vim.opt.backup = false                            -- Don't create backup files
vim.opt.writebackup = false                       -- Don't create backup before writing
vim.opt.swapfile = false                          -- Don't create swap files
vim.opt.undofile = true                           -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
vim.opt.updatetime = 300                          -- Faster completion
vim.opt.timeoutlen = 500                          -- Key timeout duration
vim.opt.ttimeoutlen = 0                           -- Key code timeout
vim.opt.autoread = true                           -- Auto reload files changed outside vim
vim.opt.autowrite = false                         -- Don't auto save

-- Behavior settings
vim.opt.hidden = true                  -- Allow hidden buffers
vim.opt.errorbells = false             -- No error bells
vim.opt.backspace = "indent,eol,start" -- Better backspace behavior
vim.opt.autochdir = false              -- Don't auto change directory
vim.opt.iskeyword:append("-")          -- Treat dash as part of word
vim.opt.path:append("**")              -- include subdirectories in search
vim.opt.selection = "exclusive"        -- Selection behavior
vim.opt.mouse = "a"                    -- Enable mouse support
--vim.opt.clipboard:append("unnamedplus")            -- Use system clipboard
vim.opt.modifiable = true              -- Allow buffer modifications
vim.opt.encoding = "UTF-8"             -- Set encoding

-- Cursor settings
--vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Folding settings
--vim.opt.foldmethod = "expr"                             -- Use expression for folding
--vim.wo.vim.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding
--vim.opt.foldlevel = 99                                  -- Start with all folds open

-- Split behavior
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go right

-- Key mappings
vim.g.mapleader = " "      -- Set leader key to space
vim.g.maplocalleader = " " -- Set local leader key (NEW)




-- Plugins and there setup
vim.pack.add({
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/mason-org/mason.nvim" },
})

require "nvim-treesitter.config".setup({
  ensure_installed = { "c", "lua", "py" },
  highlight = { enable = true }
})

require "mason".setup({
  ensure_installed = { "lua-language-server", "nil", "tinymist" },
})

require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- find
        vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find files" }),
        vim.keymap.set("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", { desc = "Find all" }),
        vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" }),
        vim.keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" }),
        vim.keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", { desc = "Help page" }),
        vim.keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "Find oldfiles" }),
        vim.keymap.set("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "Find in current buffer" }),
        vim.keymap.set("n", "<leader>cm", "<cmd> Telescope git_commits <CR>", { desc = "Git commits" }),
        vim.keymap.set("n", "<leader>gt", "<cmd> Telescope git_status <CR>", { desc = "Git status" }),
        vim.keymap.set("n", "<leader>pt", "<cmd> Telescope terms <CR>", { desc = "Pick hidden term" }),
        vim.keymap.set("n", "<leader>th", "<cmd> Telescope themes <CR>", { desc = "Nvchad themes" }),
        vim.keymap.set("n", "<leader>ma", "<cmd> Telescope marks <CR>", { desc = "telescope bookmarks" }),

        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}


-- Makes the statusline transparent
vim.cmd(":hi statusline guibg=NONE")

-- lsp Recommendations
vim.lsp.enable({ "lua_ls", "tinymist" })

-- adds support for lua_ls to not show errors for the nvim functions
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method('textDocument/completion') then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow! local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

-- Keymaps/Remaps
-- Lsp
vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format { async = true } end)

vim.keymap.set("n", "<Esc>", ":noh <CR>", { desc = "Clear highlights" })

-- Quick file navigation
vim.keymap.set("n", "<leader>cd", ":Ex<CR>", { desc = "Opens Netrw" })

-- vim.keymap.set( "n", "<leader>lo", ":!okular %:r.pdf &<CR><CR>", { noremap = true, silent = true, desc = "Open currnnt Buffer in Okular" })

vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
-- vim.keymap.set("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves marked block up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves marked block down" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Appends next line to current line while staying at the start of the line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Halfpage down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Halfpage up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next searchterms stay in middle" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous searchterms stay in middle" })


-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "Previous buffer" })


-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-UP>", ":resize +2<CR>", { desc = "Increase Window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease Window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "Increase Window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "Decrease Window width" })

-- Indent in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Overwrites selected without copying it" })
vim.keymap.set({ "n", "v" }, "<leader>z", [["_d]], { desc = "Overwrites marked without copying it" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v", "x" }, "<leader>y", [["+y]], { desc = "Copy to System clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to Vim clipboard" })
vim.keymap.set("n", "S", ":%s//g<Left><Left>", { desc = "Replace" })
vim.keymap.set({ "n", "v" }, "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace string under Cursor" })

-- map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Open compiler
-- vim.keymap.set("n", "<F2>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
-- vim.keymap.set( "n", "<S-F6>", "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo) .. "<cmd>CompilerRedo<cr>", { noremap = true, silent = true })


-- Toggle compiler results
-- vim.keymap.set("n", "<F3>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })


-- Functions
-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("UserConfig", {}),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Return to last edit postion when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("UserConfig", {}),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("UserConfig", {}),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Create directories wehen saving files
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("UserConfig", {}),
  callback = function()
    local dir = vim.fn.expand('<afile>:p:h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Create undo directory if it doesnt exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
