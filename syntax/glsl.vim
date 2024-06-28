" Vim syntax file
" Language:	GLSL
" Maintainer: Gustavo C. Viegas
" Last Change: 2024 Jun 21

if exists("b:current_syntax")
  finish
endif

syn case match
syn keyword glslStorageClass		in out uniform buffer shared const centroid sample patch inout
syn keyword glslLayoutQualifier		layout
syn keyword glslSpecial			smooth flat noperspective highp mediump lowp invariant precise
syn keyword glslSpecial			coherent volatile restrict readonly writeonly
syn keyword glslType			void float double int uint bool
syn match glslVector			`\<[dbiu]\?vec[234]\{1}\>`
syn match glslMatrix			`\<[dbiu]\?mat[234]\{1}\(x[234]\{1}\)\?\>`
syn keyword glslOpaque
	    \ sampler1D sampler1DShadow sampler1DArray sampler1DArrayShadow
	    \ isampler1D isampler1DArray usampler1D usampler1DArray
	    \ sampler2D sampler2DShadow sampler2DArray sampler2DArrayShadow
	    \ isampler2D isampler2DArray usampler2D usampler2DArray
	    \ sampler2DRect sampler2DRectShadow isampler2DRect usampler2DRect
	    \ sampler2DMS isampler2DMS usampler2DMS
	    \ sampler2DMSArray isampler2DMSArray usampler2DMSArray
	    \ sampler3D isampler3D usampler3D
	    \ samplerCube samplerCubeShadow isamplerCube usamplerCube
	    \ samplerCubeArray samplerCubeArrayShadow
	    \ isamplerCubeArray usamplerCubeArray
	    \ samplerBuffer isamplerBuffer usamplerBuffer
	    \ image1D iimage1D uimage1D
	    \ image1DArray iimage1DArray uimage1DArray
	    \ image2D iimage2D uimage2D
	    \ image2DArray iimage2DArray uimage2DArray
	    \ image2DRect iimage2DRect uimage2DRect
	    \ image2DMS iimage2DMS uimage2DMS
	    \ image2DMSArray iimage2DMSArray uimage2DMSArray
	    \ image3D iimage3D uimage3D
	    \ imageCube iimageCube uimageCube
	    \ imageCubeArray iimageCubeArray uimageCubeArray
	    \ imageBuffer iimageBuffer uimageBuffer
	    \ texture1D texture1DArray
	    \ itexture1D itexture1DArray utexture1D utexture1DArray
	    \ texture2D texture2DArray
	    \ itexture2D itexture2DArray utexture2D utexture2DArray
	    \ texture2DRect itexture2DRect utexture2DRect
	    \ texture2DMS itexture2DMS utexture2DMS
	    \ texture2DMSArray itexture2DMSArray utexture2DMSArray
	    \ texture3D itexture3D utexture3D
	    \ textureCube itextureCube utextureCube
	    \ textureCubeArray itextureCubeArray utextureCubeArray
	    \ textureBuffer itextureBuffer utextureBuffer
	    \ sampler samplerShadow
	    \ subpassInput isubpassInput usubpassInput
	    \ subpassInputMS isubpassInputMS usubpassInputMS
syn keyword glslConditional		switch if else
syn keyword glslRepeat			while for do
syn keyword glslStatement		return break continue discard
syn keyword glslLabel			case default
syn keyword glslStruct			struct
syn region glslPreproc			start=`#`	       end=`$`
syn region glslComment			start=`//`  skip=`\\$` end=`$`		contains=glslTodo
syn region glslComment			start=`/\*`            end=`\*/`	contains=glslTodo
syn keyword glslTodo			TODO XXX FIXME NOTE			contained

" Based on "c.vim" syntax file.
syn case ignore
syn match   glslNumbers		`\<\d\|\.\d`					contains=glslNumber,glslFloat
syn match   glslNumber		`\d\+u\=\>`					contained
syn match   glslNumber		`0x\x\+u\=\>`					contained
syn match   glslNumber		`0\o\+u\=\>`					contained
syn match   glslFloat		`\d\+\(f\|lf\)`					contained
syn match   glslFloat		`\d\+\.\d*\(e[-+]\=\d\+\)\=\(f\|lf\)\=`		contained
syn match   glslFloat		`\.\d\+\(e[-+]\=\d\+\)\=\(f\|lf\)\=\>`		contained
syn match   glslFloat		`\d\+e[-+]\=\d\+\(f\|lf\)\=\>`			contained

" Highlights trailing white space and space+tab as errors.
" Based on go.vim.
syn match glslSpaceError	display excludenl "\s\+$"
syn match glslSpaceError	display " \+\t"me=e-1

hi def link glslStorageClass		StorageClass
hi def link glslLayoutQualifier 	StorageClass
hi def link glslSpecial			Special
hi def link glslType			Type
hi def link glslVector			Type
hi def link glslMatrix			Type
hi def link glslOpaque			Type
hi def link glslStruct			Type
hi def link glslConditional		Conditional
hi def link glslRepeat			Repeat
hi def link glslStatement		Statement
hi def link glslLabel			Label
hi def link glslPreproc			Preproc
hi def link glslComment			Comment
hi def link glslTodo			Todo
hi def link glslNumber			Number
hi def link glslFloat			Float
hi def link glslSpaceError		Error

"exec "syn sync minlines=50"
exec "syn sync ccomment glslComment"

let b:current_syntax = "glsl"
