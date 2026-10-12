@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

:: ============================================================
::  Тихое удаление Avest (Bel + Bign + оба менеджера)
::  Без чтения реестра — только запуск unins000.exe из папок
:: ============================================================

echo.
echo ========================================================
echo  Удаление Avest CSP Bel / Bign + AvPCM
echo  (только по папкам, тихий режим)
echo ========================================================
echo.

:: Список возможных папок установки (порядок важен)
set "PATHS[0]=%ProgramFiles(x86)%\Avest\AvPCM_nces"
set "PATHS[1]=%ProgramFiles(x86)%\Avest\AvPCM_ncesBign"
set "PATHS[2]=%ProgramFiles(x86)%\Avest\Avest CSP Bel"
set "PATHS[3]=%ProgramFiles(x86)%\Avest\Avest CSP Bign"
set "PATHS[4]=%ProgramFiles%\Avest\AvPCM_nces"
set "PATHS[5]=%ProgramFiles%\Avest\AvPCM_ncesBign"
set "PATHS[6]=%ProgramFiles%\Avest\Avest CSP Bel"
set "PATHS[7]=%ProgramFiles%\Avest\Avest CSP Bign"

:: Дополнительные возможные варианты (на всякий случай)
set "PATHS[8]=%ProgramFiles(x86)%\Avest\Avest CSP Bel Pro"
set "PATHS[9]=%ProgramFiles%\Avest\Avest CSP Bel Pro"

set COUNT=0

for /L %%i in (0,1,9) do (
    set "DIR=!PATHS[%%i]!"
    if exist "!DIR!\unins000.exe" (
        set /a COUNT+=1
        echo [!COUNT!] Найден: !DIR!\unins000.exe
        echo     Запуск тихого удаления...
        
        start /wait "" "!DIR!\unins000.exe" /VERYSILENT /NORESTART /SUPPRESSMSGBOXES
        
        if !errorlevel! equ 0 (
            echo     [OK] Удалено успешно
        ) else (
            echo     [WARNING] Код возврата: !errorlevel!
        )
        echo.
    )
)

if %COUNT% equ 0 (
    echo [INFO] Не найдено ни одного unins000.exe в стандартных папках.
    echo        Возможно, компоненты уже удалены или установлены в другое место.
) else (
    echo ========================================================
    echo  Обработано компонентов: %COUNT%
    echo  Удаление завершено. Перезагрузка не требуется.
    echo ========================================================
)

echo.
endlocal
exit /b 0