PODIR=publish
KOANS=_koans
NOTES=_notes
PAGES=_pages
POSTS=_posts
READS=_reads
STATICS=_statics

all: koans reads notes pages posts statics

gh: github
github:
	git add -A && git commit -m "lazy commit" && git push

qn: qiniu
qiniu:
	qrsync conf.json

# make htmls
kns: koans
koans:
	$(MAKE) -C $(KOANS)

rds: reads
reads:
	$(MAKE) -C $(READS)

nts: notes    
notes:
	$(MAKE) -C $(NOTES)

pgs: pages
pages:
	$(MAKE) -C $(PAGES)

pts: posts
posts:
	$(MAKE) -C $(POSTS)

sts: statics
statics:
	$(MAKE) -C $(STATICS)

# clean
ckns: cleanKoans
cleanKoans:
	$(MAKE) -C $(KOANS) clean

crds: cleanReads
cleanReads:
	$(MAKE) -C $(READS) clean

cnts: cleanNotes
cleanNotes:
	$(MAKE) -C $(NOTES) clean

cpgs: cleanPages
cleanPages:
	$(MAKE) -C $(PAGES) clean

cpts: cleanPosts    
cleanPosts:
	$(MAKE) -C $(POSTS) clean

csts: cleanStatics
cleanStatics:
	$(MAKE) -C $(STATICS) clean

rm: clean
clean:
	rm -f $(PODIR)/*

# write
k: koan
koan:
	$(MAKE) -C $(KOANS) koan

n: note
note:
	$(MAKE) -C $(NOTES) note

p: post
post:
	$(MAKE) -C $(POSTS) post

r: read
read:
	$(MAKE) -C $(READS) read
    
a: about
about:
	$(MAKE) -C $(PAGES) about

l: link
link:
	$(MAKE) -C $(PAGES) link
    
d: dent
dent:
	$(MAKE) -C $(PAGES) dent

# make make
m: make
make:
	$(EDITOR) Makefile

mk: mkKoans
mkKoans:
	$(MAKE) -C $(KOANS) make

mn: mkNotes
mkNotes:
	$(MAKE) -C $(NOTES) make

mpg: mkPages
mkPages:
	$(MAKE) -C $(PAGES) make

mpo: mkPosts
mkPosts:
	$(MAKE) -C $(POSTS) make

mr: mkReads
mkReads:
	$(MAKE) -C $(READS) make

ms: mkStatics
mkStatics:
	$(MAKE) -C $(STATICS) make

c: css
css:
	$(MAKE) -C $(STATICS) css

j: js
js:
	$(MAKE) -C $(STATICS) js
