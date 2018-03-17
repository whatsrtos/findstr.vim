# findstr.vim

## Overview 
The findstr plugin integrates the MS-Windows findstr search utility with Vim. You can use this plugin to search for a pattern or text in multiple files in the current directory or in a directory tree and easily jump to the matches. This plugin is useful only on MS-Windows based systems where the findstr utility is available. 

## Screenshot
![findstr](https://raw.githubusercontent.com/WhatsDJGPP/findstr.vim/test/screenshot.png)

## Usage 
The findstr plugin introduces the `:VimFindstr`, `:Findstring`, `:Findpattern`, `:Rfindstr`, `:Rfindpattern` and `:EasyFindStr` Vim commands to search for text and patterns in files. 
* The `:VimFindstr` includes some features like EasyGrep, gives a friendly menu to show serach options.
* The `:Findstring` command is used to search for literal strings in files in the current directory. 
* The `:Rfindstring` command is used to search for a literal string in the files in a directory tree. 
* The `:Findpattern` command is used to search for a regular expression pattern in files in the current directory. 
* The `:Rfindpattern` command is used to search for a regular expression pattern in the files in a directory tree. 
* The `:EasyFindStr` command is used to search for string under current cursor in file with same extension in current directory, without any keyboard hit, more lazy

## Configuration 
*  `let Findstr_Default_Filelist = '*.c *.cpp *.asm'`
*  `let Findstr_OpenQuickfixWindow = 0`
*  `let Findstr_Exclude_Options = '.git\\ .svn\\ cvs\\ rcs\\'`

## Changelog
* 0.1b add Option `Findstr_Exclude_Options`
* 0.1c add function `EasyFindStr`
* 0.1d add function `VimFindstr`
* 0.1f bugfix, add "use vimgrep" option
