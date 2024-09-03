@echo off

REM HighGo DB System psql runner script for Windows
REM Quan Zongliang, HighGo Tech

SET hgdbhost=localhost
SET /P hgdbhost="Server [%hgdbhost%]: "

SET targetdb=highgo
SET /P targetdb="Database [%targetdb%]: "

SET hgdbport=5866
SET /P hgdbport="Port [%hgdbport%]: "

SET hgdbuname=highgo
SET /P hgdbuname="Username [%hgdbuname%]: "

for /f "delims=" %%a in ('chcp ^|find /c "932"') do @ SET CLIENTENCODING_JP=%%a
if "%CLIENTENCODING_JP%"=="1" SET PGCLIENTENCODING=SJIS

if not "%PGCLIENTENCODING%"=="" goto psqlcmd
SET PGCLIENTENCODING=GBK
SET /P PGCLIENTENCODING="Client Encoding [GBK]: "

REM Run psql
:psqlcmd
psql.exe -h %hgdbhost% -U "%hgdbuname%" -d %targetdb% -p %hgdbport%

pause
