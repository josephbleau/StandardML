
fun listAfterN( nil, N ) = nil
  | listAfterN( X::XS, 0 ) = XS 
  | listAfterN( X::XS, N ) = listAfterN( XS, N-1 );

fun matchList( nil, nil ) = false
  | matchList( nil, Y::YS ) = true
  | matchList( X::XS, Y::YS ) = 
  		if X = Y then matchList( XS, YS )
  		else false;

fun subStringHelper( N, nil, nil ) = ~1
  | subStringHelper( N, X::XS, nil ) = ~1
  | subStringHelper( N, X::XS, Y::YS ) = 
		if matchList( X::XS, Y::YS ) then N 
		else subStringHelper( N+1, X::XS, YS )


fun subString( _, "" ) = ~1
  | subString( "", _ ) = ~1
  | subString( A, B ) = subStringHelper( 0, explode A, explode B );

subString( "bc", "abcabc" );
subString( "aaa", "aaaa" );
subString( "bc", "ABC" );