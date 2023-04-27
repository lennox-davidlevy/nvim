vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _vertSplit
    autocmd!
    autocmd VimEnter * hi WinSeparator cterm=bold gui=bold guifg=#d7ffd7
  augroup end

  augroup _saveFolds
    autocmd!
    au BufWinLeave * silent! mkview
    au BufWinEnter * silent! loadview
  augroup end

]])

-- augroup transparent_background
--   autocmd!
--   autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
--   autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
-- augroup END

-- augroup AutoHighlighting
--     au!
--     autocmd CmdlineEnter /,\? set hlsearch
--     autocmd CmdlineLeave /,\? set nohlsearch
-- augroup END

-- augroup JsonToJsonc
--     autocmd! FileType json set filetype=jsonc
-- augroup END