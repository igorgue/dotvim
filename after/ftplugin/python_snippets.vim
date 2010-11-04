if !exists('loaded_snippet') || &cp
    finish
endif

" Given a string containing a list of arguments (e.g. "one, two = 'test'"),
" this function cleans it up by removing useless whitespace and commas.
function! PyCleanupArgs(text)
    if a:text == 'args'
        return ''
    endif
    let text = substitute(a:text, '\(\w\)\s\(\w\)', '\1,\2', 'g')
    return join(split(text, '\s*,\s*'), ', ')
endfunction

" Given a string containing a list of arguments (e.g. "one = 'test', *args,
" **kwargs"), this function returns a string containing only the variable
" names, separated by spaces, e.g. "one two".
function! PyGetVarnamesFromArgs(text)
    let text = substitute(a:text, 'self,*\s*', '',  '')
    let text = substitute(text, '\*\*\?\k\+', '',  'g')
    let text = substitute(text,   '=.\{-},',    '',  'g')
    let text = substitute(text,   '=.\{-}$',    '',  'g')
    let text = substitute(text,   '\s*,\s*',    ' ', 'g')
    if text == ' '
        return ''
    endif
    return text
endfunction

" Returns the current indent as a string.
function! PyGetIndentString()
    if &expandtab
        let tabs   = indent('.') / &shiftwidth
        let tabstr = repeat(' ', &shiftwidth)
    else
        let tabs   = indent('.') / &tabstop
        let tabstr = '\t'
    endif
    return repeat(tabstr, tabs)
endfunction

" Given a string containing a list of arguments (e.g. "one = 'test', *args,
" **kwargs"), this function returns them formatted correctly for the
" docstring.
function! PyGetDocstringFromArgs(text)
    let text = PyGetVarnamesFromArgs(a:text)
    if a:text == 'args' || text == ''
        return ''
    endif
    let indent  = PyGetIndentString()
    let st      = g:snip_start_tag
    let et      = g:snip_end_tag
    let docvars = map(split(text), 'v:val." -- ".st.et')
    return '\n'.indent.join(docvars, '\n'.indent).'\n'.indent
endfunction

" Given a string containing a list of arguments (e.g. "one = 'test', *args,
" **kwargs"), this function returns them formatted as a variable assignment in
" the form "self._ONE = ONE", as used in class constructors.
function! PyGetVariableInitializationFromVars(text)
    let text = PyGetVarnamesFromArgs(a:text)
    if a:text == 'args' || text == ''
        return ''
    endif
    let indent      = PyGetIndentString()
    let st          = g:snip_start_tag
    let et          = g:snip_end_tag
    let assert_vars = map(split(text), '"assert ".v:val." ".st.et')
    let assign_vars = map(split(text), '"self._".v:val." = ".v:val')
    let assertions  = join(assert_vars, '\n'.indent)
    let assignments = join(assign_vars, '\n'.indent)
    return assertions.'\n'.indent.assignments.'\n'.indent
endfunction

" Given a string containing a list of arguments (e.g. "one = 'test', *args,
" **kwargs"), this function returns them with the default arguments removed.
function! PyStripDefaultValue(text)
    return substitute(a:text, '=.*', '', 'g')
endfunction

" Returns the number of occurences of needle in haystack.
function! Count(haystack, needle)
    let counter = 0
    let index = match(a:haystack, a:needle)
    while index > -1
        let counter = counter + 1
        let index = match(a:haystack, a:needle, index+1)
    endwhile
    return counter
endfunction

" Returns replacement if the given subject matches the given match.
" Returns the subject otherwise.
function! PyReplace(subject, match, replacement)
    if a:subject == a:match
        return a:replacement
    endif
    return a:subject
endfunction

" Returns the % operator with a tuple containing n elements appended, where n
" is the given number.
function! PyHashArgList(count)
    if a:count == 0
        return ''
    endif
    let st = g:snip_start_tag
    let et = g:snip_end_tag
    return ' % ('.st.et.repeat(', '.st.et, a:count - 1).')'
endfunction

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

" Note to users: The following method of defininf snippets is to allow for
" changes to the default tags.
" Feel free to define your own as so:
"    Snippet mysnip This is the expansion text.<{}>
" There is no need to use exec if you are happy to hardcode your own start and
" end tags

" Properties, setters and getters.
exec "Snippet prop ".st."attribute".et." = property(get_".st."attribute".et.", set_".st."attribute".et.st.et.")<CR>".st.et
exec "Snippet get def get_".st."name".et."(self):<CR>return self._".st."name".et."<CR>".st.et
exec "Snippet set def set_".st."name".et."(self, ".st."value".et."):
\<CR>self._".st."name".et." = ".st."value:PyStripDefaultValue(@z)".et."
\<CR>".st.et

" Functions and methods.
exec "Snippet def def ".st."fname".et."(".st."args:PyCleanupArgs(@z)".et."):
\<CR>\"\"\"
\<CR>".st.et."
\<CR>".st."args:PyGetDocstringFromArgs(@z)".et."\"\"\"
\<CR>".st."pass".et."
\<CR>".st.et
exec "Snippet cm ".st."class".et." = classmethod(".st."class".et.")<CR>".st.et

" Class definition.
exec "Snippet cl class ".st."ClassName".et."(".st."object".et."):
\<CR>\"\"\"
\<CR>This class represents ".st.et."
\<CR>\"\"\"
\<CR>
\<CR>def __init__(self, ".st."args:PyCleanupArgs(@z)".et."):
\<CR>\"\"\"
\<CR>Constructor.
\<CR>".st."args:PyGetDocstringFromArgs(@z)".et."\"\"\"
\<CR>".st."args:PyGetVariableInitializationFromVars(@z)".et.st.et

" Keywords
exec "Snippet for for ".st."variable".et." in ".st."ensemble".et.":<CR>".st."pass".et."<CR>".st.et
exec "Snippet pf print '".st."s".et."'".st."s:PyHashArgList(Count(@z, '%[^%]'))".et."<CR>".st.et
exec "Snippet im import ".st."module".et."<CR>".st.et
exec "Snippet from from ".st."module".et." import ".st.'name:PyReplace(@z, "name", "*")'.et."<CR>".st.et
exec "Snippet % '".st."s".et."'".st."s:PyHashArgList(Count(@z, '%[^%]'))".et.st.et
exec "Snippet ass assert ".st."expression".et.st.et
" From Kib2
exec "Snippet bc \"\"\"<CR>".st.et."<CR>\"\"\"<CR>".st.et

" Try, except, finally.
exec "Snippet trye try:
\<CR>".st.et."
\<CR>except Exception, e:
\<CR>".st.et."
\<CR>".st.et

exec "Snippet tryf try:
\<CR>".st.et."
\<CR>finally:
\<CR>".st.et."
\<CR>".st.et

exec "Snippet tryef try:
\<CR>".st.et."
\<CR>except Exception, e:
\<CR>".st.et."
\<CR>finally:
\<CR>".st.et."
\<CR>".st.et

" Other multi statement templates
" From Panos
exec "Snippet ifn if __name__ == '".st."main".et."':<CR>".st.et
exec "Snippet ifmain if __name__ == '__main__':<CR>".st.et

" Shebang
exec "Snippet sb #!/usr/bin/env python<CR># -*- coding: ".st."encoding".et." -*-<CR>".st.et
exec "Snippet sbu #!/usr/bin/env python<CR># -*- coding: UTF-8 -*-<CR>".st.et
" From Kib2
exec "Snippet sbl1 #!/usr/bin/env python<CR># -*- coding: Latin-1 -*-<CR>".st.et

" Unit tests.
exec "Snippet unittest if __name__ == '__main__':
\<CR>import unittest
\<CR>
\<CR>class ".st."ClassName".et."Test(unittest.TestCase):
\<CR>def setUp(self):
\<CR>".st."pass".et."
\<CR>
\<CR>def runTest(self):
\<CR>".st.et

function! Count(haystack, needle)
    let counter = 0
    let index = match(a:haystack, a:needle)
    while index > -1
        let counter = counter + 1
        let index = match(a:haystack, a:needle, index+1)
    endwhile
    return counter
endfunction

function! DjangoArgList(count)
    " This needs to be Python specific as print expects a
    " tuple and an empty tuple looks like this (,) so we'll need to make a
    " special case for it
    let st = g:snip_start_tag
    let et = g:snip_end_tag
    if a:count == 0
        return "()"
    else
        return '('.repeat(st.et.', ', a:count).')'
    endif
endfunction

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet mmodel class ".st.et."(models.Model):<CR>\"\"\"".st.et."\"\"\"<CR>".st.et." = ".st.et."<CR><CR>class Admin:<CR>pass<CR><CR>def __str__(self):<CR>return \"".st."s".et."\" % ".st."s:DjangoArgList(Count(@z, '%[^%]'))".et."<CR>".st.et
exec "Snippet mauto models.AutoField(".st.et.")".st.et
exec "Snippet mbool models.BooleanField()".st.et
exec "Snippet mchar models.CharField(maxlength=".st."50".et.st.et.")".st.et
exec "Snippet mcsi models.CommaSeparatedIntegerField(maxlength=".st."50".et.st.et.")".st.et
exec "Snippet mdate models.DateField(".st.et.")".st.et
exec "Snippet mdatet models.DateTimeField(".st.et.")".st.et
exec "Snippet memail models.EmailField(".st.et.")".st.et
exec "Snippet mfile models.FileField(upload_to=\"".st.et."\"".st.et.")".st.et
exec "Snippet mfilep models.FilePathField(path=\"".st.et."\"".st.et.")".st.et
exec "Snippet mfloat models.FloatField(max_digits=".st.et.", decimal_places=".st.et.")".st.et
exec "Snippet mimage models.ImageField(".st.et.")".st.et
exec "Snippet mint models.IntegerField(".st.et.")".st.et
exec "Snippet mipadd models.IPAddressField(".st.et.")".st.et
exec "Snippet mnull models.NullBooleanField()".st.et
exec "Snippet mphone models.PhoneNumberField(".st.et.")".st.et
exec "Snippet mpint models.PositiveIntegerField(".st.et.")".st.et
exec "Snippet mspint models.PositiveSmallIntegerField(".st.et.")".st.et
exec "Snippet mslug models.SlugField(".st.et.")".st.et
exec "Snippet msint models.SmallIntegerField(".st.et.")".st.et
exec "Snippet mtext models.TextField(".st.et.")".st.et
exec "Snippet mtime models.TimeField(".st.et.")".st.et
exec "Snippet murl models.URLField(verify_exists=".st."True".et.st.et.")".st.et
exec "Snippet muss models.USStateField(".st.et.")".st.et
exec "Snippet mxml models.XMLField(schema_path=\"".st.et."\"".st.et.")".st.et
exec "Snippet mfor models.ForeignKey(".st.et.")".st.et
exec "Snippet mm2o models.ForeignKey(".st.et.")".st.et
exec "Snippet mm2m models.ManyToManyField(".st.et.")".st.et
exec "Snippet mo2o models.OneToOneField(".st.et.")".st.et
exec "Snippet mman models.Manager()".st.et

source ~/.vim/after/ftplugin/django_model_snippets.vim
