" File: findstr.vim
" Author: Yegappan Lakshmanan (yegappan AT yahoo DOT com)
" Version: 0.1g
" Last Modified: Aug 1, 2016
" 
" Overview
" --------
" The findstr.vim plugin integrates the MS-Windows findstr search utility with
" Vim. You can use this plugin to search for a pattern or text in multiple
" files in the current directory or in a directory tree and easily jump to the
" matches. This plugin is useful only in MS-Windows based systems where the
" findstr utility is available.
"
" Installation
" ------------
" 1. Copy the findstr.vim file to the $HOME/vimfiles/plugin or
"    $VIM/vimfiles/plugin directory. 
"    Refer to the following Vim help topics for more information about Vim
"    plugins:
"       :help add-plugin
"       :help add-global-plugin
"       :help runtimepath
" 2. Restart Vim.
" 3. You can now use the ":Findstring" or ":Findpattern" command to search for
"    text/patterns in files.
"
" Usage
" -----
" The findstr.vim plugin introduces the "VimFindstr", ":Findstring", ":Findpattern",
" ":Rfindstr", ":Rfindpattern" and ":EasyFindStr" Vim commands to search for text and patterns
" in files.
"
" The ":VimFindstr" includes some features like EasyGrep, gives a friendly
" menu to show serach options.
"
" The ":Findstring" command is used to search for literal strings in files in
" the current directory. The ":Rfindstring" command is used to search for a
" literal string in the files in a directory tree.
"
" The ":Findpattern" command is used to search for a regular expression
" pattern in files in the current directory. The ":Rfindpattern" command is
" used to search for a regular expression pattern in the files in a directory
" tree.
"
" The ":EasyFindStr" command is used to search for string under current cursor
" in file with same extension in current directory, without any keyboard hit, more lazy
" You can map shortcut to invoke this command. For example,
"       nnoremap <silent> <leader>ff :EasyFindStr<CR>
"
" The syntax of these commands is
"
"    :Findstring [ <options> ] [ <search_string> [ <file_name(s)> ] ]
"    :Findpattern [ <options> ] [ <search_pattern> [ <file_name(s)> ] ]
"    :Rfindstring [ <options> ] [ <search_string> [ <file_name(s)> ] ]
"    :Rfindpattern [ <options> ] [ <search_pattern> [ <file_name(s)> ] ]
"
" In the above commands, all the arguments are optional.
"
" You can specify findstr options like /i (ignore case) to the above command.
" If the <options> are not specified, then the default findstr options
" specified by the variable Findstr_Default_Options is used. Refer to the
" findstr MS-Windows documentation for the command-line options supported by
" the findstr command.
"
" You can specify the search text/pattern as an argument to the above
" commands.  If the <search_pattern> is not specified, then you will be
" prompted to enter a search pattern. By default, the keyword under the cursor
" is displayed for the search pattern prompt. You can accept the default or
" modify it. The regular expression patterns supported by the findstr command
" can be used in the pattern argument. Refer to the findstr MS-Windows
" documentation for more information.
"
" If you want to specify a search pattern with space characters or a
" multi-word pattern, then you should use the ":Findstring" command text input
" prompt to supply the pattern.
"
" You can specify one or more file names (or file patterns) to the above
" commands.  If the <file_names> are not specified, then you will be prompted
" to enter file names.  By default, the pattern specified by the
" Findstr_Default_Filelist variable is used. To specify the file name(s) as an
" argument to the above commands, you have to specify the search pattern also.
"
" When you enter only the command name, you will be prompted to enter the
" search pattern and the files in which to search for the pattern. By default,
" the keyword under the cursor is displayed for the search pattern prompt.
" Depending on the command, you may prompted for additional parameters like
" the directories to search for the pattern.
"
" You can retrieve previously entered values for the ":Findstring" prompts
" using the up and down arrow keys. You can cancel the command by pressing the
" escape key.  You can use CTRL-U to erase the default shown for the prompt
" and CTRL-W to erase the previous word in the prompt. For more information
" about editing the prompt, read ':help cmdline-editing' Vim help topic.
"
" You can cancel the ":Findstring" command when you are prompted for a search
" pattern or file names by pressing the <Esc> key. You cannot cancel (or kill)
" the findstr command after the external command is invoked.
"
" You can map a key to invoke ":Findstring". For example, the following map
" invokes the ":Findstring" command to search for the keyword under the
" cursor:
"
"       nnoremap <silent> <F3> :Findstring<CR>
"
" The output of the findstr command will be listed in the Vim quickfix window.
" 1. You can select a line in the quickfix window and press <Enter> or double
"    click on a match to jump to that line.
" 2. You can use the ":cnext" and ":cprev" commands to the jump to the next or
"    previous output line.
" 3. You can use the ":colder" and ":cnewer" commands to go between multiple
"    findstr quickfix output.
" 4. The quickfix window need not be opened always to use the findstr output.
"    You can close the quickfix window and use the quickfix commands to jump
"    to the findstr matches.  Use the ":copen" command to open the quickfix
"    window again.
"
" For more information about other quickfix commands read ":help quickfix"
" 
" Configuration
" -------------
" By changing the following variables you can configure the behavior of this
" plugin. Set the following variables in your .vimrc file using the 'let'
" command.
"
" The ":Findstring" command will prompt you for the files in which to search
" for the pattern. The 'Findstr_Default_Filelist' variable is used to specify
" to default value for this prompt. By default, this variable is set to '*'.
" You can specify multiple matching patterns separated by spaces. You can
" change this settings using the let command:
"
"       :let Findstr_Default_Filelist = '*.[chS]'
"       :let Findstr_Default_Filelist = '*.c *.cpp *.asm'
"
" The 'Findstr_Default_Options' is used to pass default command line options
" to the findstr command. By default, this is set to an empty string. You can
" change this using the let command:
"
"       :let Findstr_Default_Options = '/i'
"
" By default, when you invoke the ":Findstring" command the quickfix window
" will be opened with the search output.  You can disable opening the quickfix
" window, by setting the 'Findstr_OpenQuickfixWindow' variable  to zero:
"
"       :let Findstr_OpenQuickfixWindow = 0
"
" You can manually open the quickfix window using the :cwindow command.
"
" The 'Findstr_Exclude_Dir' specifies the list of directories to skip.
"       : let Findstr_Exclude_Dir = '.git\\ .svn\\ cvs\\ rcs\\ sccs\\'
"
" --------------------- Do not modify after this line ---------------------
if exists("loaded_findstr")
    finish
endif
let loaded_findstr = 1

" Line continuation used here
let s:cpo_save = &cpo
set cpo&vim

" Open the search output window.  Set this variable to zero, to not open
" the search output window by default.  You can open it manually by using
" the :cwindow command.
if !exists("Findstr_OpenQuickfixWindow")
    let Findstr_OpenQuickfixWindow = 1
endif

" Default search file list, such as '*.c *.py *.php'
if !exists("Findstr_Default_Filelist")
    let Findstr_Default_Filelist = '*'
endif

" Default search options
if !exists("Findstr_Use_Vimgrep")
    let Findstr_Use_Vimgrep = 0
endif

if !exists("Findstr_Default_Options")
    let Findstr_Default_Options = ""
endif

if !exists("Findstr_Exclude_Dir")
    let Findstr_Exclude_Dir = ""
endif

if !exists("Findstr_Recursive")
    let Findstr_Recursive = 1
endif

if !exists("Findstr_IgnoreCase")
    let Findstr_IgnoreCase = 1
endif

if !exists("Findstr_WholeWord")
    let Findstr_WholeWord = 0
endif

if !exists("Findstr_ExpReg")
    let Findstr_ExpReg = 0
endif

if !exists("s:Search_Directory")
    let s:Search_Directory = getcwd()
endif

let s:Search_Word = ""

let s:OptionsMenuOpen = 0

function! s:OnOrOff(num)
    return a:num == 0 ? 'off' : 'on'
endfunction

" Search Option Menu
function! s:CreateOptions()
    " add findstr options
    let s:Options = []
    call add(s:Options, "\"q: quit")
    call add(s:Options, "\"s: use vimgrep (" .s:OnOrOff(g:Findstr_Use_Vimgrep).")")
    call add(s:Options, "\"r: recursive mode (".s:OnOrOff(g:Findstr_Recursive).")")
    call add(s:Options, "\"i: ignore case (".s:OnOrOff(g:Findstr_IgnoreCase).")")
    call add(s:Options, "\"w: whole word (".s:OnOrOff(g:Findstr_WholeWord).")")
    call add(s:Options, "\"p: regular expression (".s:OnOrOff(g:Findstr_ExpReg).")")
    call add(s:Options, "")
    call add(s:Options, "\"f: search files (eg. *.h *.c): " . g:Findstr_Default_Filelist)
    call add(s:Options, "\"d: search directory: " . s:Search_Directory)
    call add(s:Options, "\"c: Search Word: " . s:Search_Word)
endfunction

function! s:MapOptionKeys()
    nnoremap <buffer> <silent> q    :call <sid>Quit()<cr>
    nnoremap <buffer> <silent> s    :call <sid>ChCmd()<cr>
    nnoremap <buffer> <silent> r    :call <sid>ToggleRecursion()<cr>
    nnoremap <buffer> <silent> i    :call <sid>ToggleIgnoreCase()<cr>
    nnoremap <buffer> <silent> w    :call <sid>ToggleWholeWord()<cr>
    nnoremap <buffer> <silent> p    :call <sid>ToggleRegExp()<cr>
    nnoremap <buffer> <silent> f    :call <sid>SetSearchFiles()<cr>
    nnoremap <buffer> <silent> d    :call <sid>SetSearchDirectory()<cr>
    nnoremap <buffer> <silent> c    :call <sid>SetSearchWord()<cr>
    nnoremap <buffer> <silent> <Enter> :call <sid>StartFinding()<cr>
endfunction

function! s:RefreshAllOptions()    
    if !s:OptionsMenuOpen
        return
    endif

    call s:CreateOptions()
    setlocal modifiable
    let lastLine = len(s:Options)
    let line = 0
    while line < lastLine
        call setline(line+1, s:Options[line])
        let line += 1
    endwhile

    setlocal nomodifiable
endfunction

function! s:SetSearchDirectory()
    let s:Search_Directory = input("Search Directory: ", s:Search_Directory)
    echo "\r"
    call s:RefreshAllOptions()
    call s:Echo("Set Search Directory to (" . s:Search_Directory .")")
endfunction

function! s:SetSearchWord()
    let s:Search_Word = input("Search Word: ", s:Search_Word)
    echo "\r"
    call s:RefreshAllOptions()
    call s:Echo("Set Search Word to (" . s:Search_Word .")")
endfunction

function! s:SetSearchFiles()
    let g:Findstr_Default_Filelist = input("Search Files: ", g:Findstr_Default_Filelist)
    echo "\r"
    call s:RefreshAllOptions()
    call s:Echo("Set Search Files to (" . g:Findstr_Default_Filelist .")")
endfunction

function! s:ToggleRecursion()
    let g:Findstr_Recursive = !g:Findstr_Recursive
    call s:RefreshAllOptions()
    call s:Echo("Set recursive to (" . s:OnOrOff(g:Findstr_Recursive) . ")")
endfunction

function s:ToggleIgnoreCase()
    let g:Findstr_IgnoreCase = !g:Findstr_IgnoreCase
    call s:RefreshAllOptions()
    call s:Echo("Set ignore case to (" . s:OnOrOff(g:Findstr_IgnoreCase) . ")")
endfunction

function! s:ToggleWholeWord()
    let g:Findstr_WholeWord = !g:Findstr_WholeWord
    call s:RefreshAllOptions()
    call s:Echo("Set whole word to (" . s:OnOrOff(g:Findstr_WholeWord) . ")")
endfunction

function! s:ToggleRegExp()
    let g:Findstr_ExpReg = !g:Findstr_ExpReg
    call s:RefreshAllOptions()
    call s:Echo("Set use ExpReg to (" . s:OnOrOff(g:Findstr_ExpReg) . ")")
endfunction

function! s:ChCmd()
    let g:Findstr_Use_Vimgrep= !g:Findstr_Use_Vimgrep
    call s:RefreshAllOptions()
    call s:Echo("Set use Vimgrep to (" . s:OnOrOff(g:Findstr_Use_Vimgrep) . ")")
endfunction

function! s:Quit()
    let s:OptionsMenuOpen = 0
    echo ""
    quit
endfunction

function! s:FillWindow()
    setlocal modifiable
    " Clear the entire window
    execute "silent %delete"

    "call s:CreateOptions()
    call append(0, s:Options)
    call s:RefreshAllOptions()

    "setlocal modifiable
    "call s:UpdateAllSelections()
    setlocal nomodifiable

    " place the cursor at the start of the special options
    execute "".len(s:Options)
endfunction

function! s:OpenOptionsMenu()
    let s:OptionsMenuOpen = 1
    call s:CreateOptions()
    let windowLines = len(s:Options)

    " split the window; fit exactly right
    exe "keepjumps botright ".windowLines."new"

    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal nobuflisted
    setlocal noswapfile
    setlocal cursorline

    syn match Help    /^".*/
    highlight def link Help Special

    syn match Activated    /^>\w.*/
    highlight def link Activated Type

    syn match Selection    /^\ \w.*/
    highlight def link Selection String

    call s:MapOptionKeys()
    call s:FillWindow()
endfunction

" MS-DOS findstr command help:
"  https://technet.microsoft.com/en-us/library/bb490907.aspx
function! VimFindstr()
    let s:Search_Word = expand("<cword>")
    call s:OpenOptionsMenu()
    " call s:SetSearchWord()
endfunction

function! s:StartFinding()
    if g:Findstr_Use_Vimgrep == 1
        call s:ExecVimgrep()
    else
        call s:ExecFindstr()
    endif
endfunction

function! s:ExecVimgrep()
    " close last quickfix first
    if s:OptionsMenuOpen == 1
        let s:OptionsMenuOpen = 0
        quit
    endif

    let cmd = 'vimgrep /' . s:Search_Word . '/j'

    let s:file_list_str = ""
    if !exists("g:Findstr_Default_Filelist")
        if(g:Findstr_Recursive == 1)
                let s:file_list_str = s:Search_Directory . '/**/*.*'
        else
            let s:file_list_str = s:Search_Directory . '*.*'
        endif
    else
        let s:file_list = split(g:Findstr_Default_Filelist)
        for tmpf in s:file_list
            if(g:Findstr_Recursive == 1)
                let s:file_list_str = s:file_list_str . ' ' . s:Search_Directory . '/**/' . tmpf
            else
                let s:file_list_str = s:file_list_str . ' ' . s:Search_Directory . '/' . tmpf
            endif
        endfor
    endif

    if(g:Findstr_IgnoreCase == 1)
        set ignorecase
    else
        set noignorecase
    endif

    let cmd = cmd . s:file_list_str

    " debug output to %temp% directory
    "let tmpfile = tempname()
    "exe "redir! > " . tmpfile
    "silent echon cmd
    "redir END

    execute "silent! " . cmd
    botright copen
    call s:AutoHighLightWord(s:Search_Word)
endfunction

function! s:ExecFindstr()
    " close option menu first
    if s:OptionsMenuOpen == 1
        let s:OptionsMenuOpen = 0
        quit
    endif

    let cmd = 'findstr '
    let options = '/N /P'
    let exclude_opt = ''

    if(!exists("s:Search_Word"))
        echo "orz..."
        return
    endif

    " make findstr options
    if(g:Findstr_Recursive == 1)
        let options = options . ' /S'
    endif

    if(g:Findstr_IgnoreCase == 1)
        let options = options . ' /I'
    endif

    if(g:Findstr_ExpReg == 1)
        let options = options . ' /R'
    else
        let options = options . ' /L'
    endif

    " @TODO
    if(g:Findstr_WholeWord ==1 )
        let s:Search_Word = s:Search_Word
    endif

    " search file list
    if (!exists("g:Findstr_Default_Filelist"))
        let g:Findstr_Default_Filelist = '*'
    endif

    " search directory
    let s:Search_Directory = substitute(s:Search_Directory, '\\$', '', '')

    " exclude directory
    if exists("g:Findstr_Exclude_Dir")
        let txt = g:Findstr_Exclude_Dir . ' '
        while txt != ''
            let one_opt = strpart(txt, 0, stridx(txt, ' '))
            let exclude_opt = exclude_opt . ' | findstr /V "' . one_opt . '"'
            let txt = strpart(txt, stridx(txt, ' ') + 1)
        endwhile
    endif

    let cmd = cmd . options
    let cmd = cmd . ' /C:"' . s:Search_Word . '"'
    let cmd = cmd . ' /D:"' . s:Search_Directory . '"'
    let cmd = cmd . ' ' . g:Findstr_Default_Filelist
    let cmd = cmd . ' ' . exclude_opt
    let cmd_output = system(cmd)

    if cmd_output == ''
        echohl WarningMsg | 
        \ echomsg "Error: Pattern " . s:Search_Word . " not found" | 
        \ echohl None
        return
    endif

    if g:Findstr_Recursive == 1
        let spat = "[^\n]\\+\n"
        let rpat = escape(s:Search_Directory, '\') . '\\&'
        let cmd_output = substitute(cmd_output, spat, rpat, "g")
    endif

    let tmpfile = tempname()

    let old_verbose = &verbose
    set verbose&vim

    exe "redir! > " . tmpfile
    silent echon '[Search results for pattern: ' . s:Search_Word . '] ' . cmd ."\n"
    silent echon cmd_output
    redir END

    let &verbose = old_verbose

    let old_efm = &efm
    set efm=%f:%\\s%#%l:%m

    if exists(":cgetfile")
        execute "silent! cgetfile " . tmpfile
    else
        execute "silent! cfile " . tmpfile
    endif

    let &efm = old_efm

    " Open the search output window
    if g:Findstr_OpenQuickfixWindow == 1
        " Open the quickfix window below the current window
        botright copen
        call s:AutoHighLightWord(s:Search_Word)
    endif

    call delete(tmpfile)
endfunction

" RunFindStr()
function! s:RunFindStr(cmd_name, cmd_opt, ...)
    if a:0 > 0 && (a:1 == "-?" || a:1 == "-h")
        echo 'Usage: ' . a:cmd_name . ' [<options>] [<search_pattern> ' .
                        \ "[<file_name(s)>]]"
        return
    endif

    let findstr_opt  = ''
    let pattern   = ''
    let filenames = ''

    " Parse the arguments
    " findstr command-line flags are specified using the "/flag" format.  The
    " next argument is assumed to be the pattern. The following arguments are
    " assumed to be file names or file patterns
    let argcnt = 1
    while argcnt <= a:0
        if a:{argcnt} =~ '^/'
            let findstr_opt = findstr_opt . " " . a:{argcnt}
        elseif pattern == ''
            let pattern = a:{argcnt}
        else
            let filenames= filenames . " " . a:{argcnt}
        endif
        let argcnt = argcnt + 1
    endwhile

    if findstr_opt == ''
        let findstr_opt = g:Findstr_Default_Options
    endif

    " Exclude directory
    let findstr_exclude = ''
    if exists("g:Findstr_Exclude_Dir")
        let txt = g:Findstr_Exclude_Dir . ' '
        while txt != ''
            let one_opt = strpart(txt, 0, stridx(txt, ' '))
            let findstr_exclude = findstr_exclude . ' | findstr /V "' . one_opt . '"'
            let txt = strpart(txt, stridx(txt, ' ') + 1)
        endwhile
    endif
    
    " Display line number for all the matching lines
    let findstr_opt = findstr_opt . ' /N ' . a:cmd_opt

    " Get the identifier and file list from user
    if pattern == '' 
        if a:cmd_name == 'Findstring' || a:cmd_name == 'Rfindstring'
            let prompt = 'Search for text: '
        else
            let prompt = 'Search for pattern: '
        endif
        let pattern = input(prompt, expand("<cword>"))
        if pattern == ''
            return
        endif
    endif

    if a:cmd_name == 'Rfindstring' || a:cmd_name == 'Rfindpattern'
        let startdir = input('Start searching from directory: ', getcwd())
        if startdir == ''
            return
        endif
        " Remove trailing backslash, if present
        let startdir = substitute(startdir, '\\$', '', '')
        let findstr_opt = findstr_opt . ' /D:' . startdir
    endif

    if filenames == ''
        let filenames = input("Search in files: ", g:Findstr_Default_Filelist)
        if filenames == ''
            return
        endif
    endif

    " Avoiding the 'Hit ENTER to continue' prompts
    echo "\r"

    let cmd = "findstr " . findstr_opt
    let cmd = cmd . ' /C:"' . pattern . '"'
    let cmd = cmd . ' ' . filenames
    let cmd = cmd . ' ' . findstr_exclude
    let cmd_output = system(cmd)

    if cmd_output == ''
        echohl WarningMsg | 
        \ echomsg "Error: Pattern " . pattern . " not found" | 
        \ echohl None
        return
    endif

    " The file names in the recursive search output are relative to the start
    " directory. Need to convert them to absolute path.
    if a:cmd_name == 'Rfindstring' || a:cmd_name == 'Rfindpattern'
        let spat = "[^\n]\\+\n"
        let rpat = escape(startdir, '\') . '\\&'
        let cmd_output = substitute(cmd_output, spat, rpat, "g")
    endif

    let tmpfile = tempname()

    let old_verbose = &verbose
    set verbose&vim

    exe "redir! > " . tmpfile
    " silent echon cmd . "\n"
    silent echon '[Search results for pattern: ' . pattern . "]\n"
    silent echon cmd_output
    redir END

    let &verbose = old_verbose

    let old_efm = &efm
    set efm=%f:%\\s%#%l:%m

    if exists(":cgetfile")
        execute "silent! cgetfile " . tmpfile
    else
        execute "silent! cfile " . tmpfile
    endif

    let &efm = old_efm

    " Open the search output window
    if g:Findstr_OpenQuickfixWindow == 1
        " Open the quickfix window below the current window
        botright copen
    endif

    call delete(tmpfile)
endfunction

function! s:EasyFindStr()
    " default opt: /N: print line num, /S:recursive, /L:search string
    let findstr_opt  = g:Findstr_Default_Options . ' /N /S /L'
    " get word under the cursor
    let string  = expand("<cword>")
    " search in files with same extension
    let ext = expand('%:e')
    if ext == ''
        let files = '*'
    else
        let files = '*.' . ext
    endif
    " search directory
    let findstr_dir = getcwd()
    " exclude directory
    let findstr_exclude = ''
    if exists("g:Findstr_Exclude_Dir")
        let txt = g:Findstr_Exclude_Dir . ' '
        while txt != ''
            let one_opt = strpart(txt, 0, stridx(txt, ' '))
            let findstr_exclude = findstr_exclude . ' | findstr /V "' . one_opt . '"'
            let txt = strpart(txt, stridx(txt, ' ') + 1)
        endwhile
    endif
    let cmd = "findstr " . findstr_opt
    let cmd = cmd . ' /D:' . findstr_dir
    let cmd = cmd . ' /C:"' . string . '"'
    let cmd = cmd . ' ' . files
    let cmd = cmd . ' ' . findstr_exclude
    let cmd_output = system(cmd)
        if cmd_output == ''
        echohl WarningMsg | 
        \ echomsg "Error: " . string . " not found" | 
        \ echohl None
        return
    endif

    let spat = "[^\n]\\+\n"
    let rpat = escape(findstr_dir, '\') . '\\&'
    let cmd_output = substitute(cmd_output, spat, rpat, "g")

    let tmpfile = tempname()
    let old_verbose = &verbose
    set verbose&vim

    exe "redir! > " . tmpfile
    silent echon '[Search results for string: ' . string . "]\n"
    "silent echon cmd . "\n"
    silent echon cmd_output
    redir END

    let &verbose = old_verbose
    let old_efm = &efm
    set efm=%f:%\\s%#%l:%m
    if exists(":cgetfile")
        execute "silent! cgetfile " . tmpfile
    else
        execute "silent! cfile " . tmpfile
    endif
    let &efm = old_efm
    botright copen
    call delete(tmpfile)
endfunction

function! s:AutoHighLightWord(match)
    let @/ = '\<' . a:match . '\>'
    return ":silent set hlsearch\<CR>"
endfunction

function! s:Echo(message)
    let str = ""
    if !s:OptionsMenuOpen
        let str .= "[Findstr] "
    endif
    let str .= a:message
    echo str
endfunction

" Define the findstr commands
command! -nargs=* -complete=file Findstring
            \ call s:RunFindStr("Findstring", "/L", <f-args>)
command! -nargs=* -complete=file Findpattern
            \ call s:RunFindStr("Findpattern", "/R", <f-args>)
command! -nargs=* -complete=file Rfindstring
            \ call s:RunFindStr("Rfindstring", "/S /L", <f-args>)
command! -nargs=* -complete=file Rfindpattern
            \ call s:RunFindStr("Rfindpattern", "/S /R", <f-args>)
command! -nargs=* -complete=file EasyFindStr
            \ call s:EasyFindStr()
command! -nargs=* -complete=file VimFindstr
            \ call VimFindstr()

" Add the Find->Findstr menu
if has('gui_running')
    anoremenu <silent> Find.Findstr.Current\ Directory<Tab>:Findstring
                \ :Findstring<CR>
    anoremenu <silent> Find.Findstr.Recursively<Tab>:Rfindstring
                \ :Rfindstring<CR>
    anoremenu <silent> Find.Findstr.RegExp<Tab>:Findpattern
                \ :Findpattern<CR>
    anoremenu <silent> Find.Findstr.RegExp\ Recursively<Tab>:Rfindpattern
                \ :Rfindpattern<CR>
    menu <silent> Find.Findstr.-Sep-
                \ :
    anoremenu <silent> Find.Findstr.VimFindstr<Tab>:VimFindstr
                \ :VimFindstr<CR>
endif
" restore 'cpo'
let &cpo = s:cpo_save
unlet s:cpo_save

