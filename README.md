# Stuff

## TODO:

### Move to new way of doing lsp
I have done the first one in lua/user/lsp/lua_ls.lua
This gets imported in lua/user/lsp.lua
When the lsp's are moved there, I can consider getting rid of Mason.

### Get rid of null_ls
Check lua/user/formatters/phpcsfix.lua
It triggers php-cs-fix on php files natively.
Must have global command for it to work.
Much more clear than using null_ls. 


