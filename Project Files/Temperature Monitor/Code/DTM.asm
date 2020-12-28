
_readTenperature:

;DTM.c,22 :: 		void readTenperature(void)
;DTM.c,24 :: 		temp = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
;DTM.c,25 :: 		temp = temp * 0.4887;
	CALL       _int2double+0
	MOVLW      227
	MOVWF      R4+0
	MOVLW      54
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
;DTM.c,27 :: 		if(temp<=10)
	MOVLW      128
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__readTenperature22
	MOVF       R0+0, 0
	SUBLW      10
L__readTenperature22:
	BTFSS      STATUS+0, 0
	GOTO       L_readTenperature0
;DTM.c,29 :: 		PORTD=0b00000100;
	MOVLW      4
	MOVWF      PORTD+0
;DTM.c,30 :: 		}
	GOTO       L_readTenperature1
L_readTenperature0:
;DTM.c,32 :: 		else if(temp>10 && temp<=22 )
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _temp+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__readTenperature23
	MOVF       _temp+0, 0
	SUBLW      10
L__readTenperature23:
	BTFSC      STATUS+0, 0
	GOTO       L_readTenperature4
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _temp+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__readTenperature24
	MOVF       _temp+0, 0
	SUBLW      22
L__readTenperature24:
	BTFSS      STATUS+0, 0
	GOTO       L_readTenperature4
L__readTenperature20:
;DTM.c,34 :: 		PORTD=0b00001000;
	MOVLW      8
	MOVWF      PORTD+0
;DTM.c,35 :: 		}
	GOTO       L_readTenperature5
L_readTenperature4:
;DTM.c,36 :: 		else if(temp>22 && temp<=32 )
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _temp+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__readTenperature25
	MOVF       _temp+0, 0
	SUBLW      22
L__readTenperature25:
	BTFSC      STATUS+0, 0
	GOTO       L_readTenperature8
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _temp+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__readTenperature26
	MOVF       _temp+0, 0
	SUBLW      32
L__readTenperature26:
	BTFSS      STATUS+0, 0
	GOTO       L_readTenperature8
L__readTenperature19:
;DTM.c,38 :: 		PORTD=0b00010000;
	MOVLW      16
	MOVWF      PORTD+0
;DTM.c,39 :: 		}
	GOTO       L_readTenperature9
L_readTenperature8:
;DTM.c,40 :: 		else if(temp>32 && temp<=48 )
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _temp+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__readTenperature27
	MOVF       _temp+0, 0
	SUBLW      32
L__readTenperature27:
	BTFSC      STATUS+0, 0
	GOTO       L_readTenperature12
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _temp+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__readTenperature28
	MOVF       _temp+0, 0
	SUBLW      48
L__readTenperature28:
	BTFSS      STATUS+0, 0
	GOTO       L_readTenperature12
L__readTenperature18:
;DTM.c,42 :: 		PORTD=0b00100000;
	MOVLW      32
	MOVWF      PORTD+0
;DTM.c,43 :: 		}
	GOTO       L_readTenperature13
L_readTenperature12:
;DTM.c,44 :: 		else if(temp>48)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _temp+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__readTenperature29
	MOVF       _temp+0, 0
	SUBLW      48
L__readTenperature29:
	BTFSC      STATUS+0, 0
	GOTO       L_readTenperature14
;DTM.c,46 :: 		PORTD=0b01000000;
	MOVLW      64
	MOVWF      PORTD+0
;DTM.c,47 :: 		}
L_readTenperature14:
L_readTenperature13:
L_readTenperature9:
L_readTenperature5:
L_readTenperature1:
;DTM.c,48 :: 		}
L_end_readTenperature:
	RETURN
; end of _readTenperature

_conversion:

;DTM.c,50 :: 		void conversion(void)
;DTM.c,52 :: 		inttostr(temp,temper);
	MOVF       _temp+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _temp+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _temper+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;DTM.c,53 :: 		}
L_end_conversion:
	RETURN
; end of _conversion

_display:

;DTM.c,55 :: 		void display(void)
;DTM.c,57 :: 		lcd_out(1,1,"Temperature=");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_DTM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DTM.c,58 :: 		lcd_out(1,13,Ltrim(temper));
	MOVLW      _temper+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;DTM.c,59 :: 		Lcd_Chr_Cp(0xdf);
	MOVLW      223
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;DTM.c,60 :: 		Lcd_Chr_Cp('C');
	MOVLW      67
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;DTM.c,61 :: 		Lcd_Chr_Cp(' ');
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;DTM.c,63 :: 		}
L_end_display:
	RETURN
; end of _display

_main:

;DTM.c,66 :: 		void main()
;DTM.c,69 :: 		ADC_Init();
	CALL       _ADC_Init+0
;DTM.c,70 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;DTM.c,71 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DTM.c,72 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DTM.c,73 :: 		Lcd_out(1,3,"Temperature");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_DTM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DTM.c,74 :: 		lcd_out(2,3,"Monitor");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_DTM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DTM.c,75 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
;DTM.c,76 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DTM.c,77 :: 		TRISD=0;
	CLRF       TRISD+0
;DTM.c,79 :: 		while(1)
L_main16:
;DTM.c,81 :: 		readTenperature();
	CALL       _readTenperature+0
;DTM.c,82 :: 		conversion();
	CALL       _conversion+0
;DTM.c,83 :: 		display();
	CALL       _display+0
;DTM.c,84 :: 		}
	GOTO       L_main16
;DTM.c,85 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
