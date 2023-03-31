REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

set PATH=^
D:\Softwares\cmake-3.25.1-windows-x86_64\bin;^
D:\Softwares\jdk-11.0.13+8\bin;^
%SystemRoot%\System32;

cmake.exe -P generate.cmake
pause