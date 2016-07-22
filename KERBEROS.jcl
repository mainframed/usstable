//USSDC23   JOB 'build tso screen',
//   'IBMUSER',
//   NOTIFY=&SYSUID,
//   MSGCLASS=H,
//   MSGLEVEL=(1,1)
//*******************************************************************
//*                                                                 *
//*           JCL used to change TSO/vtam                           *
//*             signon screen                                       *
//*                                                                 *
//*           Chad D. Rikansrud
//*           DEFCON LOGO by SoF                                    *
//*           THX to SoF   asmaclg - bind, link & run               *
//*           05/30/2015   asmacl - bind & link                     *
//*                                                                 *
//*******************************************************************
//BUILD   EXEC ASMACL
//*BUILD   EXEC ASMACLG
//C.SYSLIB  DD DSN=SYS1.SISTMAC1,DISP=SHR
//          DD DSN=SYS1.MACLIB,DISP=SHR
//C.SYSIN   DD *
         MACRO
&NAME    SCREEN &MSG=.,&TEXT=.
         AIF   ('&MSG' EQ '.' OR '&TEXT' EQ '.').END
         LCLC  &BFNAME,&BFSTART,&BFEND
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* Declaring Kick-Ass Color to make sweet-sweet art with   - SoF     *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
&COLOR   SETC  'X''2903C0F8'  x29 Set Field Extended (SFE)
*                             x03 Three Attributes
*                             xC0F8 Set Attributes
* The remaining SFE are pairs. 
*                  - x45nn is background color
*                  - x42nn is foreground color
* Since &COLOR Declares three attributes you must always specify &BG
* before the &<color>. I.E. &COLOR&BG&RED
*
* Backgrounds
*
&BG      SETC  '4500'         Black Background
&BGBL    SETC  '45F1'         Blue Background
&BGRED   SETC  '45F2'         Red Background
&BGPINK  SETC  '45F3'         Pink Background
&BGGREEN SETC  '45F4'         Green Background
&BGTURQ  SETC  '45F5'         Turq Background
&BGYELL  SETC  '45F6'         Yellow Background
&BGWHITE SETC  '45F7'         White Background
*
* Colors
*
&BLUE    SETC  '42F1'''       BLUE
&RED     SETC  '42F2'''       RED
&PINK    SETC  '42F3'''       PINK
&GREEN   SETC  '42F4'''       GREEN
&TURQ    SETC  '42F5'''       TURQ
&YELLOW  SETC  '42F6'''       YELLOW
&WHITE   SETC  '42F7'''       WHITE
&BLACK   SETC  '42F8'''       BLACK
&DBLUE   SETC  '42F9'''       DBLUE
&ORANGE  SETC  '42FA'''       ORANGE
&PURPLE  SETC  '42FB'''       PURPLE
&LGREEN  SETC  '42FC'''       LGREEN
&LTURQ   SETC  '42FD'''       LTURQ
&GREY    SETC  '42FE'''       GREY
&BWHITE  SETC  '42FF'''       BOLDWHITE
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* Declaring Graphic lines - JBX                                     *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
&UPRIGHT    SETC  'X''08D5'''            UPPER RIGHT CORNER
&DOWNRIGHT  SETC  'X''08D4'''            UPPER RIGHT CORNER
&UPLEFT     SETC  'X''08C5'''            UPPER RIGHT CORNER
&DOWNLEFT   SETC  'X''08C4'''            UPPER RIGHT CORNER
&HBAR       SETC  'X''08A2'''            HORZ BAR
&VBAR       SETC  'X''0885'''            VIRT BAR
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* Adding More Graphics - SoF                                        *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
&EBLOCK  SETC  'X''0890'''             Empty Block
&LBLOCK  SETC  'X''0891'''             Left Half Block ANSI ALT+221
&RBLOCK  SETC  'X''0892'''             Right Half Block ANSI ALT+222
&TBLOCK  SETC  'X''0893'''             Top Half Block ANSI ALT+220
&BBLOCK  SETC  'X''0894'''             Bottom Half Block ANSI ALT+223
&BLOCK   SETC  'X''0895'''             Full Block ANSI ALT+219
&SQUARE  SETC  'X''0895'''             Full Block ANSI ALT+254
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* You can also insert these in an DC C'' statement.
* To show the IP: DC C'IP is: @@@@@@@@@IPADDR' 
*--------------------------------------------------------------------*
*                                                                    *
*  ===> Available USSMSG character string substitutions:             *
*                                                                    *
*  @@@@@@@@@IPADDR     User's IP address (client's IP)               *
*                      -- 15 bytes; leading zeros not suppressed     *
*  @@PRT               User's foreign port number (client's port)    *
*                      -- 5 bytes; leading zeros not suppressed      *
*  @@@@DATE            Current date                                  *
*                      -- 8 bytes; default format is MM/DD/YY        *
*                      -- format and delimiter overrides possible    *
*                         (DATEFRM=fmt / DATEDLM=d on USSTAB macro)  *
*  @@@@TIME            Current time                                  *
*                      -- 8 bytes; default format is HH:MM:SS        *
*                      -- delimiter override possible                *
*                         (TIMEDLM=d on USSTAB macro)                *
*  @@LUNAME            Server's LU name (VTAM "terminal" name)       *
*                      -- 8 bytes; left justified; padded w/blanks   *
*  @@@NETID            Network ID                                    *
*                      -- 8 bytes; left justified; padded w/blanks   *
*                      -- for nonnative-network-attached terminals,  *
*                         this is the "real" network name (the       *
*                         network identifier of the network where    *
*                         the terminal resides), not the name of the *
*                         network it is attached to                  *
*  @@@@@@@@@@@@@@NQN   Network-Qualified name                        *
*                      -- 17 bytes; left justified, padded w/blanks  *
*                      -- concatenation of @@@NETID.@@LUNAME         *
*  @@SSCPNM            System Services Control Point name            *
*                      -- 8 bytes; left justified; padded w/blanks   *
*  @@@@RUNAME          Request/Response Unit name                    *
*                      -- 10 bytes; left justified, padded w/blanks  *
*                      -- applies only to USSMSG07 when coded with   *
*                         the BUFFER operand                         *
*  @@@SENSE            Sense code                                    *
*                      -- 8 bytes                                    *
*                      -- applies only to USSMSG07 when coded with   *
*                         the BUFFER operand                         *
*                                                                    *
*  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@IPHOSTNAME                          *
*                      User's DNS name                               *
*                      -- 40 bytes; left justified; padded w/blanks  *
*                      -- only available if using HNGROUP statements *
*                         for LU mapping                             *
*--------------------------------------------------------------------*
&BFNAME  SETC  'BUF'.'&MSG'
&BFBEGIN SETC  '&BFNAME'.'B'
&BFEND   SETC  '&BFNAME'.'E'
.BEGIN   DS    0F
&BFNAME  DC    AL2(&BFEND-&BFBEGIN)    MESSAGE LENGTH
&BFBEGIN EQU   *                       START OF MESSAGE
         DC    X'F57A'                 ERASE/WRITE, WCC
*
* The line below sets the buffer to ROW 0, COL 0.
* To set whichever location you want use 0x11 and then
* this table: http://www.tommysprinkle.com/mvs/P3270/bufaddr.htm
* E.G. 0x114DC7 sets the cursor to Row 10 Col 39
*
         DC    X'110000'               SBA, 0000     ROW 00 COL 01
         DC &COLOR&BG&DBLUE Top Row of Kerberos
         DC &BBLOCK Letter K
         DC &BBLOCK
         DC    C'   '
         DC &BBLOCK
         DC &BBLOCK
         DC C' '
         DC 7&BBLOCK  Letter E
         DC C' '
         DC 6&BBLOCK  Letter R
         DC C'  '
         DC 6&BBLOCK  Letter B
         DC C'  '
         DC 7&BBLOCK  Letter E
         DC C' '
         DC 6&BBLOCK   Letter R
         DC C'  '
         DC 7&BBLOCK   Letter O
         DC C' '
         DC 7&BBLOCK   Letter S
         DC    16C' '
* Second Row
         DC &COLOR&BG&BLUE
         DC &BLOCK Letter K
         DC &BLOCK
         DC    C'   '
         DC &BLOCK
         DC &BLOCK
         DC C' '
         DC &BLOCK Letter E
         DC &BLOCK
         DC &BBLOCK
         DC &BBLOCK
         DC C' '
         DC &TBLOCK
         DC &TBLOCK
         DC C' '
         DC &BLOCK Letter R
         DC &BLOCK
         DC    C'   '
         DC &BLOCK
         DC &BLOCK
         DC C' '
         DC &BLOCK Letter B
         DC &BLOCK
         DC &BBLOCK
         DC &BBLOCK
         DC &BBLOCK
         DC &BLOCK
         DC &TBLOCK
         DC C' '
         DC &BLOCK Letter E
         DC &BLOCK
         DC &BBLOCK
         DC &BBLOCK
         DC C' '
         DC &TBLOCK
         DC &TBLOCK
         DC C' '
         DC &BLOCK Letter R
         DC &BLOCK
         DC    C'   '
         DC &BLOCK
         DC &BLOCK
         DC C' '
         DC &BLOCK Letter O
         DC &BLOCK
         DC    C'   '
         DC &BLOCK
         DC &BLOCK
         DC C' '
         DC &BLOCK Letter S
         DC &BLOCK
         DC 5&BBLOCK
         DC &COLOR&BG&RED
         DC C'Mark Wilson'
         DC 4C' '
* Third Row
         DC &COLOR&BG&TURQ 
         DC &BLOCK Letter K
         DC &BLOCK
         DC &TBLOCK
         DC &TBLOCK
         DC &TBLOCK
         DC &BLOCK
         DC &BBLOCK
         DC C' '
         DC &BLOCK Letter E
         DC &BLOCK
         DC &BBLOCK
         DC C'  '
         DC 2&BLOCK
         DC C' '
         DC &BLOCK Letter R
         DC &BLOCK
         DC    C'   '
         DC &TBLOCK
         DC &TBLOCK
         DC C' '
         DC &BLOCK Letter B
         DC &BLOCK
         DC C'  '
         DC &BBLOCK
         DC 2&BLOCK
         DC C' '
         DC &BLOCK Letter E
         DC &BLOCK
         DC &BBLOCK
         DC C'  '
         DC 2&BLOCK
         DC C' '
         DC &BLOCK Letter R
         DC &BLOCK
         DC    C'   '
         DC &TBLOCK
         DC &TBLOCK
         DC C' '
         DC &BLOCK Letter O
         DC &BLOCK
         DC &BBLOCK
         DC C'  '
         DC 2&BLOCK
         DC C' '
         DC 2&BBLOCK Letter S
         DC C'   '
         DC 2&BLOCK
         DC &COLOR&BG&RED
         DC C'Chad Rikansrud '
*Bottom Row
         DC &COLOR&BG&WHITE
         DC 2&TBLOCK Letter K
         DC C'   '
         DC 2&BLOCK
         DC C'  '
         DC 6&TBLOCK Letter E
         DC C' '
         DC 2&TBLOCK Letter R
         DC C'      '
         DC 6&TBLOCK Letter B
         DC C'   '
         DC 6&TBLOCK Letter E
         DC C' '
         DC 2&TBLOCK Letter R
         DC C'       '
         DC 6&TBLOCK Letter O
         DC C' '
         DC 6&TBLOCK Letter S
         DC &COLOR&BG&RED
         DC C' Brian Marshall '
         DC    80C' '
* Begin Cerberus and Box        
         DC 33C' '
         DC &COLOR&BG&DBLUE
         DC C',$x.'
         DC 32C' '
         DC &COLOR&BG&BLUE
         DC C'.x$,'
         DC 6C' '
         DC &COLOR&BG&ORANGE
         DC 13C' '
         DC C'/\_/\____,       '
         DC &COLOR&BG&DBLUE
         DC C',$X'
         DC X'1CEA'
         DC C'"'''  
         DC &COLOR&BG&BLUE
         DC 28C' '                          
         DC C'''"'
         DC X'EA1C'
         DC C'X$,'
         DC 4C' '
*
         DC &COLOR&BG&ORANGE
         DC 4C' '
         DC C',___/\_/\ \  ~     /'
         DC 7C' '
         DC &COLOR&BG&DBLUE
         DC C'$$'''
         DC 36C' '
         DC &COLOR&BG&BLUE
         DC C'`$$'
         DC 4C' '
*
         DC &COLOR&BG&ORANGE
         DC 4C' '
         DC C'\     ~  \ )  '
         DC &COLOR&BG&WHITE
         DC C'XXX'
         DC 9C' '
         DC &COLOR&BG&DBLUE
         DC C'`$$'
         DC 36C' '
         DC &COLOR&BG&BLUE
         DC C'$$'''
         DC 4C' '
*
         DC &COLOR&BG&WHITE
         DC 6C' '
         DC C'XXX'
         DC 4C' '
         DC &COLOR&BG&ORANGE
         DC C'/    /\_/\___,'
         DC 3C' '
         DC &COLOR&BG&DBLUE
         DC C'$$'''
         DC 36C' '
         DC &COLOR&BG&BLUE
         DC C'`$$'
         DC 4C' '
*
         DC &COLOR&BG&ORANGE
         DC 9C' '
         DC C'\o-o/-o-o/   ~    /'
         DC 3C' '
         DC &COLOR&BG&DBLUE
         DC C'`$$'
         DC 36C' '
         DC &COLOR&BG&BLUE
         DC C'$$'''
         DC 4C' '
*
         DC &COLOR&BG&ORANGE
         DC 10C' '
         DC C') /     \'
         DC 3C' '
         DC &COLOR&BG&WHITE
         DC C'XXX'
         DC 5C' '
         DC &COLOR&BG&BLUE
         DC C'$$'''
         DC 36C' '
         DC &COLOR&BG&DBLUE
         DC C'`$$'
         DC 4C' '
*
         DC &COLOR&BG&ORANGE
         DC 9C' '
         DC C'_|    / \ \_/'
         DC 9C' '
         DC &COLOR&BG&BLUE
         DC C'`$$'
         DC 36C' '
         DC &COLOR&BG&DBLUE
         DC C'$$'''
         DC 4C' '
*
         DC &COLOR&BG&ORANGE
         DC 6C' '
         DC C',-/   _  \_/   \'
         DC 9C' '
         DC &COLOR&BG&BLUE
         DC C'$$'''
         DC 36C' '
         DC &COLOR&BG&DBLUE
         DC C'`$$'
         DC 4C' '
*
         DC &COLOR&BG&ORANGE
         DC 5C' '
         DC C'/ (   /____,__|  )'
         DC 8C' '
         DC &COLOR&BG&BLUE
         DC C'`$$'
         DC 36C' '
         DC &COLOR&BG&DBLUE
         DC C'$$'''
         DC 4C' '
*
         DC &COLOR&BG&ORANGE
         DC 4C' '
         DC C'(  |_ (    )  \) _|'
         DC 8C' '
         DC &COLOR&BG&BLUE
         DC C'$$'''
         DC 36C' '
         DC &COLOR&BG&DBLUE
         DC C'`$$'
         DC 4C' '
*
         DC &COLOR&BG&ORANGE
         DC 3C' '
         DC C'_/ _)   \   \__/   (_'
         DC 7C' '
         DC &COLOR&BG&BLUE
         DC C'`$$'
         DC 36C' '
         DC &COLOR&BG&DBLUE
         DC C'$$'''
         DC 4C' '
*
         DC &COLOR&BG&ORANGE
         DC 2C' '
         DC C'(,-(,(,(,/      \,),),)'
         DC 6C' '
         DC &COLOR&BG&BLUE
         DC C'$$ '
         DC 36C' '
         DC &COLOR&BG&DBLUE
         DC C' $$'
         DC 4C' '
*
         DC 33C' '
         DC &COLOR&BG&BLUE
         DC C'`'
         DC X'EA'
         DC C''''
         DC 35C' '
         DC &COLOR&BG&DBLUE
         DC C'`'
         DC X'EA'
         DC C''''
         DC 84C' '
* End of Cerberus and Box
* Begin SHARE 2016
         DC &COLOR&BG&YELLOW
         DC C'.dP"Y8   88  88     db      88""Yb   888888   oP"Yb.    dx
               P"Yb      .d     dP''  '
         DC &COLOR&BG&LGREEN
         DC C'`Ybo."   88  88    dPYb     88__dP   88__     "'' dP''   x
               dP   Yb   .d88   .d8''   '
         DC &COLOR&BG&GREEN
         DC C'o.`Y8b   888888   dP__Yb    88"Yb    88""       dP''    Yx
               b   dP     88   8P"""Yb'
         DC &COLOR&BG&GREY
         DC C'8bodP''   88  88  dP""""Yb   88  Yb   888888   .d8888    x
               YbodP      88   `YboodP'
* End SHARE Logo
* Add the application Statements
*TSO     
         DC X'114AE8'
         DC &COLOR&BG&BLUE
         DC C'TSO' 
         DC &COLOR&BG&RED
         DC C'- Time Sharin'''
*IMS     
         DC X'114BF8'
         DC &COLOR&BG&BLUE
         DC C'IMS' 
         DC &COLOR&BG&RED
         DC C'- Mongo DB'
*They're Trashing!     
         DC X'114DC7'
         DC &COLOR&BG&BLUE
         DC C'H4CK' 
         DC &COLOR&BG&RED
         DC C'- Hack the Planet'
* CICS
         DC X'114ED7'
         DC &COLOR&BG&BLUE
         DC C'CICS' 
         DC &COLOR&BG&RED
         DC C'- Url Grey'
* MS-DOS
         DC X'114FE7'
         DC &COLOR&BG&BLUE
         DC C' DOS' 
         DC &COLOR&BG&RED
         DC C'- MS-DOS'
* Windows
         DC X'11C9D8'
         DC &COLOR&BG&BLUE
         DC C'WIN' 
         DC &COLOR&BG&RED
         DC C'- Windows 7'

*--------------------
* Set Cursor Input
         DC    X'11D3D9'
         DC    &COLOR&BG&GREEN
         DC    C'Enter Below Ye Who Dare'
         DC    X'11D5F8'
         DC    &COLOR&BG&YELLOW
         DC    X'11D5F6'               SBA, ROW 15 COL 42
         DC    X'290341F442F6C0C8'     SFE, UNPROTECTED/UNDL/YELLOW
         DC    30X'40'
         DC    &COLOR&BG&YELLOW          
         DC    X'290242FCC0C8'         SFE, UNPROTECTED/NORMAL/YELLOW
         DC    X'11D5F7'               SBA, ROW 15 COL 42
         DC    X'13'                   INSERT CURSOR
* Now place messages on the screen for users
         DC    X'11C67A'
         DC    &COLOR&BG&GREEN
         DC    C&TEXT                  USS MESSAGES
         AIF ('&MSG' NE '02').SKIP  If the MSG is 02 display Win10
*                                   Accept Screen. 
*                                   Thanks to John Boudreaux.
*  TOP BAR
         DC    X'11C76D'               SBA, 1050     ROW 10 COL 13
         DC    &COLOR&BG&TURQ
         DC    &UPLEFT
         DC    52&HBAR
         DC    &UPRIGHT
* BOX WALLS
         DC    X'11C87D'               SBA, ROW 11 COL 13
         DC    &COLOR&BG&TURQ
         DC    &VBAR
         DC    52C' '
         DC    X'11C9F3'               SBA, ROW 11 COL 66
         DC    &VBAR
         DC    X'114A4D'               SBA, ROW 11 COL 13
         DC    &COLOR&BG&TURQ
         DC    &VBAR
         DC    52C' '
         DC    X'114BC3'               SBA, ROW 11 COL 66
         DC    &VBAR
         DC    X'114B5D'               SBA, ROW 11 COL 13
         DC    &COLOR&BG&TURQ
         DC    &VBAR
         DC    52C' '
         DC    X'114CD3'               SBA, ROW 11 COL 66
         DC    &VBAR
         DC    X'114C6D'               SBA, ROW 11 COL 13
         DC    &COLOR&BG&TURQ
         DC    &VBAR
         DC    52C' '
         DC    X'114DE3'               SBA, ROW 11 COL 66
         DC    &VBAR
         DC    X'114D7D'               SBA, ROW 11 COL 13
         DC    &COLOR&BG&TURQ
         DC    &VBAR
         DC    52C' '
         DC    X'1103B3'               SBA, ROW 11 COL 66
         DC    &VBAR
         DC    X'114F4D'               SBA, ROW 12 COL 13
         DC    &COLOR&BG&TURQ
         DC    &VBAR
         DC    52C' '
         DC    X'110403'               SBA, ROW 12 COL 66
         DC    &VBAR
         DC    X'11505D'               SBA, ROW 13 COL 13
         DC    &COLOR&BG&TURQ
         DC    &VBAR
         DC    52C' '
         DC    X'110453'               SBA, ROW 13 COL 66
         DC    &VBAR
         DC    X'11D16D'               SBA, ROW 14 COL 13
         DC    &COLOR&BG&TURQ
         DC    &VBAR
         DC    52C' '
         DC    X'1104A3'               SBA, ROW 14 COL 66
         DC    &VBAR
         DC    X'11D27D'               SBA, ROW 15 COL 13
         DC    &COLOR&BG&TURQ
         DC    &VBAR
         DC    52C' '
         DC    X'1104F3'               SBA, ROW 15 COL 66
         DC    X'0885'
*  BOTTOM BAR
         DC    X'11050D'               SBA, ROW 16 COL 13
         DC    &COLOR&BG&TURQ
         DC    &DOWNLEFT
         DC    52&HBAR
         DC    &DOWNRIGHT
* INSIDE BOX
         DC    X'114A50'               SBA, ROW 11 COL 16
         DC    &COLOR&BG&TURQ
         DC C'Windows 10'
         DC    X'114CF1'               SBA, ROW 13 COL 16
         DC C'Don''t miss out. Free upgrade offer ends July 29.'
* ACCEPT LINE
         DC    X'1150E3'               SBA, ROW 15 COL 18
         DC C'x Upgrade now             Accept free offer'
* UNDERLINES
         DC    X'1150E2'               SBA, ROW 15 COL 18
         DC    X'290341F442F5C0C8'     SFE, UNPROTECTED/UNDL/TURQ
         DC    C'x'
         DC    &COLOR&BG&TURQ
         DC    X'11507A'               SBA, ROW 15 COL 42
         DC    X'290341F442F5C0C8'     SFE, UNPROTECTED/UNDL/TURQ
         DC    X'40'
         DC    &COLOR&BG&TURQ
*         SPACE
.SKIP    ANOP
&BFEND   EQU   *                       END OF MESSAGE
.END     MEND
*
*
*               ..............
USSTAB   USSTAB TABLE=STDTRANS,FORMAT=DYNAMIC
TSO      USSCMD CMD=TSO,REP=LOGON,FORMAT=BAL
         USSPARM PARM=APPLID,DEFAULT=TSO
         USSPARM PARM=P1,REP=DATA
CICS     USSCMD  CMD=CICS,REP=LOGON,FORMAT=BAL
         USSPARM PARM=APPLID,DEFAULT='CICSTS42'
         USSPARM PARM=LOGMODE
         USSPARM PARM=P1,REP=DATA
         USSMSG MSG=00,BUFFER=(BUF00,SCAN)
         USSMSG MSG=01,BUFFER=(BUF01,SCAN)
         USSMSG MSG=02,BUFFER=(BUF02,SCAN)
         USSMSG MSG=03,BUFFER=(BUF03,SCAN)
         USSMSG MSG=04,BUFFER=(BUF04,SCAN)
         USSMSG MSG=05,BUFFER=(BUF05,SCAN)
         USSMSG MSG=06,BUFFER=(BUF06,SCAN)
         USSMSG MSG=08,BUFFER=(BUF08,SCAN)
         USSMSG MSG=10,BUFFER=(BUF10,SCAN)
         USSMSG MSG=11,BUFFER=(BUF11,SCAN)
         USSMSG MSG=12,BUFFER=(BUF12,SCAN)
         USSMSG MSG=14,BUFFER=(BUF14,SCAN)
*        SPACE
STDTRANS DC    X'000102030440060708090A0B0C0D0E0F'
         DC    X'101112131415161718191A1B1C1D1E1F'
         DC    X'202122232425262728292A2B2C2D2E2F'
         DC    X'303132333435363738393A3B3C3D3E3F'
         DC    X'404142434445464748494A4B4C4D4E4F'
         DC    X'505152535455565758595A5B5C5D5E5F'
         DC    X'604062636465666768696A6B6C6D6E6F'
         DC    X'707172737475767778797A7B7C7D7E7F'
         DC    X'80C1C2C3C4C5C6C7C8C98A8B8C8D8E8F'
         DC    X'90D1D2D3D4D5D6D7D8D99A9B9C9D9E9F'
         DC    X'A0A1E2E3E4E5E6E7E8E9AAABACADAEAF'
         DC    X'B0B1B2B3B4B5B6B7B8B9BABBBCBDBEBF'
         DC    X'C0C1C2C3C4C5C6C7C8C9CACBCCCDCECF'
         DC    X'D0D1D2D3D4D5D6D7D8D9DADBDCDDDEDF'
         DC    X'E0E1E2E3E4E5E6E7E8E9EAEBECEDEEEF'
         DC    X'F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF'
END      USSEND
*        SPACE
*********************************************************************** ********
*DEFAULT MESSAGE PROVIDED BY VTAM:
*  MSG 00: IST457I POSITIVE command COMMAND RESPONSE
*  MSG 01: IST450I INVALID command COMMAND SYNTAX
*  MSG 02: IST451I command COMMAND UNRECOGNIZED, PARAMETER=parameter
*  MSG 03: IST452I parameter PARAMETER EXTRANEOUS
*  MSG 04: IST453I parameter PARAMETER VALUE value NOT VALID
*  MSG 05: N/A
*  MSG 06: IST792I NO SUCH SESSION EXISTS
*  MSG 07: N/A
*  MSG 08: IST454I command COMMAND FAILED, INSUFFICIENT STORAGE
*  MSG 09: N/A
*  MSG 10: READY
*  MSG 11: IST455I parameters SESSIONS ENDED
*  MSG 12: IST456I keyword REQUIRED PARAMETER OMITTED
*  MSG 13: N/A
*  MSG 14: IST458I USS MESSAGE number NOT DEFINED
*********************************************************************** ********
*  CUSTOMIZED USS MESSAGES:
         SCREEN MSG=00,TEXT='Launchin your shit for ya'
         SCREEN MSG=01,TEXT=' '
         SCREEN MSG=02,TEXT=' '
         SCREEN MSG=03,TEXT='Parameter is unrecognized!'
         SCREEN MSG=04,TEXT='Parameter with value is invalid'
         SCREEN MSG=05,TEXT='The key you pressed is inactive'
         SCREEN MSG=06,TEXT='There is not such session.'
         SCREEN MSG=08,TEXT='Command failed as storage shortage.'
         SCREEN MSG=10,TEXT=' '
         SCREEN MSG=11,TEXT='Your session has ended'
         SCREEN MSG=12,TEXT='Required parameter is missing'
         SCREEN MSG=14,TEXT='There is an undefined USS message'
   END
/*
//L.SYSLMOD DD DSN=USER.VTAMLIB,DISP=SHR
//L.SYSIN   DD *
  NAME USSN(R)
//*
