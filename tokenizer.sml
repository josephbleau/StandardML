fun listUntil( nil, E ) = nil
  | listUntil( X::XS, E ) = 
  		if X <> E then X::listUntil(XS, E)
        else nil; 

fun listAfter( nil, E ) = nil
  | listAfter( X::XS, E ) = 
  		if X = E then XS
  		else listAfter(XS, E);

fun stringTokenizerHelper( nil, D ) = nil 
  | stringTokenizerHelper( X, D ) = 
  		implode( listUntil(X, D)) :: stringTokenizerHelper( listAfter( X, D), D );

fun stringTokenizer( S, D ) = 
		if size S = 0 then nil
    	else stringTokenizerHelper( explode S, D );

stringTokenizer ("this is a string", #" ");
stringTokenizer ("1,2,3,4,5", #",");
stringTokenizer ("this is a string", #",");