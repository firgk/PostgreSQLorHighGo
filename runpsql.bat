@echo off

REM HighGo DB System psql runner script for Windows
REM Quan Zongliang, HighGo Tech

for /f "delims=" %%a in ('chcp ^|find /c "932"') do @ SET CLIENTENCODING_JP=%%a
if "%CLIENTENCODING_JP%"=="1" SET PGCLIENTENCODING=SJIS

if not "%PGCLIENTENCODING%"=="" goto psqlcmd
SET PGCLIENTENCODING=GBK

REM Run psql
:psqlcmd
psql.exe -h localhost -U "highgo" -d highgo -p 5866

pause
