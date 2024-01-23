      * ERROR 
	   01  ERR-TABLE.
           05  FILLER                      PIC X(100)
               VALUE 'ERR1: CAMPGROUND MUST BE "BUCK CREEK", "ISLAND VIEW"
      -        ', OR "HONEY CREEK".'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR2: FIRST POSITION OF SITE MUST BE A LETTER'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR3: SECOND PART OF SITE MUST BE NUMERIC'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR4: SECOND PART OF SITE MUST BE GREATER THAN ZERO'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR5: RESERVATION DATE NOT NUMERIC'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR6: RESERVATION MONTH MUST BE 1-12'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR7: RESERVATION DAY MUST BE 1-30 FOR MONTH'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR8: RESERVATION DAY MUST BE 1-31 FOR MONTH'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR9: RESERVATION DAY MUST BE 1-29 FOR MONTH'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR10: RESERVATION DAY MUST BE 1-28 FOR MONTH'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR11: RESERVATION DATE MUST BE AFTER TODAY'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR12: LENGTH OF STAY MUST BE NUMERIC'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR13: LENGTH OF STAY MUST BE 2-11'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR14: LAST NAME MUST NOT BE BLANK'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR15: FIRST NAME MUST NOT BE BLANK'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR16: AMOUNT MUST BE NUMERIC'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR17: AMOUNT MUST BE LENGTH OF STAY * SITE FEE'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR18: CREDIT CARD TYPE MUST BE "V", "M", OR "A"'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR19: CREDIT CARD NUMBER MUST BE NUMERIC'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR20: CREDIT CARD EXPIRATION DATE NOT NUMERIC'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR21: CREDIT CARD EXPIRATION MONTH MUST BE 1-12'.
           05  FILLER                      PIC X(100)
              VALUE 'ERR22: CREDIT CARD EXPIRATION DAY MUST BE 1-30 FOR MONTH'.
           05  FILLER                      PIC X(100)
              VALUE 'ERR23: CREDIT CARD EXPIRATION DAY MUST BE 1-31 FOR MONTH'.
           05  FILLER                      PIC X(100)
              VALUE 'ERR24: CREDIT CARD EXPIRATION DAY MUST BE 1-29 FOR MONTH'.
           05  FILLER                      PIC X(100)
              VALUE 'ERR25: CREDIT CARD EXPIRATION DAY MUST BE 1-28 FOR MONTH'.
           05  FILLER                      PIC X(100)
               VALUE 'ERR26: CREDIT CARD EXPIRATION DATE MUST BE AFTER TODAY'.
		   05  FILLER                      PIC X(100)
               VALUE 'ERR27: AMOUNT CANNOT BE NEGATIVE'.	   

       01  TABLE-ERR REDEFINES ERR-TABLE.
           05  ERR-MSG                     PIC X(100)  OCCURS 27 TIMES.