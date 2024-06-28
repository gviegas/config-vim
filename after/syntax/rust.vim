if exists("rust_space_errors")
	" trailing white space
	syn match rustSpaceError display excludenl "\s\+$"

	" mixed spaces and tabs (rare with et)
	syn match rustSpaceError display " \+\t"me=e-1
	syn match rustSpaceError display "\t\+ "me=e-1
endif

syn keyword rustCrate crate
syn keyword rustSelfImpl self Self
syn keyword rustTraitObject dyn
syn keyword rustAs as
syn keyword rustConstMut const mut

hi def link rustSpaceError Error
hi def link rustCrate Include
hi def link rustTraitObject Keyword
hi def link rustSelfImpl Keyword
hi def link rustAs Keyword
hi def link rustConstMut Keyword
hi! def link rustModPath NONE
hi! def link rustSigil NONE
