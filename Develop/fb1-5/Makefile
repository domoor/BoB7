all: fb1-5

fb1-5: lex.yy.c fb1-5.tab.h fb1-5.tab.c
	cc -o $@ fb1-5.tab.c lex.yy.c -lfl

fb1-5.tab.h fb1-5.tab.c:
	bison -d fb1-5.y

lex.yy.c: fb1-5.tab.h fb1-5.tab.c
	flex fb1-5.l

clean:
	rm -rf fb1-5.tab.h fb1-5.tab.c lex.yy.c fb1-5

