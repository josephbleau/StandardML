fun listUntil( nil, e ) = nil
  | listUntil( x::xs, e ) = 
  		if x <> e then x::listUntil(xs, e)
        else nil; 

fun listAfter( nil, e ) = nil
  | listAfter( x::xs, e ) = 
  		if x = e then xs
  		else listAfter(xs, e);

fun insert( nil, key, value ) = [(key, value)]
  | insert( x::xs, key, value ) = 
  	let
  	    val k = #1(x) 
  	    val v = #2(x) 
  	    val entry = (k, v)
  	    val newEntry = (k, value)
  	in
  		if k = key then 
  			listUntil( x::xs, entry ) @ [newEntry] @ listAfter( x::xs, entry )
  		else
  			x :: insert( xs, key, value )
  	end;

fun dictHasKey( nil, key ) = false
  | dictHasKey( (k,v)::xs, key ) = (k  = key) orelse dictHasKey( xs, key );

fun dictValue( nil, key ) = ~1
  | dictValue( (k,v)::xs, key ) =
	    if k  = key then v 
	    else dictValue( xs, key );

fun occurrences( nil, data ) = data
  | occurrences( x::xs, data ) = 
  	let
  	    val newData = if dictHasKey(data, x) then insert( data, x, dictValue(data, x) + 1 )
                      else insert( data, x, 1 );
  	in
  	    occurrences( xs, newData )
  	end	;

fun max ( (k,v)::nil ) = (k,v)
  | max ( (k,v)::(x,y)::ys ) = if v < y then max( (x,y)::ys ) else max ( (k,v)::ys );

fun onlyMaxItems( nil, n : int ) = nil
  | onlyMaxItems( (k,v)::xs, n ) = if v = n then (k,v) :: onlyMaxItems( xs, n )
                                   else onlyMaxItems( xs, n );

fun mode( nil ) = nil
  | mode( lst ) =
  	let
  	    val occurrs = occurrences( lst, nil )
  	    val maxOccurrence = max( occurrs )
  	    val modeList = onlyMaxItems( occurrs, #2(maxOccurrence) );
  	in
  	    modeList
  	end;

mode [1,1,2,3,5,8];
mode [1,3,5,2,3,5];
mode [true, false, true, true];