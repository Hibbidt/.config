vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.swapfile = false
vim.opt.winborder= "rounded"

vim.g.mapleader = " "



vim.pack.add({

{ src = "https://github.com/nvim-treesitter/nvim-treesitter"},

})

require "nvim-treesitter.configs".setup({
	ensure_installed = {"c", "typst" },
	highlight = {enable = true}
})

vim.cmd(":hi statusline guibg=NONE")
vim.lsp.enable({"lua_ls"})


vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")


-- Keymaps/Remaps

vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format)
-- add yours here

-- vim.keymap.set( "n", "<leader>lo", ":!okular %:r.pdf &<CR><CR>", { noremap = true, silent = true, desc = "Open currnnt Buffer in Okular" })

vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
-- vim.keymap.set("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves marked block up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves marked block down" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Appends next line to current line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Halfpage down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Halfpage up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Searchterms stay in middle" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Searchterms stay in middle" })

-- greatest remap ever
vim.keymap.set("x", "<leader>ä", [["_dP]], { desc = "Overwrites selected without copying it" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to System clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to Vim clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>ö", [["_d]], { desc = "Overwrites marked without copying it" })
vim.keymap.set("n", "S", ":%s//g<Left><Left>", { desc = "Replace" })
vim.keymap.set( { "n", "v" }, "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace string under Cursor" })

-- map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Open compiler
--vim.keymap.set("n", "<F2>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
--vim.keymap.set( "n", "<S-F6>", "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo) .. "<cmd>CompilerRedo<cr>", { noremap = true, silent = true })


-- Toggle compiler results
--vim.keymap.set("n", "<F3>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

