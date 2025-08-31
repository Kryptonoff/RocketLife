@echo off

SETLOCAL ENABLEEXTENSIONS


for /F "Tokens=2* skip=2" %%A In ('REG QUERY "HKCU\SOFTWARE\bohemia interactive\arma 3 tools" /v "path" 2^>nul') do (set _TOOLPATH=%%B)

if defined _TOOLPATH goto mikefound
echo mikero tools is not set in registry

:mikefound
echo %_TOOLPATH%
pause
