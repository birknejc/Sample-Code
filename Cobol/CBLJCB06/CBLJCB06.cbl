       IDENTIFICATION DIVISION.
       PROGRAM-ID. CBLJCB06.
	   AUTHOR. JEFF BIRKNER.
	   DATE-WRITTEN. 10/31/23.
       DATE-COMPILED. 10/31/23.

      *THIS PROGRAM OUTPUTS TWO SALES REPORTS IN ONE FILE
      *THE FIRST REPORT IS DAILY TOTAL SALES BY SALESPERSON
      *THE SECOND REPORT IS TOTAL SALES BY FURNITURE TYPE

       ENVIRONMENT DIVISION.
		   SELECT SALESFILE
			   ASSIGN TO 'C:\COBOLFA23\CBLJCB06\FURN.DAT'
				   ORGANIZATION IS LINE SEQUENTIAL.

		   SELECT SUMMARYFILE
			   ASSIGN TO 'C:\COBOLFA23\CBLJCB06\CBLSMRY.PRT'
				   ORGANIZATION IS RECORD SEQUENTIAL.

	   FILE SECTION.
	   FD SALESFILE
	   LABEL RECORD IS STANDARD
	   DATA RECORD IS ST-REC
	   RECORD CONTAINS 42 CHARACTERS.

	   01	ST-REC.
	      05	ST-SLM-NUM		PIC 99.
	      05	ST-DAY			PIC 9.
	      05	ST-AMOUNT		PIC S9(5)V99.
	      05	ST-FUR-CODE		PIC 9.
	      05	ST-SALES-DATE	PIC 9(6).
	      05	ST-SLM-NAME		PIC X(25).


	   
	   FD SUMMARYFILE
	   LABEL RECORD IS OMITTED
	   DATA RECORD IS SUMMARY-REC
	   RECORD CONTAINS 132 CHARACTERS
	   LINAGE IS 60 WITH FOOTING AT 56.

	   01 SUMMARY-REC               PIC X(132).

       WORKING-STORAGE SECTION.
       01 SALESTABLE.
           05 SALESPERSON      OCCURS 16 TIMES.
               10 S-NAME           PIC X(25).
               10 DAILYTOTAL       PIC S9(9)V99 OCCURS 8 TIMES.

       01 FURN-CATEGORIES.
           05 FILLER       PIC X(22) VALUE 'SOFAS/LOVESEATS'.
           05 FILLER       PIC X(22) VALUE 'CHAIRS'.
           05 FILLER       PIC X(22) VALUE 'COFFEE/END TABLES'.
           05 FILLER       PIC X(22) VALUE 'DINING ROOM TABLES'.
           05 FILLER       PIC X(22) VALUE 'DINING ROOM CHAIRS'.
           05 FILLER       PIC X(22) VALUE 'HUTCHES/CURIO CABINETS'.
           05 FILLER       PIC X(22) VALUE 'LAMPS'.
           05 FILLER       PIC X(22) VALUE 'MATTRESS/BOX SPRINGS'.
           05 FILLER       PIC X(22) VALUE 'BEDROOM FURNITURE'.

       01 FURN-CAT-TABLE REDEFINES FURN-CATEGORIES.
           05 FURN         OCCURS 9 TIMES.
               10 FURN-NAME        PIC X(22).
           
       01 FURN-TOTAL.
           05 FURN-TOTAL-SALES OCCURS 9 TIMES PIC S9(9)V99 VALUE 0.

       01 FURN-GRAND-TOTAL.
           05 FURN-GRAND-TOTAL-SALES   PIC S9(9)V99 VALUE 0.

       01 MISC.
           05 PAGE-CTR                 PIC 99  VALUE 0.
           05 MORE-RECS                PIC X. 
           05 I-VAR                    PIC X.
           05 SUB                      PIC 99.

       01 CURRENT-DATE-AND-TIME.
           05 CURRENT-DATE.
		       10 CURRENT-YEAR  PIC X(4).	  
		       10 CURRENT-MONTH PIC XX.	  
		       10 CURRENT-DAY   PIC XX.	  
		   05 CURRENT-TIME      PIC X(11).
       
       01 WEEKLY-HEADING1.
           05 FILLER               PIC X(32)   VALUE 'SALESPERSON'.
           05 FILLER               PIC X(13)   VALUE 'SUNDAY'.
           05 FILLER               PIC X(12)   VALUE 'MONDAY'.
           05 FILLER               PIC X(11)   VALUE 'TUESDAY'.
           05 FILLER               PIC X(14)   VALUE 'WEDNESDAY'.
           05 FILLER               PIC X(15)   VALUE 'THURSDAY'.
           05 FILLER               PIC X(11)   VALUE 'FRIDAY'.
           05 FILLER               PIC X(18)   VALUE 'SATURDAY'.
           05 FILLER               PIC X(6)    VALUE 'WEEKLY'.

       01 WEEKLY-TITLE-LINE.
		   05 FILLER                  PIC X(6)    VALUE 'DATE: '.
		   05 WEEKLY-TITLE-DATE.					   
		       10 WK-TITLE-MONTH      PIC XX.	  
			   10 FILLER              PIC X       VALUE '/'.
			   10 WK-TITLE-DAY        PIC XX.	  
		       10 FILLER              PIC X       VALUE '/'.
			   10 WK-TITLE-YEAR       PIC X(4).	  
		   05 FILLER                  PIC X(36)   VALUE SPACES.
		   05 FILLER                  PIC X(28)	  
              VALUE 'JUST FITS FURNITURE EMPORIUM'. 
		   05 FILLER                  PIC X(44)   VALUE SPACES.
		   05 FILLER                  PIC X(6)    VALUE 'PAGE: '.
		   05 WK-TITLE-PAGE           PIC Z9.

	   01 WEEKLY-TITLE-LINE2.
		   05 FILLER                  PIC X(56)   VALUE SPACES.
		   05 FILLER                  PIC X(19)   VALUE
          'WEEKLY SALES REPORT'.

       01 WEEKLY-HEADING2.
           05 FILLER               PIC XXX     VALUE SPACES.
           05 FILLER               PIC X(4)    VALUE 'NAME'.
           05 FILLER               PIC X(119)  VALUE SPACES.
           05 FILLER               PIC X(6)    VALUE 'TOTALS'.

       01 WEEKLY-HEADING3.
           05 DASHES               PIC X(132)  VALUE SPACES.

       01 WEEKLY-DETAIL-LINE.
           05 O-SALESPERSON        PIC X(25).
           05 FILLER               PIC X(3)     VALUE SPACES.
           05 O-DAY-AMT  OCCURS 8 TIMES.
               10 O-DAILY-AMT      PIC $$$,$$$.99.
               10 FILLER           PIC XXX     VALUE SPACES.

       01 WEEKLY-TOTALS1.
           05 T-DASHES             PIC X(132).

       01 WEEKLY-TOTALS2.
           05 FILLER               PIC X(13)   VALUE 'GRAND TOTALS:'.
           05 FILLER               PIC X(11)   VALUE SPACES.
           05 O-TOT-AMT OCCURS 8 TIMES.
               10 O-TOT            PIC $$$,$$$,$$$.99.

       01 WEEKLY-TOTALS3.
           05 FILLER               PIC X(20)   VALUE SPACES.
           05 O-TOT2-AMT OCCURS 8 TIMES.
               10 O-TOT2           PIC $$$,$$$,$$$.99.

       01 FURN-TITLE-LINE2.
		   05 FILLER                  PIC X(58)   VALUE SPACES.
		   05 FILLER                  PIC X(16)   VALUE
          'FURNITURE REPORT'.

       01 FURN-HEADING1.
           05 FILLER               PIC X(33)   VALUE SPACES.
           05 FILLER               PIC X(9)    VALUE 'FURNITURE'.
           05 FILLER               PIC X(50)   VALUE SPACES.
           05 FILLER               PIC X(9)    VALUE 'FURNITURE'.

       01 FURN-HEADING2.
           05 FILLER               PIC X(33)   VALUE SPACES.
           05 FILLER               PIC X(4)    VALUE 'TYPE'.
           05 FILLER               PIC X(54)   VALUE SPACES.
           05 FILLER               PIC X(10)    VALUE 'TYPE TOTAL'.

       01 FURN-DETAIL.
           05 FILLER               PIC X(33).
           05 O-FURNITURE          PIC X(22).
           05 FILLER               PIC X(33)   VALUE SPACES.
           05 O-FURN-SALES         PIC $$,$$$,$$$.99.
           05 FILLER               PIC XXX     VALUE SPACES.

       01 FURN-GRAND-TOTALS.
           05 FILLER               PIC X(33)   VALUE SPACES.
           05 FILLER               PIC X(21)    VALUE
           'FURNITURE GRAND TOTAL'.
           05 FILLER               PIC X(34) VALUE SPACES.
           05 O-FURN-GRAND-TOTAL   PIC $$,$$$,$$$.99.

       PROCEDURE DIVISION.
       0000-MAIN.
           PERFORM 1000-INIT.
           PERFORM 2000-MAINLINE
               UNTIL MORE-RECS = 'N'.
           PERFORM 3000-CLOSING.
           STOP RUN.

       1000-INIT.
           OPEN INPUT SALESFILE.
           OPEN OUTPUT SUMMARYFILE.
           MOVE FUNCTION CURRENT-DATE          TO CURRENT-DATE-AND-TIME.
           MOVE CURRENT-MONTH                  TO WK-TITLE-MONTH.
           MOVE CURRENT-DAY                    TO WK-TITLE-DAY.
           MOVE CURRENT-YEAR                   TO WK-TITLE-YEAR.
           INITIALIZE SALESTABLE.
           INITIALIZE FURN-TOTAL.
           PERFORM 1100-WEEKLY-HEADING.
           PERFORM 9000-READ.

       1100-WEEKLY-HEADING.
           ADD 1 TO PAGE-CTR.
           MOVE PAGE-CTR TO WK-TITLE-PAGE.
           WRITE SUMMARY-REC FROM WEEKLY-TITLE-LINE
               AFTER ADVANCING 1 LINE.
           WRITE SUMMARY-REC FROM WEEKLY-TITLE-LINE2
               AFTER ADVANCING 1 LINE.
           WRITE SUMMARY-REC FROM WEEKLY-HEADING1
               AFTER ADVANCING 2 LINES.
           WRITE SUMMARY-REC FROM WEEKLY-HEADING2
               AFTER ADVANCING 1 LINE.
           MOVE ALL '-' TO DASHES.
           WRITE SUMMARY-REC FROM WEEKLY-HEADING3
               AFTER ADVANCING 1 LINE.
                  
       2000-MAINLINE.
           PERFORM 2200-CALC.
           PERFORM 9000-READ
           IF MORE-RECS = 'N'
               PERFORM 2100-OUTPUT
                   VARYING ST-SLM-NUM FROM 1 BY 1
                       UNTIL ST-SLM-NUM > 15.

       2100-OUTPUT.
           PERFORM 2110-OUTPUT
               VARYING ST-DAY FROM 1 BY 1
                   UNTIL ST-DAY > 8.
           IF DAILYTOTAL(ST-SLM-NUM,8) GREATER THAN 0
                WRITE SUMMARY-REC FROM WEEKLY-DETAIL-LINE
                   AFTER ADVANCING 1 LINE.
       2110-OUTPUT.
           MOVE S-NAME(ST-SLM-NUM) TO O-SALESPERSON.
           MOVE DAILYTOTAL(ST-SLM-NUM, ST-DAY) TO O-DAILY-AMT(ST-DAY).

       2200-CALC.
      *    TOTAL SALES BY PERSON BY DAY
           ADD ST-AMOUNT TO DAILYTOTAL(ST-SLM-NUM,ST-DAY).

      *    TOTAL SALES BY PERSON TOTAL FOR WEEK
           ADD ST-AMOUNT TO DAILYTOTAL(ST-SLM-NUM,8).

      *    TOTAL SALES FOR EACH DAY
           ADD ST-AMOUNT TO DAILYTOTAL(16,ST-DAY).

      *    TOTAL SALES FOR WEEK
           ADD ST-AMOUNT TO DAILYTOTAL(16,8).

      *    TOTAL FURNITURE SALE
           ADD ST-AMOUNT TO FURN-TOTAL-SALES(ST-FUR-CODE).

      *    GRAND TOTAL FURN SALES
           ADD ST-AMOUNT TO FURN-GRAND-TOTAL-SALES.
      
       3000-CLOSING.
           PERFORM 4000-WK-GRAND-TOTALS.
           CLOSE SALESFILE.
           CLOSE SUMMARYFILE.

       4000-WK-GRAND-TOTALS.
           MOVE ALL '-' TO T-DASHES.
           MOVE DAILYTOTAL(16, 1) TO O-TOT(1).
           MOVE DAILYTOTAL(16, 3) TO O-TOT(3).
           MOVE DAILYTOTAL(16, 5) TO O-TOT(5).
           MOVE DAILYTOTAL(16, 7) TO O-TOT(7).
           MOVE DAILYTOTAL(16, 2) TO O-TOT2(2).
           MOVE DAILYTOTAL(16, 4) TO O-TOT2(4).
           MOVE DAILYTOTAL(16, 6) TO O-TOT2(6).
           MOVE DAILYTOTAL(16, 8) TO O-TOT2(8).
           WRITE SUMMARY-REC FROM WEEKLY-TOTALS1.
           WRITE SUMMARY-REC FROM WEEKLY-TOTALS2
               AFTER ADVANCING 2 LINES.
           WRITE SUMMARY-REC FROM WEEKLY-TOTALS3
               AFTER ADVANCING 1 LINE.
           PERFORM 4100-FURN-HEADING.

       4100-FURN-HEADING.

           ADD 1 TO PAGE-CTR.
           MOVE PAGE-CTR TO WK-TITLE-PAGE.
           WRITE SUMMARY-REC FROM WEEKLY-TITLE-LINE
               AFTER ADVANCING PAGE.
           WRITE SUMMARY-REC FROM FURN-TITLE-LINE2
               AFTER ADVANCING 1 LINE.
           WRITE SUMMARY-REC FROM FURN-HEADING1
               AFTER ADVANCING 2 LINES.
           WRITE SUMMARY-REC FROM FURN-HEADING2
               AFTER ADVANCING 1 LINE.
           WRITE SUMMARY-REC FROM WEEKLY-HEADING3
               AFTER ADVANCING 1 LINE.
           PERFORM 4110-TOTALS.

       4110-TOTALS.
           PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 9
               IF FURN-TOTAL-SALES(SUB) > 0
                   MOVE FURN-NAME(SUB) TO O-FURNITURE                   
                   MOVE FURN-TOTAL-SALES(SUB) TO O-FURN-SALES
                   WRITE SUMMARY-REC FROM FURN-DETAIL
                       AFTER ADVANCING 1 LINE
               END-IF.
               WRITE SUMMARY-REC FROM WEEKLY-HEADING3
                       AFTER ADVANCING 1 LINE.
           PERFORM 4111-FURN-GRAND-TOTALS.

       4111-FURN-GRAND-TOTALS.
           MOVE FURN-GRAND-TOTAL-SALES TO O-FURN-GRAND-TOTAL.
           WRITE SUMMARY-REC FROM FURN-GRAND-TOTALS
               AFTER ADVANCING 2 LINES.

       9000-READ.
           READ SALESFILE
               AT END MOVE 'N' TO MORE-RECS
               NOT AT END
                   MOVE ST-SLM-NAME TO S-NAME(ST-SLM-NUM).
