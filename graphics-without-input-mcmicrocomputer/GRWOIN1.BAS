100 REM Sine, cosine table
110 P=3.1415926:PP=12:PA=PP*2:PQ=P/PP:PG=P/180:GG=360
120 REM P        Pi
130 REM PA/PP    Number of items in Complete and Meta table
140 REM PQ       Correspondence between Table and Radians
150 REM PG       Correspondence between Radians and Degrees
160 REM S(),C()  Sine and Cosine table
170 DIM S(PA),C(PA):FOR I=0 TO PA:S(I)=SIN(I*PQ):C(I)=COS(I*PQ):NEXT I
180 CLS :REM PRINTING THE TABLE
200 FOR I=0 TO PA:? "Idx: ";I;":"
210   ? "Radians: ";I*PQ;" Degrees: ";I*GG/PA
220   ? "Sin: ";S(I);" Cos: ";C(I):? :NEXT I
230 CLS :REM STEP BY STEP TRANSFORMATION
240 ? "Angle in Degrees   ";:INPUT AG:IF AG=999 THEN 290
250 AG=AG-INT(AG/GG)*GG:? "Angle in Degrees   ";AG
260 AR=PQ*AG:? "Angle in Radians    ";AR
270 ? "Elements in Table    ";PA
280 NE=INT(0.5+AR/PQ):? "Table Element     ";NE:? :GOTO 240
290 CLS :REM DIRECT TRANSFORMATION
310 ? "Angle in Degrees  ";:INPUT AG:IF AG=999 THEN 350
320 ? "Sine          ";:A=AG:EXEC FNA:? S(R)
330 ? "Cosine        ";:A=AG:EXEC FNA:? C(R)
340 ? :GOTO 310
350 CLS :END 
360 PROC FNA
370   R=INT(0.5+PG*(A-INT(A/GG)*GG)/PQ)
380 ENDPROC
