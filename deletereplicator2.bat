@echo off
setlocal EnableDelayedExpansion

pushd d:\PKI\test\1\
set top=1
set filespec=*.eml
set counter=0

for /f "delims=" %%f in ('dir /b %filespec%') do (
    set /a counter+=1
    if !counter! GTR %top% del /q "%%f"
)