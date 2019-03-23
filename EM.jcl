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
//*           Chad D. Rikansrud                                     *
//*           Evil Mainframe logo by SoF                            *
//*           Copyright EM Training LLC                             *
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
&BFNAME  SETC  'BUF'.'&MSG'
&BFBEGIN SETC  '&BFNAME'.'B'
&BFEND   SETC  '&BFNAME'.'E'
.BEGIN   DS    0F
&BFNAME  DC    AL2(&BFEND-&BFBEGIN)    MESSAGE LENGTH
&BFBEGIN EQU   *                       START OF MESSAGE
         DC    X'F5'       ERASE/WRITE
         DC    X'C3'       WCC
         DC    X'114040'   SBA
         DC    X'2902'     SFE (Three Attribute Pairs To Follow)
         DC    X'C0F8'     ATTR #1 (BASIC = PROTECTED)
         DC    X'42F2'     ATTR #3 (COLOR = RED)
         DC    21X'40'
         DC    C'@@S@@@@@  @@@  @O@  @@@  @F@'
         DC    8X'40'
         DC    X'2902C0F842F5'
         DC    C'Unauthorized'
         DC    X'2902C0F842F2'
         DC    30X'40'
         DC    C'@@@@@@@@  @@@  @@@  @@@  @@@        '
         DC    X'2902C0F842F5'
         DC    C'Access'
         DC    X'2902C0F842F2'
         DC    36X'40'
         DC    C'@@!       @@!  @@@  @@!  @@!        '
         DC    X'2902C0F842F5'
         DC    C'Forbidden'
         DC    X'2902C0F842F2'
         DC    33X'40'
         DC    C'!@!       !@!  @!@  !@!  !@!'
         DC    52X'40'
         DC    C'@!!!:!    @!@  !@!  !!@  @!!'
         DC    52X'40'
         DC    C'!!!!!:    !@!  !!!  !!!  !!!'
         DC    52X'40'
         DC    C'!!:       :!:  !!:  !!:  !!:'
         DC    52X'40'
         DC    C':!:        ::!!:!   :!:  ::!:'
         DC    52X'40'
         DC    C':: ::::    ::::     ::  ::: ::::'
         DC    47X'40'
         DC    C': :: ::      :      :    : :: : :'
         DC    24X'40'
         DC    160X'40'
         DC    X'2902C0F842F1'
         DC    C'   ==   ==   ====   ======  ==  ==  '
         DC    C'======  =====    ====   ==   ==  ======    '
         DC    C'    === ===  ==  ==    ==    === ==  '
         DC    C'==      ==  ==  ==  ==  === ===  ==        '
         DC    C'    == = ==  ======    ==    == ===  '
         DC    C'====    =====   ======  == = ==  ====      '
         DC    C'    ==   ==  ==  ==    ==    ==  ==  '
         DC    C'==      ==  ==  ==  ==  ==   ==  ==        '
         DC    C'    ==   ==  ==  ==  ======  ==  ==  '
         DC    C'==      ==  ==  ==  ==  ==   ==  ======    '
         DC    X'2902C0F842F7'
         DC    160X'40'
         DC    X'2902C0C842F7'         SFE, UNPROTECTED, TURQ
         DC    X'13'                   INSERT CURSOR
         DC    X'114EC7'
         DC    X'2901C00C'
         DC    C'Look at you Hacker! ID is HCKR'
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
  NAME EM(R)
//*
