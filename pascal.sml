fun binomCoef( col, 0 ) = 1
  | binomCoef( col, row ) =
  	 if col = row orelse col = 0 then 1 
     else binomCoef(col, row-1) + binomCoef(col-1, row-1);

fun pascalRowHelper( row, 0 ) = [1]
  | pascalRowHelper( row, col ) = pascalRowHelper( row, col-1 ) @ [binomCoef(col, row)];

fun pascalRow( row ) = pascalRowHelper( row, row );

fun pTriangles( 0 ) = [nil]
  | pTriangles( 1 ) = [pascalRow(0)]
  | pTriangles( n ) = pTriangles(n-1) @ [pascalRow(n-1)];

pTriangles(5);