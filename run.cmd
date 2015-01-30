@echo off
:: Windows version of the run script.

setlocal
set SCRIPT_DIR=%~dp0

"%SCRIPT_DIR%\build\atom-shell\atom" "%SCRIPT_DIR%\app"
