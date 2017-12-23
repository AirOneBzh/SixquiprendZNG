##########################################################

CFLAGS = -g -Wall `pkg-config --cflags MLV`
LDFLAGS = `pkg-config --libs-only-other --libs-only-L MLV`
LDLIBS = `pkg-config --libs-only-l MLV`



prog: cleanprog sqp
	-rm -rf *.o

all: prog progpropre pdf

sqp: sqp.o jeu.o cartes.o interface.o
	$(CC) sqp.o jeu.o cartes.o interface.o $(CFLAGS) $(LDFLAGS) $(LDLIBS) -o sqp

sqp.o: sqp.c
	$(CC) -c sqp.c $(CFLAGS) $(LDFLAGS) $(LDLIBS)

cartes.o: cartes.c cartes.h
	$(CC) -c cartes.c $(CFLAGS) $(LDFLAGS) $(LDLIBS)

jeu.o: jeu.c jeu.h
	$(CC) -c jeu.c $(CFLAGS) $(LDFLAGS) $(LDLIBS)


interface.o: interface.c interface.h
	$(CC) -c interface.c $(CFLAGS) $(LDFLAGS) $(LDLIBS)

pdf: latex cleanlatex

latex: rapport.tex
	pdflatex rapport.tex

clean:
	rm -rf *.o sqp *.aux *.fdb_latexmk *.fls *.log *.synctex.gz *~

cleanprog:
	rm -rf *.o sqp *~

progpropre:
	-rm -rf *.o *~

cleanlatex:
	rm -rf *.aux *.fdb_latexmk *.fls *.log *.synctex.gz *~
