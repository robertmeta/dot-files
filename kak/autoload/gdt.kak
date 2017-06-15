
##
## gdt.kak by lenormf
## Highlight TODO, FIXME and XXX comments
## v1.0
##

# Create a subgroup called "gdt"
addhl -group / group gdt

# Make the subgroup highlight certain keywords
addhl -group /gdt regex TODO|FIXME|XXX 0:default+rb

# Map to langs XXX
addhl -group /c/comment ref gdt
addhl -group /cabal/comment ref gdt
addhl -group /coffee/comment ref gdt
addhl -group /cpp/comment ref gdt
addhl -group /css/comment ref gdt
addhl -group /cucumber/comment ref gdt
addhl -group /dlang/comment ref gdt
addhl -group /fish/comment ref gdt
addhl -group /golang/comment ref gdt
addhl -group /haml/comment ref gdt
addhl -group /haskell/comment ref gdt
addhl -group /html/comment ref gdt
addhl -group /java/comment ref gdt
addhl -group /javascript/comment ref gdt
addhl -group /julia/comment ref gdt
addhl -group /kakrc/comment ref gdt
addhl -group /kickstart/comment ref gdt
addhl -group /lisp/comment ref gdt
addhl -group /objc/comment ref gdt
addhl -group /python/comment ref gdt
addhl -group /ragel/comment ref gdt
addhl -group /ruby/comment ref gdt
addhl -group /rust/comment ref gdt
addhl -group /sass/comment ref gdt
addhl -group /scala/comment ref gdt
addhl -group /sh/comment ref gdt
addhl -group /yaml/comment ref gdt
