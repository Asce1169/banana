parse: lexy.l bison2.y
	bison -d bison2.y
	flex lexy.l
	gcc -o parse bison2.tab.c lex.yy.c -lfl

clean:
	rm -f  lex.yy.c bison2.tab.* parse
