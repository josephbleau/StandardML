fun listUntil( nil, e ) = nil
  | listUntil( x::xs, e ) = 
  		if x <> e then x::listUntil(xs, e)
        else nil; 

fun listAfter( nil, e ) = nil
  | listAfter( x::xs, e ) = 
  		if x = e then xs
  		else listAfter(xs, e);

fun insertAt( nil, n, value ) = [value]
  | insertAt( x::xs, n, value ) = if n = 0 then value::x::xs 
                                  else x::insertAt(xs, n-1, value);

fun interleave( nil ) = []
  | interleave( y::nil ) = [[y]]
  | interleave( y::ys ) = 
  		let
  		    fun core( 1, value, x ) = [value::x]
			  | core( n, value, x ) = insertAt( x, n-1, value ) :: core(n-1, value, x);

  		in
  		    core( length (y::ys), y, ys )
  		end;

fun genList(0) = nil
  | genList(n) = n :: genList(n-1);

fun permu(0) = nil
  | permu(1) = [[[1]]]
  | permu(n) = 
  	let
  		val lst = genList(n)
		fun core(nil) = [nil]
		  | core(x::xs) = 
		  		map(fn t => interleave(x::t)) (interleave(xs));
  	in
  		core(lst)    
  	end;

permu(0);
permu(1);
permu(2);
permu(3);
