@echo off
setlocal
cd /d "d:\PKI\Reestr\transport\replicator\"

:loop
set counter=0
for %%B in (*.eml) do set /a counter+=1
echo File Count = %counter%

if %counter% GEQ 2 (
    del *.eml
    )
) else (
  echo File count <> 2
)
