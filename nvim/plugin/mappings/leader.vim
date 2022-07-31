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
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files({hidden=true,file_ignore_patterns = {"^.*/.git/.*$"}})<cr>

" === Buffers
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>

" === Search
nnoremap <leader>s <cmd>lua require('telescope.builtin').live_grep({hidden=true,file_ignore_patterns = {"^.*/.git/.*$"}})<cr>
nnoremap <leader>sw <cmd>lua require('telescope.builtin').grep_string {hidden=true, search = vim.fn.expand("<cword>") }<CR>

" === [o]Configs
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

" Tabs

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>h <Plug>AirlineSelectPrevTab
nmap <leader>l <Plug>AirlineSelectNextTab

" === GIT mappings
" Open git window
nnoremap <Leader>gs :Git<CR>
" git push
nnoremap <Leader>gp :silent lua require'gh-status'.push()<CR>:q<CR>
nnoremap <Leader>gc :silent Telescope gh_checks check_runs<CR>
" nnoremap <Leader>gp :silent Git pushr<CR>

" Refresh configuration
nnoremap <Leader>r :source ~/configs/nvim/init.vim<CR>
