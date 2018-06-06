d:
cd D:\PKI\Authority\issued_certificates\
robocopy "D:\PKI\issued_certificates" D:\PKI\Archive\Today *.cer /LOG+:D:\PKI\Archive\log1.txt
move /y *.cer D:\PKI\Archive\Transit\

net use l: \\1.1.1.1\Certificates_172_NEW /user:123-N2\user user
cd D:\PKI\Archive\Transit\
xcopy *.cer l: /y
Net Use * /delete /y




net use l: \\1.1.1.1\Certificates__NEW /user:123-N2\user user
cd D:\PKI\Archive\Transit\
xcopy *.cer l: /y
Net Use * /delete /y

net use l: \\1.1.1.1\Certificates__NEW /user:123-N2\user user
cd D:\PKI\Archive\Transit\
xcopy *.cer l: /y
Net Use * /delete /y

net use l: \\1.1.1.1\Certificates__NEW /user:123-N2\user user
cd D:\PKI\Archive\Transit\
xcopy *.cer l: /y
Net Use * /delete /y

net use l: \\1.1.1.1\Certificates__NEW /user:123-N2\user user
cd D:\PKI\Archive\Transit\
xcopy *.cer l: /y
Net Use * /delete /y

net use l: \\1.1.1.1\Certificates__NEW /user:123-N2\user user
cd D:\PKI\Archive\Transit\
xcopy *.cer l: /y
Net Use * /delete /y

net use l: \\1.1.1.1\Certificates__NEW /user:123-N2\user user
cd D:\PKI\Archive\Transit\
xcopy *.cer l: /y
Net Use * /delete /y


net use l: \\1.1.1.1\Certificates_NEW /user:123-N2\user user
cd D:\PKI\Archive\Transit\
xcopy *.cer l: /y
Net use l: /delete

net use l: \\1.1.1.1\Certificates_200_NEW /user:123-N2\user user
cd D:\PKI\Archive\Transit\
xcopy *.cer l: /y
Net Use * /delete /y

net use l: \\1.1.1.1\Certificates_300_NEW /user:123-N2\user user
cd D:\PKI\Archive\Transit\
xcopy *.cer l: /y
Net Use * /delete /y

net use l: \\1.1.1.1\Certificates_400_NEW /user:123-N2\user user
cd D:\PKI\Archive\Transit\
xcopy *.cer l: /y
Net Use * /delete /y

net use l: \\1.1.1.1\Certificates_600_NEW /user:123-N2\user user
cd D:\PKI\Archive\Transit\
xcopy *.cer l: /y
Net Use * /delete /y

net use l: \\1.1.1.1\Certificates_700_NEW /user:123-N2\user user
cd D:\PKI\Archive\Transit\
xcopy *.cer l: /y
Net Use * /delete /y

net use l: \\1.1.1.1\Certificates_CA_NEW /user:123-N2\user user
cd D:\PKI\Archive\Transit\
xcopy *.cer l: /y
Net Use * /delete /y

rem cd D:\PKI\Archive\Transit\
rem move /y *.cer D:\PKI\Archive\


set datetemp=%date:~-10%

MD d:\PKI\Archive\%datetemp%


cd cd D:\PKI\Archive\Transit\

xcopy *.* d:\PKI\Archive\%datetemp% /S /Y

set folder="cd D:\PKI\Archive\Transit\"

cd /d %folder%

for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

Net Use * /delete /y
