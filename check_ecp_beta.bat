@echo off
chcp 1251 > nul
cd /d "%~dp0"

:: Укажите точный путь к AvCmUt4.exe
set "AVCMUT_PATH=c:\Program Files (x86)\Avest\AvPCM_nces\AvCmUt4.exe"

for %%i in (*.sgn) do (
    echo Найдена подпись: %%i
    echo Исходный файл:  %%~ni

    if exist "%%~ni" (
        "%AVCMUT_PATH%" -V "%%i" -F "%%~ni" -NA -VIEWMSG
    ) else (
        echo [ОШИБКА] Исходный файл "%%~ni" не найден в текущей папке.
    )
    echo --------------------------------------------------
)

pause