all: out

out: lex.yy.c tptp.tab.c
	gcc lex.yy.c tptp.tab.c -o TPTP_to_KeY

lex.yy.c: tptp.l tptp.tab.h
	flex tptp.l

tptp.tab.c tptp.tab.h: tptp.y
	bison -d tptp.y

clean:
	rm -f TPTP_to_KeY lex.yy.c tptp.tab.c tptp.tab.h