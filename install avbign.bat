@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

:: ============================================================
::  Тихая установка:
::  1. Криптопровайдер Avest CSP Bign 6.3.0.842
::  2. Менеджер сертификатов NCES (AvPCM) 6.1.0.1174
::  Без перезагрузки
:: ============================================================

:: Определяем пути
set "SETUP_DIR=%~dp0"
set "DATA_DIR=%SETUP_DIR%data"
set "TEMP_DIR=%TEMP%"

:: Проверяем наличие файлов
if not exist "%DATA_DIR%\setupAvCSPBign6.3.0.842.exe" (
    echo [ERROR] Не найден: setupAvCSPBign6.3.0.842.exe
    pause
    exit /b 1
)

if not exist "%DATA_DIR%\AvPCMEx_setup.exe" (
    echo [ERROR] Не найден: AvPCMEx_setup.exe
    pause
    exit /b 1
)

echo.
echo ========================================
echo  Установка Avest CSP Bign + AvPCM NCES
echo  (тихий режим, без перезагрузки)
echo ========================================
echo.

:: ----------------------------------------------------------
:: 1. Криптопровайдер Avest CSP Bign
:: ----------------------------------------------------------
echo [1/2] Установка Криптопровайдера Avest CSP Bign 6.3.0.842 ...

:: Создаём пустой файл энтропии (если нужен)
if not exist "%TEMP_DIR%\mouse.dat" (
    echo. > "%TEMP_DIR%\mouse.dat"
)

"%DATA_DIR%\setupAvCSPBign6.3.0.842.exe" ^
    /VERYSILENT ^
    /NORESTART ^
    /SUPPRESSMSGBOXES ^
    /RESTARTEXITCODE=3010 ^
    /entropy="%TEMP_DIR%\mouse.dat" ^
    "/devices=AvBign"

if errorlevel 1 (
    echo [WARNING] CSP вернул код ошибки %errorlevel% (возможно уже установлен)
) else (
    echo [OK] Криптопровайдер установлен
)

echo.

:: ----------------------------------------------------------
:: 2. Менеджер сертификатов NCES (AvPCM)
:: ----------------------------------------------------------
echo [2/2] Установка Менеджера сертификатов NCES 6.1.0.1174 ...

"%DATA_DIR%\AvPCMEx_setup.exe" ^
    /VERYSILENT ^
    /NORESTART ^
    /SUPPRESSMSGBOXES ^
    /typestore=systemstore ^
    /DIR="%ProgramFiles(x86)%\Avest\AvPCM_ncesBign"

if errorlevel 1 (
    echo [WARNING] AvPCM вернул код ошибки %errorlevel% (возможно уже установлен)
) else (
    echo [OK] Менеджер сертификатов установлен
)

echo.
echo ========================================
echo  Установка завершена.
echo  Перезагрузка НЕ требуется.
echo ========================================
echo.

endlocal
exit /b 0