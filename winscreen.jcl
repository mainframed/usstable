//USSSCHG  JOB (JOBNAME),'CREATE USS SCREEN ',CLASS=A,                  00010000
//*            TYPRUN=SCAN,                                             00020000
//             MSGLEVEL=(1,1),MSGCLASS=K,NOTIFY=&SYSUID                 00030000
//*******************************************************************
//*                                                                 *
//*           JCL used to change TSO/vtam                           *
//*             signon screen                                       *
//*                                                                 *
//*           John Boudreaux                                        *
//*           07/15/2016   Annoyed by Windows popup..               *
//*           07/16/2016   asmacl - bind & link                     *
//*           07/17/2016   Added Graphic Macros                     *
//*           07/18/2016   Stole SoF's Color Macros and cleaned up  *
//*                                                                 *
//*******************************************************************
//BUILD   EXEC ASMACL
//C.SYSLIB  DD DSN=SYS1.SISTMAC1,DISP=SHR
//          DD DSN=SYS1.MACLIB,DISP=SHR
//C.SYSIN   DD *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
         MACRO
&NAME    SCREEN &MSG=™,&TEXT=™
         AIF   ('&MSG' EQ '™' OR '&TEXT' EQ '™').END
         LCLC  &BFNAME,&BFSTART,&BFEND
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* Declaring Kick-Ass Color to make sweet-sweet art with   - SoF     *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
&BLUE    SETC  'X''2902C0F842F1'''       SFE HI,SKIP,BLUE
&RED     SETC  'X''2902C0F842F2'''       SFE HI,SKIP,RED
&PINK    SETC  'X''2902C0F842F3'''       SFE HI,SKIP,PINK
&GREEN   SETC  'X''2902C0F842F4'''       SFE HI,SKIP,GREEN
&TURQ    SETC  'X''2902C0F842F5'''       SFE HI,SKIP,TURQ
&YELLOW  SETC  'X''2902C0F842F6'''       SFE HI,SKIP,YELLOW
&WHITE   SETC  'X''2902C0F842F7'''       SFE HI,SKIP,WHITE
&BLACK   SETC  'X''2902C0F842F8'''       SFE HI,SKIP,BLACK
&DBLUE   SETC  'X''2902C0F842F9'''       SFE HI,SKIP,DBLUE
&ORANGE  SETC  'X''2902C0F842FA'''       SFE HI,SKIP,ORANGE
&PURPLE  SETC  'X''2902C0F842FB'''       SFE HI,SKIP,PURPLE
&LGREEN  SETC  'X''2902C0F842FC'''       SFE HI,SKIP,LGREEN
&LTURQ   SETC  'X''2902C0F842FD'''       SFE HI,SKIP,LTURQ
&GREY    SETC  'X''2902C0F842FE'''       SFE HI,SKIP,GREY
&BWHITE  SETC  'X''2902C0F842FF'''       SFE HI,SKIP,BOLDWHITE
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
&BFNAME  SETC  'BUF'.'&MSG'
&BFBEGIN SETC  '&BFNAME'.'B'
&BFEND   SETC  '&BFNAME'.'E'
.BEGIN   DS    0F
&BFNAME  DC    AL2(&BFEND-&BFBEGIN)        MESSAGE LENGTH
&BFBEGIN EQU   *                       START OF MESSAGE
         DC    X'F57A'                 ERASE/WRITE, WCC
         DC    X'110000'               SBA, 0000     ROW 00 COL 01
         DC    &YELLOW
         DC    C'Mainframe Operating System           '
         DC    C'                          z/OS V1.10 '
*              NEXT LINES ARE LOGO
         DC    X'110050'               SBA, 0080     ROW 01 COL 01
         DC    &BLUE
         DC C'                                        '
         DC C'                                        '
         DC C'                                        '
         DC C'                                        '
         DC C'                           JBX Demo Syst'
         DC C'em Build                                '
         DC C'                                        '
         DC C'                                        '
         DC    X'110190'               SBA, 0080     ROW 05 COL 01
         DC    &RED
         DC C'                                //  OOOO'
         DC C'OOO   SSSSSS                            '
         DC C'                               //  OO   '
         DC C' OO SS                                  '
         DC C'                       zzzzzz //  00    '
         DC C'OO SS                                   '
         DC C'                         zz  //  OO    O'
         DC C'O SSSS                                  '
         DC C'                       zz   //  OO    OO'
         DC C'      SS                                '
*  TOP BAR
         DC    X'11032D'               SBA, 1050     ROW 10 COL 13
         DC    &TURQ
         DC    &UPLEFT
         DC    52&HBAR
         DC    &UPRIGHT
* BOX WALLS
         DC    X'11037D'               SBA, ROW 11 COL 13
         DC    &TURQ
         DC    &VBAR
         DC    X'1103B3'               SBA, ROW 11 COL 66
         DC    &VBAR
         DC    X'1103CE'               SBA, ROW 12 COL 13
         DC    &VBAR
         DC    X'110403'               SBA, ROW 12 COL 66
         DC    &VBAR
         DC    X'11041E'               SBA, ROW 13 COL 13
         DC    &VBAR
         DC    X'110453'               SBA, ROW 13 COL 66
         DC    &VBAR
         DC    X'11046E'               SBA, ROW 14 COL 13
         DC    &VBAR
         DC    X'1104A3'               SBA, ROW 14 COL 66
         DC    &VBAR
         DC    X'1104BE'               SBA, ROW 15 COL 13
         DC    &VBAR
         DC    X'1104F3'               SBA, ROW 15 COL 66
         DC    X'0885'
*  BOTTOM BAR
         DC    X'11050D'               SBA, ROW 16 COL 13
         DC    &TURQ
         DC    &DOWNLEFT
         DC    52&HBAR
         DC    &DOWNRIGHT
* INSIDE BOX
         DC    X'110380'               SBA, ROW 11 COL 16
         DC    &TURQ
         DC C'Windows 10'
         DC    X'110421'               SBA, ROW 13 COL 16
         DC C'Don t miss out. Free upgrade offer ends July 29.'
* STUPID APOSTROPHE
         DC    X'110424'               SBA, ROW 13 COL 16
         DC    X'7d'
* ACCEPT LINE
         DC    X'1104C3'               SBA, ROW 15 COL 18
         DC C'x Upgrade now             Decline free offer'
* UNDERLINES
         DC    X'1104C2'               SBA, ROW 15 COL 18
         DC    X'290341F442F5C0C8'     SFE, UNPROTECTED/UNDL/TURQ
         DC    X'A7'
         DC    &TURQ
         DC    X'1104DA'               SBA, ROW 15 COL 42
         DC    X'290341F442F5C0C8'     SFE, UNPROTECTED/UNDL/TURQ
         DC    X'00'
         DC    &TURQ
.* APPLICATION: TSO
         DC    X'110558'               APPLICATION POSITION
         DC    &RED
         DC    C'TSO'                  APPLICATION NAME
         DC    X'110561'               DESCRIPTION POSITION
         DC    &BLUE
         DC    C'- Logon to TSO/ISPF'  APPLICATION DESCRIPTION
.* APPLICATION: NETVIEW
         DC    X'11057C'               APPLICATION POSITION
         DC    &RED
         DC    C'CNM01'                APPLICATION NAME
         DC    X'110585'               DESCRIPTION POSITION
         DC    &BLUE
         DC    C'- Netview System'     APPLICATION DESCRIPTION
.* APPLICATION: CICSTS32
         DC    X'1105A8'               APPLICATION POSITION
         DC    &RED
         DC    C'CICSTS32'             APPLICATION NAME
         DC    X'1105B1'               DESCRIPTION POSITION
         DC    &BLUE
         DC    C'- CICS System'        APPLICATION DESCRIPTION
.* APPLICATION: SA
         DC    X'1105CC'               APPLICATION POSITION
         DC    &RED
         DC    C'SA'                   APPLICATION NAME
         DC    X'1105D5'               DESCRIPTION POSITION
         DC    &BLUE
         DC    C'- System Automation'  APPLICATION DESCRIPTION
.* APPLICATION: IMS
         DC    X'1105F8'               APPLICATION POSITION
         DC    &RED
         DC    C'IMS'                  APPLICATION NAME
         DC    X'110601'               DESCRIPTION POSITION
         DC    &BLUE
         DC    C'- IMS System'         APPLICATION DESCRIPTION
.* OTHER INFORMATION
         DC    X'110640'               SBA, ROW 21 COL 01
         DC    C'Enter your choice==>'
         DC    X'110654'               SBA, ROW 21 COL 22
         DC    X'290242F2C0C8'         SFE, UNPROTECTED/NORMAL/RED
         DC    X'13'                   INSERT CURSOR
         DC    X'11068F'               SBA, ROW 22 COL 01
         DC    &YELLOW
         DC    C&TEXT                  USS MESSAGES
         DC    X'11072F'               SBA, ROW 23 COL 01
         DC    X'290242F4C0E0'         SFE, PROTECTED/NORMAL/GREEN
         DC    C'Your IP(@@@@@@@@@IPADDR:@@PRT), SNA LU(@@LUNAME)'
         DC    C'         @@@@DATE @@@@TIME'
&BFEND   EQU   *                       END OF MESSAGE
.END     MEND
*
*
*               ..............
USSTAB   USSTAB TABLE=STDTRANS,FORMAT=DYNAMIC
*        SPACE
TSO      USSCMD CMD=TSO,REP=LOGON,FORMAT=BAL      TSO
         USSPARM PARM=APPLID,DEFAULT=TSO
         USSPARM PARM=P1,REP=DATA
*        SPACE
CNM01    USSCMD  CMD=CNM01,REP=LOGON,FORMAT=BAL
         USSPARM PARM=APPLID,DEFAULT=CNM01
CICS     USSCMD  CMD=CICS,REP=LOGON,FORMAT=BAL
         USSPARM PARM=APPLID,DEFAULT=CICS
IMS      USSCMD  CMD=IMS,REP=LOGON,FORMAT=BAL
         USSPARM PARM=APPLID,DEFAULT=IMS81CR1
SA       USSCMD  CMD=CNM01,REP=LOGON,FORMAT=BAL
         USSPARM PARM=APPLID,DEFAULT=CNM01
*        SPACE
         USSMSG MSG=00,BUFFER=(BUF00,SCAN)
         USSMSG MSG=01,BUFFER=(BUF01,SCAN)
         USSMSG MSG=02,BUFFER=(BUF02,SCAN)
         USSMSG MSG=03,BUFFER=(BUF03,SCAN)
*        USSMSG MSG=04,BUFFER=(BUF04,SCAN)
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
         SCREEN MSG=00,TEXT='Command is in progress...'
         SCREEN MSG=01,TEXT='Invalid command or syntax'
         SCREEN MSG=02,TEXT='Invalid Command'
         SCREEN MSG=03,TEXT='Parameter is unrecognized!'
*        SCREEN MSG=04,TEXT='Parameter with value is invalid'
         SCREEN MSG=05,TEXT='The key you pressed is inactive'
         SCREEN MSG=06,TEXT='There is not such session.'
         SCREEN MSG=08,TEXT='Command failed as storage shortage.'
         SCREEN MSG=10,TEXT='Enter one of above commands in red'
         SCREEN MSG=11,TEXT='Your session has ended'
         SCREEN MSG=12,TEXT='Required parameter is missing'
         SCREEN MSG=14,TEXT='There is an undefined USS message'
         END
/*
//L.SYSLMOD DD DISP=SHR,DSN=DUZA.VTAMLIB
//L.SYSIN   DD *
  NAME USSN(R)
//*
