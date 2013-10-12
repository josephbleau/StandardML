fun getDayCode("Mon") = 1
  | getDayCode("Tue") = 2
  | getDayCode("Wed") = 3
  | getDayCode("Thr") = 4
  | getDayCode("Fri") = 5
  | getDayCode("Sat") = 6
  | getDayCode("Sun") = 0;

fun int2str( 0 ) = ""
  | int2str( I ) = int2str( I div 10 ) ^ str( chr( (I mod 10) + 48 ) );

fun calendar( "", currentDay, 0, 0, offset ) = ""
  | calendar( "", currentDay, totalDays, 0, offset ) = 
      if currentDay > 9 then 
        int2str(currentDay) ^ "      "  ^
        (if (currentDay + offset) mod 7 = 0 then "\n" else "") ^  
        calendar( "", currentDay+1, totalDays - 1, 0, offset )
      else " " ^ int2str(currentDay) ^ "      " ^ 
        (if (currentDay + offset) mod 7 = 0 then "\n" else "") ^ 
        calendar( "", currentDay+1, totalDays - 1, 0, offset )
  | calendar(    "", currentDay, totalDays, startingDay, offset ) = 
      "        " ^ 
      calendar( "", currentDay, totalDays, startingDay-1, offset)
  | calendar( month, currentDay, totalDays, startingDay, offset ) =
      "\n                        " ^ month ^ 
      "\n\nSun     Mon     Tue     Wed     Thr     Fri     Sat \n" ^
      calendar( "", currentDay, totalDays, startingDay, offset) ^ "\n\n";



fun printCalendar( month, totalDays, startingDay ) = print( calendar( month, 1, totalDays, getDayCode(startingDay), getDayCode(startingDay) ) );

printCalendar( "September", 30, "Thr" );