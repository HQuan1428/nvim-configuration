return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend (opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",

        -- web 
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "eslint-lsp",
        "prettier",

        -- C++
        "clangd",
        "clang-format",

        -- Python
        "pyright",
        "black",
        "isort",
        
      })
    end,
  },

  -- Configure coc.nvim 

  {
    "neoclide/coc.nvim",
    branch = "release",
    build = "yarn install --fronzen-lockfile",
    config = function()
      -- extension
      vim.g.coc_global_extensions = {
        -- web
        "coc-tsserver",   -- JS/TS lsp
        "coc-json",       -- JSON lsp
        "coc-html",       -- HTML lsp
        "coc-css",        -- CSS lsp
        "coc-eslint",     -- ESLint
        "coc-prettier",   -- Prettier formatter

        -- C++
        "coc-clangd",     -- Clangd lsp

        -- Python
        "coc-pyright",    -- Python lsp
        --
        --
        -- Snippets and supports
        "coc-snippets",
        "coc-emmet"       -- ho tro viet nhanh html/css
      }

     -- Keybindings quan trọng cho coc.nvim
      vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { silent = true })
      vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", { silent = true })
      vim.api.nvim_set_keymap("n", "K", "<Plug>(coc-hover)", { silent = true })
      vim.api.nvim_set_keymap("i", "<C-Space>", "coc#refresh()", { expr = true, silent = true })
      vim.api.nvim_set_keymap("i", "<CR>", 'pumvisible() ? "<C-y>" : "<CR>"', {expr = true, noremap = true})
      -- Autoformat khi lưu file
      vim.api.nvim_exec(
        [[
          autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.html,*.css,*.json,*.md,*.vue,*.svelte CocCommand prettier.formatFile
          autocmd BufWritePre *.py CocCommand python.sortImports
          autocmd BufWritePre *.py CocCommand black.format
          autocmd BufWritePre *.cpp,*.h,*.hpp,*.c,*.cc CocCommand clangd.format
        ]],
        false
      )

    end
  }
}
