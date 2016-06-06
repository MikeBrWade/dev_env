" Vim syntax file
" Language:	Green Hills Project Files
" Maintainer:	Mike Wade <Michael.Wade@gmail.com>
" Last Change:	2016 May 20

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" A bunch of useful C keywords
syn keyword	cStatement	Subproject
syn keyword	cLabel		outputDir Program INTEGRITY Application

syn match       perlComment     "#.*"
syn match       perlSharpBang   "^#!.*"


" vim: ts=8
