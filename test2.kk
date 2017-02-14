BEGIN 
INT a = 5; 
INT b = 0; 
END

BEGIN
IF ( a > b )
 THEN 
	a = 5 ;	
 ENDIF 
IF ( b < a ) THEN 
 	c = 0 ;
 ELSE c = 1 ;
ENDIF
ECHO b ; 
END
