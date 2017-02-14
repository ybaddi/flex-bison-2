bison:
    bison -d program.y
	
flex:
    flex program.l
	
out:
    gcc program.tab.c lex.yy.c

all : program.l program.y
	bison -d program.y
	flex program.l
	gcc program.tab.c lex.yy.c


clean : 
	rm program.tab.* lex.yy.c a.out
