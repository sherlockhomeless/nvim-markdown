" Title:        Markdown helper
" Description:  Plugin that should help with writing markdown files in vim
" Last Change:  8 November 2022
" Maintainer:   Example User <https://github.com/example-user>

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_nvimmarkdown")
    finish
endif
let g:loaded_nvimmarkdown = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
"let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/markdown-plugin/deps"
"exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

" Exposes the plugin's functions for use as commands in Neovim.
" command! -nargs=0 FetchTodos lua require("example-plugin").fetch_todos()
