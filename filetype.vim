if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	au! BufRead,BufNewFile *.gltf	set ft=json
	au! BufRead,BufNewFile *.glsl	set ft=glsl
	au! BufRead,BufNewFile *.vert	set ft=glsl
	au! BufRead,BufNewFile *.frag	set ft=glsl
	au! BufRead,BufNewFile *.comp	set ft=glsl
	au! BufRead,BufNewFile *.tesc	set ft=glsl
	au! BufRead,BufNewFile *.tese	set ft=glsl
	au! BufRead,BufNewFile *.geom	set ft=glsl
	au! BufRead,BufNewFile *.mesh	set ft=glsl
	au! BufRead,BufNewFile *.task	set ft=glsl
	au! BufRead,BufNewFile *.hlsl	set ft=hlsl
augroup END
