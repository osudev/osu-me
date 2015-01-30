@echo off
:: Windows version of the init script.

setlocal
set SCRIPT_DIR=%~dp0

pushd "%SCRIPT_DIR%\build"
  call npm install -g grunt-cli
  call npm install
  call grunt download-atom-shell
popd

pushd "%SCRIPT_DIR%\app"
  call npm install
popd
