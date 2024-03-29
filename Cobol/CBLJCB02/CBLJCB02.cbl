       IDENTIFICATION DIVISION.
       PROGRAM-ID. CBLJCB02.
	   AUTHOR. JEFF BIRKNER.

       ENVIRONMENT DIVISION.
		   SELECT CAMPRES-INPUT
			   ASSIGN TO 'C:\COBOLFA23\CBLJCB02\RESERVE.DAT'
				   ORGANIZATION IS LINE SEQUENTIAL.

		   SELECT PRTOUT
			   ASSIGN TO 'C:\COBOLFA23\CBLJCB02\CAMPRES.DAT'
				   ORGANIZATION IS LINE SEQUENTIAL.
           
           SELECT ERROUT
			   ASSIGN TO 'C:\COBOLFA23\CBLJCB02\ERR.PRT'
				   ORGANIZATION IS RECORD SEQUENTIAL.

	   FILE SECTION.
	   FD CAMPRES-INPUT
	   LABEL RECORD IS STANDARD
	   DATA RECORD IS TRAN-REC
	   RECORD CONTAINS 108 CHARACTERS.

	   COPY "TRAN.CPY".

	   FD PRTOUT
	   LABEL RECORD IS OMITTED
	   DATA RECORD IS VAL-REC
	   RECORD CONTAINS 136 CHARACTERS.

       COPY "VAL.CPY".

	   FD ERROUT
	   LABEL RECORD IS OMITTED
	   DATA RECORD IS ERRLINE
	   RECORD CONTAINS 132 CHARACTERS
	   LINAGE IS 60 WITH FOOTING AT 56.

	   01 ERRLINE               PIC X(132).

       WORKING-STORAGE SECTION.
       01 SWITCHES.
           05 FIRST-ERR-SW      PIC X.
           05 ERR-SW            PIC X.
           05 MORE-RECS         PIC X.
       01 CURRENT-DATE-AND-TIME.
           05 CURRENT-DATE.
		       10 CURRENT-YEAR  PIC X(4).	  
		       10 CURRENT-MONTH PIC XX.	  
		       10 CURRENT-DAY   PIC XX.	  
		   05 CURRENT-TIME      PIC X(11).
       01 MISC.
           05 ERR-PAGE-CTR      PIC 99     VALUE 0.
           05 C-REC-ERR-CTR     PIC 99     VALUE 0.
           05 C-TOT-ERR-CTR     PIC 99     VALUE 0.
       01 CALCS.
           05 C-AMT             PIC S9(3)V99.
           05 C-AMT2            PIC S9(3)V99.
           05 C-END-DATE        PIC 9(8).
           05 DATE-TYPE         PIC X.
           05 C-LEAP            PIC 9(4).

       01 WK-DATE.
	       05 WK-YYYY	        PIC 9(4).
	       05 WK-MM	            PIC 99.
	       	   88 VAL-MM	VALUE 1 THRU 12.
	       	   88 VAL-30-MM VALUE 4, 6, 9, 11.
	       	   88 VAL-31-MM VALUE 1, 3, 5, 7, 8, 10, 12.
	       05 WK-DD	PIC 99.
	       	   88 VAL-WK-DD-31 VALUE 1 THRU 31.
	       	   88 VAL-WK-DD-30 VALUE 1 THRU 30.
	       	   88 VAL-WK-DD-28 VALUE 1 THRU 28.
	       	   88 VAL-WK-DD-29 VALUE 1 THRU 29.

       01 TBL-WK-DATE-NUM REDEFINES WK-DATE.
           05 WK-DATE-NUM       PIC 9(8).

       COPY "ERROR.CPY".

       01 SITES.
           05  FILLER           PIC X(3)   VALUE 'A10'.
           05  FILLER           PIC X(3)   VALUE 'B10'.
           05  FILLER           PIC X(3)   VALUE 'C10'.
           05  FILLER           PIC X(3)   VALUE 'D12'.
           05  FILLER           PIC X(3)   VALUE 'E12'.
           05  FILLER           PIC X(3)   VALUE 'F12'.
           05  FILLER           PIC X(3)   VALUE 'G12'.
           05  FILLER           PIC X(3)   VALUE 'H12'.
           05  FILLER           PIC X(3)   VALUE 'I12'.
           05  FILLER           PIC X(3)   VALUE 'J12'.
           05  FILLER           PIC X(3)   VALUE 'K12'.
           05  FILLER           PIC X(3)   VALUE 'L12'.
           05  FILLER           PIC X(3)   VALUE 'M12'.
           05  FILLER           PIC X(3)   VALUE 'N14'.
           05  FILLER           PIC X(3)   VALUE 'O14'.
           05  FILLER           PIC X(3)   VALUE 'P14'.
           05  FILLER           PIC X(3)   VALUE 'Q14'.
           05  FILLER           PIC X(3)   VALUE 'R14'.
           05  FILLER           PIC X(3)   VALUE 'S14'.
           05  FILLER           PIC X(3)   VALUE 'T14'.
           05  FILLER           PIC X(3)   VALUE 'U14'.
           05  FILLER           PIC X(3)   VALUE 'V14'.
           05  FILLER           PIC X(3)   VALUE 'W14'.
           05  FILLER           PIC X(3)   VALUE 'X14'.
           05  FILLER           PIC X(3)   VALUE 'Y14'.
           05  FILLER           PIC X(3)   VALUE 'Z14'.

       01 TBL-SITE REDEFINES SITES.
           05 TBL-SITE-INFO     OCCURS 26 TIMES   INDEXED BY SITE-INDEX.
               10 TBL-SITE-NAME     PIC X.
               10 TBL-SITE-PRICE    PIC 99.

       01 ERR-TITLE-LINE.
		   05 FILLER                  PIC X(6)    VALUE 'DATE: '.
		   05 ERR-TITLE-DATE.					   
		       10 ERR-TITLE-MONTH     PIC XX.	  
			   10 FILLER              PIC X       VALUE '/'.
			   10 ERR-TITLE-DAY       PIC XX.	  
		       10 FILLER              PIC X       VALUE '/'.
			   10 ERR-TITLE-YEAR      PIC X(4).	  
		   05 FILLER                  PIC X(37)   VALUE SPACES.
		   05 FILLER                  PIC X(25)	  
              VALUE 'RATHBUN LAKE RESERVATIONS'. 
		   05 FILLER                  PIC X(46)   VALUE SPACES.
		   05 FILLER                  PIC X(6)    VALUE 'PAGE: '.
		   05 ERR-TITLE-PAGE          PIC Z9.

	   01 ERR-TITLE-LINE2.
		   05 FILLER                  PIC X(60)   VALUE SPACES.
		   05 FILLER                  PIC X(12)   VALUE 'ERROR REPORT'.

       01 ERR-COL-HEADING.
           05 FILLER                  PIC X(12)   VALUE 
              'ERROR RECORD'.

       01 ERROR-LINE.
           05 O-ERR                   PIC X(108).

       01 ERR-MSG-LINE.
           05 O-ERR-MSG               PIC X(100).

       01 ERR-TOTAL-HEADING.
           05 FILLER                  PIC X(8)    VALUE 'TOTALS: '.
           05 FILLER                  PIC X(17)   VALUE 
           'ERRONEOUS RECORDS'.
           05 FILLER                  PIC XX      VALUE SPACES.
           05 FILLER                  PIC X(6)    VALUE 'ERRORS'.

       01 ERR-TOTALS.
           05 FILLER                  PIC X(23)   VALUE SPACES.
           05 O-REC-ERR-CTR           PIC Z9.
           05 FILLER                  PIC X(6)    VALUE SPACES.
           05 O-TOT-ERR-CTR           PIC Z9.

       PROCEDURE DIVISION.
       0000-MAIN.
           PERFORM 1000-INIT.
           PERFORM 2000-MAINLINE
               UNTIL MORE-RECS = 'N'.
           PERFORM 3000-CLOSING.
           STOP RUN.

       1000-INIT.
           OPEN INPUT CAMPRES-INPUT.
           OPEN OUTPUT PRTOUT.
           OPEN OUTPUT ERROUT.
           MOVE FUNCTION CURRENT-DATE          TO CURRENT-DATE-AND-TIME.
           MOVE CURRENT-MONTH                  TO ERR-TITLE-MONTH.
           MOVE CURRENT-DAY                    TO ERR-TITLE-DAY.
           MOVE CURRENT-YEAR                   TO ERR-TITLE-YEAR.
           MOVE 'Y'                            TO MORE-RECS.
       
           PERFORM 1100-INIT-HEADING.
           PERFORM 9000-READ-INPUT.

       2000-MAINLINE.
           PERFORM 2100-ERR-VALIDATION.
           IF ERR-SW = 'N'
               PERFORM 2400-CALCS
               PERFORM 2300-MOVE-PRINT
           END-IF.
           MOVE SPACES TO VAL-REC.
           PERFORM 9000-READ-INPUT.

       3000-CLOSING.
           PERFORM 3100-ERR-TOTALS.
           CLOSE CAMPRES-INPUT.
           CLOSE PRTOUT.
           CLOSE ERROUT.

       1100-INIT-HEADING.                                                  
           MOVE 1                               TO ERR-PAGE-CTR.
           MOVE ERR-PAGE-CTR                   TO ERR-TITLE-PAGE.
           WRITE ERRLINE FROM ERR-TITLE-LINE
               AFTER ADVANCING 1 LINE.
           WRITE ERRLINE FROM ERR-TITLE-LINE2
              AFTER ADVANCING 1 LINE.
           WRITE ERRLINE FROM ERR-COL-HEADING
              AFTER ADVANCING 2 LINES.

       2100-ERR-VALIDATION.
           MOVE 'N' TO ERR-SW.
           MOVE 'Y' TO FIRST-ERR-SW.
           IF NOT VAL-CAMPGROUND
           	   MOVE ERR-MSG(1) TO O-ERR-MSG
           	   MOVE 'Y' TO ERR-SW
			   ADD 1 TO C-TOT-ERR-CTR
           	   PERFORM 2110-ERROR-PRINT.
           IF I-SITE1 NUMERIC
           	   MOVE ERR-MSG(2) TO O-ERR-MSG
           	   MOVE 'Y' TO ERR-SW
			   ADD 1 TO C-TOT-ERR-CTR
           	   PERFORM 2110-ERROR-PRINT.
           IF I-SITE2 NUMERIC
           	   IF I-SITE2 > 0
                   IF I-AMT NUMERIC
                      IF I-LEN-STAY NUMERIC
           		      COMPUTE C-AMT = I-LEN-STAY * I-AMT
                   ELSE
                       MOVE ERR-MSG(12) TO O-ERR-MSG
                       MOVE 'Y' TO ERR-SW
				       ADD 1 TO C-TOT-ERR-CTR
                       PERFORM 2110-ERROR-PRINT
               ELSE
                   MOVE ERR-MSG(4) TO O-ERR-MSG
                   MOVE 'Y' TO ERR-SW
				   ADD 1 TO C-TOT-ERR-CTR
                   PERFORM 2110-ERROR-PRINT
               END-IF
           ELSE
           	   MOVE ERR-MSG(3) TO O-ERR-MSG
               MOVE 'Y' TO ERR-SW
			   ADD 1 TO C-TOT-ERR-CTR
           	   PERFORM 2110-ERROR-PRINT
           END-IF.
           
           MOVE I-DATE TO WK-DATE.
           MOVE 'R' TO DATE-TYPE.
           PERFORM 2112-DATE-VAL.
      *    	  THRU 2113-DATE-VAL-EXIT.

      *CAN USE AN 88 FOR I-LEN-STAY	
           IF I-LEN-STAY NUMERIC
           	   IF I-LEN-STAY > 1
           	   	   IF I-LEN-STAY < 12
           	   		   NEXT SENTENCE
           	       ELSE
           	   	       MOVE ERR-MSG(13) TO O-ERR-MSG
           	   	       MOVE 'Y' TO ERR-SW
					   ADD 1 TO C-TOT-ERR-CTR
           	   	       PERFORM 2110-ERROR-PRINT
           	       END-IF
               ELSE
           	   	   MOVE ERR-MSG(13) TO O-ERR-MSG
           	   	   MOVE 'Y' TO ERR-SW
				   ADD 1 TO C-TOT-ERR-CTR
           	   	   PERFORM 2110-ERROR-PRINT
           	   END-IF
           ELSE
           	   MOVE ERR-MSG(12) TO O-ERR-MSG
           	   MOVE 'Y' TO ERR-SW
			   ADD 1 TO C-TOT-ERR-CTR
           	   PERFORM 2110-ERROR-PRINT
           END-IF.

           IF I-LNAME = SPACES
           	   MOVE ERR-MSG(14) TO O-ERR-MSG
           	   MOVE 'Y' TO ERR-SW
			   ADD 1 TO C-TOT-ERR-CTR
           	   PERFORM 2110-ERROR-PRINT.

           IF I-FNAME = SPACES
           	   MOVE ERR-MSG(15) TO O-ERR-MSG
           	   MOVE 'Y' TO ERR-SW
			   ADD 1 TO C-TOT-ERR-CTR
           	   PERFORM 2110-ERROR-PRINT.

           IF I-AMT NUMERIC AND I-LEN-STAY NUMERIC
               SET SITE-INDEX TO 1
	           SEARCH TBL-SITE-INFO
                   WHEN I-SITE(1:1) = TBL-SITE-NAME(SITE-INDEX)
		           COMPUTE C-AMT = I-LEN-STAY *
                               TBL-SITE-PRICE(SITE-INDEX)
                   COMPUTE C-AMT2 = I-LEN-STAY * I-AMT
                   IF C-AMT NOT EQUAL C-AMT2
           	           MOVE 'Y' TO ERR-SW
           	           MOVE ERR-MSG(17) TO O-ERR-MSG
				       ADD 1 TO C-TOT-ERR-CTR
           	           PERFORM 2110-ERROR-PRINT
                   END-IF
                   IF I-AMT < 0
                       MOVE 'Y' TO ERR-SW
           	           MOVE ERR-MSG(27) TO O-ERR-MSG
				       ADD 1 TO C-TOT-ERR-CTR
           	           PERFORM 2110-ERROR-PRINT
			       END-IF
           ELSE
               MOVE 'Y' TO ERR-SW
           	   MOVE ERR-MSG(16) TO O-ERR-MSG
			   ADD 1 TO C-TOT-ERR-CTR
           	   PERFORM 2110-ERROR-PRINT
           END-IF.
           
           IF NOT VAL-CCTYPE
           	   MOVE 'Y' TO ERR-SW
           	   MOVE ERR-MSG(18) TO O-ERR-MSG
			   ADD 1 TO C-TOT-ERR-CTR
           	   PERFORM 2110-ERROR-PRINT.

           IF I-CCNUM NOT NUMERIC
           	   MOVE 'Y' TO ERR-SW
           	   MOVE ERR-MSG(19) TO O-ERR-MSG
			   ADD 1 TO C-TOT-ERR-CTR
           	   PERFORM 2110-ERROR-PRINT.
           	
       MOVE I-CCEXP TO WK-DATE.
       MOVE 'C' TO DATE-TYPE.
       PERFORM 2112-DATE-VAL
	      THRU 2113-DATE-VAL-EXIT. 

       2110-ERROR-PRINT.
	       IF FIRST-ERR-SW = 'Y'
		       MOVE 'N' TO FIRST-ERR-SW
		       ADD 1 TO C-REC-ERR-CTR
		       MOVE TRAN-REC TO O-ERR
		       WRITE ERRLINE FROM ERROR-LINE
			       AFTER ADVANCING 2 LINES
		       WRITE ERRLINE FROM ERR-MSG-LINE
	       ELSE
		       WRITE ERRLINE FROM ERR-MSG-LINE
			   AFTER ADVANCING 1 LINE
				   AT EOP
					   PERFORM 2111-ERROR-HEADING
	       END-IF.

       2111-ERROR-HEADING.
           ADD 1 TO ERR-PAGE-CTR.
           MOVE ERR-PAGE-CTR TO ERR-TITLE-PAGE.
           WRITE ERRLINE FROM ERR-TITLE-LINE
               AFTER ADVANCING PAGE.
           WRITE ERRLINE FROM ERR-TITLE-LINE2
               AFTER ADVANCING 1 LINE.
           WRITE ERRLINE FROM ERR-COL-HEADING
               AFTER ADVANCING 2 LINES.

       2112-DATE-VAL.
	       IF WK-DATE-NUM NOT NUMERIC
	      	   IF DATE-TYPE = 'R'
	      	       MOVE ERR-MSG(5) TO O-ERR-MSG
	      	   ELSE
	      	   	   MOVE ERR-MSG(20) TO O-ERR-MSG
	      	   END-IF
		       ADD 1 TO C-TOT-ERR-CTR
	      	   PERFORM 2110-ERROR-PRINT
           ELSE
               IF NOT VAL-MM
                   MOVE 'Y' TO ERR-SW
	      	       IF DATE-TYPE = 'R'
	      	           MOVE ERR-MSG(6) TO O-ERR-MSG
	      	       ELSE
	      	   	       MOVE ERR-MSG(21) TO O-ERR-MSG
	      	       END-IF
				   ADD 1 TO C-TOT-ERR-CTR
	      	       PERFORM 2110-ERROR-PRINT
               ELSE
                   PERFORM 2114-DAY-VALIDATION
           END-IF.

	           IF WK-DATE-NUM <= CURRENT-DATE
	          	   IF DATE-TYPE = 'R'
	          	       MOVE ERR-MSG(11) TO O-ERR-MSG
                       MOVE 'Y' TO ERR-SW
	          	   ELSE
	          	   	   MOVE ERR-MSG(26) TO O-ERR-MSG
                       MOVE 'Y' TO ERR-SW
	          	   END-IF
			       ADD 1 TO C-TOT-ERR-CTR
	          	   PERFORM 2110-ERROR-PRINT
           END-IF.

       2113-DATE-VAL-EXIT.
       	   EXIT.

       2114-DAY-VALIDATION.	
	       IF VAL-31-MM AND NOT VAL-WK-DD-31
               MOVE 'Y' TO ERR-SW
	       	   IF DATE-TYPE = 'R'
	      	       MOVE ERR-MSG(8) TO O-ERR-MSG
	      	   ELSE
	      	   	   MOVE ERR-MSG(23) TO O-ERR-MSG
               END-IF
			   ADD 1 TO C-TOT-ERR-CTR
	      	   PERFORM 2110-ERROR-PRINT
		   ELSE
               IF VAL-30-MM AND NOT VAL-WK-DD-30
                   MOVE 'Y' TO ERR-SW
	      	       IF DATE-TYPE = 'R'
	      	           MOVE ERR-MSG(7) TO O-ERR-MSG
	      	       ELSE
	      	       	   MOVE ERR-MSG(22) TO O-ERR-MSG
                   END-IF
				   ADD 1 TO C-TOT-ERR-CTR
	      	       PERFORM 2110-ERROR-PRINT
                   
			   ELSE	
				   IF WK-MM = 2
					   PERFORM 2115-LEAP-VALIDATION.	
	   2115-LEAP-VALIDATION.
	       DIVIDE WK-YYYY BY 4 GIVING C-LEAP REMAINDER C-LEAP
	      	   IF C-LEAP = 0 AND NOT VAL-WK-DD-29
   	               IF DATE-TYPE = 'R'
	      	           MOVE ERR-MSG(9) TO O-ERR-MSG
	      	       ELSE
	      	           MOVE ERR-MSG(24) TO O-ERR-MSG
                   END-IF
				   ADD 1 TO C-TOT-ERR-CTR
	      	       PERFORM 2110-ERROR-PRINT
	      	   ELSE
	      	       IF C-LEAP > 0 AND NOT VAL-WK-DD-28
	      	           IF DATE-TYPE = 'R'
	      	               MOVE ERR-MSG(10) TO O-ERR-MSG
	      	           ELSE
	      	               MOVE ERR-MSG(25) TO O-ERR-MSG
                       END-IF
					   ADD 1 TO C-TOT-ERR-CTR
	      	           PERFORM 2110-ERROR-PRINT.

       2300-MOVE-PRINT.
	       EVALUATE I-CCTYPE
		       WHEN 'V'
			       MOVE 'VISA' TO O-CCTYPE
		       WHEN 'M'
			       MOVE 'MASTER CARD' TO O-CCTYPE
		       WHEN 'A'
			       MOVE 'AMERICAN EXPRESS' TO O-CCTYPE
	       END-EVALUATE.
	
	       MOVE I-CAMPGROUND TO O-CAMPGROUND.
	       MOVE I-SITE TO O-SITE.
	       MOVE I-DATE TO O-DATE.
	       MOVE C-END-DATE TO O-END-DATE.
	       MOVE I-LEN-STAY TO O-LEN-STAY.
	       STRING I-LNAME DELIMITED BY "  "
	       	   ', ' DELIMITED BY SIZE
	       	   I-FNAME DELIMITED BY "  "
	       INTO O-NAME.
	       MOVE I-AMT TO O-AMT.
		   STRING I-CCNUM1 DELIMITED BY SIZE
			   '-' DELIMITED BY SIZE
			   I-CCNUM2 DELIMITED BY SIZE
			   '-' DELIMITED BY SIZE
			   I-CCNUM3 DELIMITED BY SIZE
			   '-' DELIMITED BY SIZE
			   I-CCNUM4 DELIMITED BY SIZE
		   INTO O-CCNUM.
	       MOVE I-CCEXP TO O-CCEXP.
           
           WRITE VAL-REC.

       2400-CALCS.

           MOVE I-DATE TO WK-DATE.

           IF VAL-31-MM
               ADD I-LEN-STAY TO WK-DD
               IF NOT VAL-WK-DD-31
                   ADD 1 TO WK-MM
                   SUBTRACT 31 FROM WK-DD
                   IF NOT VAL-MM
                       MOVE 1 TO WK-MM
                       ADD 1 TO WK-YYYY
                   END-IF
               END-IF
           ELSE IF VAL-30-MM
               ADD I-LEN-STAY TO WK-DD
               IF NOT VAL-WK-DD-30
                   ADD 1 TO WK-MM
                   SUBTRACT 30 FROM WK-DD
               END-IF
           ELSE IF WK-MM = 2
               ADD I-LEN-STAY TO WK-DD
               IF NOT VAL-WK-DD-29
                   ADD 1 TO WK-MM
                   SUBTRACT 29 FROM WK-DD
                   END-IF
               ELSE
                   ADD 1 TO WK-MM
                   SUBTRACT 28 FROM WK-DD
               END-IF
           END-IF.
	       
           MOVE WK-DATE TO C-END-DATE.

       3100-ERR-TOTALS.
           MOVE C-TOT-ERR-CTR TO O-TOT-ERR-CTR.
           MOVE C-REC-ERR-CTR TO O-REC-ERR-CTR.

           WRITE ERRLINE FROM ERR-TOTAL-HEADING
               AFTER ADVANCING 2 LINES.
           WRITE ERRLINE FROM ERR-TOTALS
               AFTER ADVANCING 1 LINE.

       9000-READ-INPUT.
           READ CAMPRES-INPUT
               AT END
                   MOVE 'N' TO MORE-RECS.

       END PROGRAM CBLJCB02.