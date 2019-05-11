@echo off&color&color 0a
title Automatic Mail Fishing v1.8

::初始化
echo,
set smtp=smtp.xxx.com
set user=mailuser@xxxx.com
set pass=xxx
set subtitle=【重要通知】关于工资发放调整声明
set mailhtml=%cd%\data\mailhtml.html
set mailtext=%cd%\data\mailtext.txt
set attach=%cd%\data\附件.doc
set recvlist=%cd%\data\recvlist.txt
set maillog=-debug -log %cd%\data\maillog.log -timestamp




IF /i "%~1"=="html" (goto html)
IF /i "%~1"=="makemail" goto makemail
IF /I Not "%~2"=="" (
    IF /i "%~1"=="text" set recvlist=%~2 &&goto text
    IF /i "%~1"=="html" set recvlist=%~2 &&goto html
    )
)
IF /i "%~1"=="" (goto text)
IF /i "%~1"=="text" (goto text)


::echo The service is being registered for you. Please wait a moment...
::blat.exe -install %smtp% %user%
::for /f %%i in (%cd%\data\receiver.txt) do (blat.exe %mailtext% -attach %attach% -to %%i  -subject "%subtitle%"  -server "%smtp%" -u %user% -pw %pass% -base64 -charset Gb2312  -from "hwzhb@mps.gov.cn"
::if %ERRORLEVEL%==0 (echo %%i send ok Send success! ) else  (echo %%i Mail address does not exist!)

:text
blat2.exe -install %smtp% %user% 5 25 >nul
echo Receiving people
type %recvlist%||goto :eof
echo,
echo,
echo Please wait a moment...
blat2.exe %mailtext% -attach %attach% -bf %recvlist% -sender 财务 -subject "%subtitle%"  -server "%smtp%" -u %user% -pw %pass% -html -base64 -charset Gb2312 -sender "caiwu@xxx.com" -noh -noh2 -priority 2 %maillog% >nul

echo,
echo All mails are sent to success!!!

color
goto :eof


:html
blat2.exe -install %smtp% %user% 5 25 >nul
echo Receiving people
type %recvlist%
echo,
echo,
echo Please wait a moment...
blat2.exe %mailhtml% -attach %attach% -bf %recvlist% -sender 财务 -subject "%subtitle%"  -server "%smtp%" -u %user% -pw %pass% -html -base64 -charset Gb2312 -sender "caiwu@xxx.com" -noh -noh2 -priority 2 %maillog% >nul

echo,
echo All mails are sent to success!!!

color
goto :eof


:makemail
IF NOT "%~2"=="" (setlocal ENABLEDELAYEDEXPANSION) ELSE (echo 参数不正确!&exit /b 0)
set a=0
set mail=%~2
for /f "delims=" %%a in (%cd%\data\xmtop500.dat) do (
  set /a a+=1
  echo %%a@%mail% ok!
  echo %%a@%mail%>>%cd%\data\%mail%.txt
  if "!a!"=="1000" goto ll
)
:ll
goto :eof