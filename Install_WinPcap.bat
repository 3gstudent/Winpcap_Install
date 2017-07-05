@echo off
cd %~dp0
if "%PROCESSOR_ARCHITECTURE%"=="x86" move npf_x86.sys %SystemRoot%\system32\drivers\npf.sys
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" move npf_x64.sys %SystemRoot%\system32\drivers\npf.sys
if exist %SystemRoot%\system32\drivers\npf.sys (echo move success!) else (echo move error!)
sc create npf binPath= system32\drivers\npf.sys type= kernel start= demand error= normal tag= no DisplayName= "NetGroup Packet Filter Driver"
sc start npf
