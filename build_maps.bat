@echo off
SET maps=Tanoa Stratis Chernarus Takistan
for %%a in (.) do set currentfolder=%%~na
echo "%currentfolder%"
(for %%a in (%maps%) do (
   echo %%a
REM cleanup old folders
   del /S /F /Q "%CD%\..\%currentfolder%.%%a"
   mkdir "%CD%\..\%currentfolder%.%%a"
   xcopy /E "%CD%" "%CD%\..\%currentfolder%.%%a"
))
