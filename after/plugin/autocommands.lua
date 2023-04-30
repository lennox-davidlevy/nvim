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

  augroup myBetterColors
    au!
    autocmd colorscheme * hi! link DiagnosticSignError Normal
    autocmd colorscheme * hi DiagnosticSignError gui=bold guifg=#ff2800 
    autocmd colorscheme * hi! link DiagnosticSignWarn Normal
    autocmd colorscheme * hi DiagnosticSignWarn guifg=#ff2800 
    autocmd colorscheme * hi! link DiagnosticSignHint Normal
    autocmd colorscheme * hi DiagnosticSignHint guifg=#FBFBFB 
    autocmd colorscheme * hi! link DDiagnosticSignInfo Normal
    autocmd colorscheme * hi DiagnosticSignInfo guifg=#FBFBFB
    autocmd colorscheme * hi! link GitGutterAdd Normal
    autocmd colorscheme * hi GitGutterAdd guifg=#ffb000
    autocmd colorscheme * hi! link GitGutterChange Normal
    autocmd colorscheme * hi GitGutterChange guifg=#ffb000
    autocmd colorscheme * hi! link GitGutterDelete Normal
    autocmd colorscheme * hi GitGutterDelete guifg=#ffb000
    autocmd colorscheme * hi! link GitGutterChangeDelete Normal
    autocmd colorscheme * hi GitGutterChangeDelete guifg=#ffb000
    autocmd colorscheme * hi MatchParen guibg=NONE guifg=#FFFF00 gui=bold
    autocmd colorscheme * hi Visual guibg=#000000 guifg=#ffb000 gui=reverse
    autocmd colorscheme * hi Search guifg=#FFFF00 guibg=NONE 
    autocmd colorscheme * hi IncSearch guifg=#FFFF00 guibg=NONE gui=bold
  augroup END

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

-- Unusued

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
-- augroup AutoHighlighting
--     au!
--     autocmd CmdlineEnter /,\? set hlsearch
--     autocmd CmdlineLeave /,\? set nohlsearch
-- augroup END


    -- autocmd colorscheme * hi Search ctermbg=white ctermfg=black guibg=#FBFBFB guifg=#000000 gui=bold
    -- autocmd colorscheme * hi Visual guibg=#000000 guifg=#ffb000 gui=reverse
    -- autocmd colorscheme * hi Search guifg=#000000 guibg=#FBFBFB gui=bold
    -- autocmd colorscheme * hi IncSearch guifg=#000000 guibg=#FBFBFB gui=bold
    -- autocmd colorscheme * hi MatchParen guibg=#ffb000 guifg=#1e232b gui=NONE
    -- autocmd colorscheme * hi MatchParen guibg=NONE guifg=#ffb000 gui=bold
    -- autocmd colorscheme * hi DiagnosticSignError gui=bold guifg=#FF69B4 
    -- autocmd colorscheme * hi DiagnosticSignWarn guifg=#FF69B4 
