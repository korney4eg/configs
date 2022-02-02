" <Leader><Leader> -- Open last buffer.
nnoremap <Leader><Leader> <C-^>
" Mapping groups:
" * Git
" * Buffers
" * Files
" * cOnfigs
" * Code
" * Debug
" * Projects
" * Execute
" * Terminal
" * Search

" === Files
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>

" === Buffers
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>

" === Search
nnoremap <leader>s <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>sw <cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

" === [;]Configs
nnoremap <leader>of <cmd>lua require('telescope.builtin').find_files({path_display = { 'shorten', }, file_ignore_patterns = {"^.*/.git/.*$"},search_dirs = {"~/configs/"}})<cr>
nnoremap <leader>os Debug<cmd>lua require('telescope.builtin').live_grep( file_ignore_patterns = {"^.*/.git/.*$"},search_dirs = {"~/configs/"}})<cr>

" === Code
" Diagnostics
nnoremap <leader>cd <cmd>Telescope diagnostics<cr>

" === Debug
nnoremap <leader>db <cmd>lua require'dap'.toggle_breakpoint()<cr>
nnoremap <leader>ds <cmd>lua require'dap'.continue()<cr>
nnoremap <leader>dq <cmd>lua require'dap'.close()<cr>
nnoremap <leader>dt <cmd>lua require'dapui'.toggle()<cr>


" === Execute
nnoremap <leader>x :call usefull#save_and_exec()<CR>


" === GIT mappings
" Open git window
nnoremap <Leader>gs :Git<CR>
" git push
nnoremap <Leader>gp :silent Git pushr<CR>

" Refresh configuration
nnoremap <Leader>r :source ~/configs/nvim/init.vim<CR>
