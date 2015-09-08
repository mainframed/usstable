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
&WHITE   SETC  'X''2902C0F842FF'''       SFE HI,SKIP,WHITE
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
&BFNAME  SETC  'BUF'.'&MSG'
&BFBEGIN SETC  '&BFNAME'.'B'
&BFEND   SETC  '&BFNAME'.'E'
.BEGIN   DS    0F
&BFNAME  DC    AL2(&BFEND-&BFBEGIN)    MESSAGE LENGTH
&BFBEGIN EQU   *                       START OF MESSAGE
         DC    X'F57A'                 ERASE/WRITE, WCC
         DC    X'110000'               SBA, 0000     ROW 00 COL 01
         DC &WHITE
         DC C'              ___          ooooooooooo  '
         DC C'                    .o8                 '
         DC C'         .-"``   ``.       `888''   `Y8b '
         DC C'                   "888                 '
         DC C'       .''           \       888      888'
         DC C'  .ooooo.  oooo d8b 888oooo. oooo    oo '
         DC C'      /:;            \  _  '
         DC &TURQ
         DC C'888      888 d88'' `88b `888""8P d88'' `88b `88.  .8'''
         DC &WHITE
         DC C'     |:::         __ \-'' \ '
         DC &TURQ
         DC C'888      888 888ooo888  888     888   888  `88..8'' '
         DC &WHITE
         DC C'     |::`  __.._"`   |,__/ '
         DC &BLUE
         DC C'888     d88'' 888    .o  888     888   888   `888''  '
         DC &WHITE
         DC C' /--_|___.`       _.-"    '
         DC &BLUE
         DC C'o888bood8P''   `Y8bod8P'' o888o    `Y8bod8P''    .8''   '
         DC &WHITE
         DC C'/    |::.  __..-"`                      '
         DC &BLUE
         DC C'                             .o..P''   '
         DC &WHITE
         DC C'`.___.---"`            '
         DC &GREEN
         DC C'G88                        '
         DC &YELLOW
         DC C'_________________ '
         DC &BLUE
         DC C'Y8P''    '
         DC &GREEN
         DC C'         .d8"88"88"88"88888                      '
         DC &YELLOW
         DC C'/\                 \         '
         DC &GREEN
         DC C'        .888o88o88o88o88888                      '
         DC &YELLOW
         DC C'\_| '
         DC &WHITE
         DC C'CoMmAnDs:    '
         DC &YELLOW
         DC C'|         '
         DC &GREEN
         DC C'     .d88P             `Y88                        '
         DC &YELLOW
         DC C'|                |         '
         DC &GREEN
         DC C'     8  8                   '
         DC &WHITE
         DC C'.ooooo.  ooo. .oo.    '
         DC &YELLOW
         DC C'|    '
         DC &TURQ
         DC C'CICS      '
         DC &YELLOW
         DC C'|         '
         DC &GREEN
         DC C'     8888                  '
         DC &PINK
         DC C'd88'' `88b `888P"Y88b   '
         DC &YELLOW
         DC C'|                |         '
         DC &GREEN
         DC C'     8  8                  '
         DC &PINK
         DC C'888   888  888   888   '
         DC &YELLOW
         DC C'|    '
         DC &RED
         DC C'TSO       '
         DC &YELLOW
         DC C'|         '
         DC &GREEN
         DC C'     8888                  '
         DC &RED
         DC C'888   888  888   888   '
         DC &YELLOW
         DC C'|                |         '
         DC &GREEN
         DC C'     8  8                  '
         DC &RED
         DC C'`Y8bod8P'' o888o o888o  '
         DC &YELLOW
         DC C'|    '
         DC &GREEN
         DC C'IMS       '
         DC &YELLOW
         DC C'|         '
         DC &GREEN
         DC C'     `Y88b             .d88                        '
         DC &YELLOW
         DC C'|  ______________|_        '
         DC &GREEN
         DC C'       `Y888"88"88"88"88888                        '
         DC &YELLOW
         DC C'\_/_______________/        '
         DC &GREEN
         DC C'         `YSoF8o88o88o88888    '
         DC &WHITE
         DC C'Command:'
         DC &GREEN
         DC    X'290242FCC0C8'         SFE, UNPROTECTED/NORMAL/YELLOW
         DC    X'13'                   INSERT CURSOR
         DC C'                                      '
         DC &GREEN
         DC C'                       G88             '
         DC C'                                        '
         DC    C&TEXT                  USS MESSAGES
&BFEND   EQU   *                       END OF MESSAGE
.END     MEND
*
*
*               ..............
USSTAB   USSTAB TABLE=STDTRANS,FORMAT=DYNAMIC
*        SPACE
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
    SCREEN MSG=00,TEXT='Launchin your shit for ya'
    SCREEN MSG=01,TEXT='loooooooooooooooooooooooooool'
    SCREEN MSG=02,TEXT='loooooooooooooooooooooooooool'
    SCREEN MSG=03,TEXT='Parameter is unrecognized!'
*       SCREEN MSG=04,TEXT='Parameter with value is invalid'
    SCREEN MSG=05,TEXT='The key you pressed is inactive'
    SCREEN MSG=06,TEXT='There is not such session.'
    SCREEN MSG=08,TEXT='Command failed as storage shortage.'
    SCREEN MSG=10,TEXT='  '
    SCREEN MSG=11,TEXT='Your session has ended'
    SCREEN MSG=12,TEXT='Required parameter is missing'
    SCREEN MSG=14,TEXT='There is an undefined USS message'
   END
/*
//L.SYSLMOD DD DSN=USER.VTAMLIB,DISP=SHR
//L.SYSIN   DD *
  NAME USSN(R)
//*
