robocopy \\10.200.1.1\Archive\Today\ d:\PKI\Crl_loader\Certificates\ *.cer /LOG+:d:\PKI\Crl_loader\log1.txt
forfiles -p "D:\PKI\Crl_loader\Certificates" -s -m *.* -d -1 -c "cmd /c del @path"
robocopy \\10.200.1.1\Archive\Fastload\ d:\PKI\Crl_loader\Certificates\ *.cer
robocopy \\10.200.1.1\Archive\Fastload\ d:\PKI\Crl_loader\Certificates\ *.p7b

@echo off
setlocal
for /f  "usebackq delims=;" %%A in (`dir /b *.log`) do If %%~zA GTR 32134287 del "%%A"



@echo off
setlocal
for /f  "usebackq delims=;" %%A in (`dir /b *.txt`) do If %%~zA GTR 32134287 del "%%A"
