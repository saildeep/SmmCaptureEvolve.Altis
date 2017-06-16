@echo off
SET maps=Tanoa Stratis Chernarus Takistan Australia lythium
for %%a in (.) do set currentfolder=%%~na
echo "%currentfolder%"
@echo off
for /F "delims=" %%a in (maps.txt) do (
     echo Generating %%a
     del /S /F /Q "%CD%\..\%currentfolder%.%%a"
     mkdir "%CD%\..\%currentfolder%.%%a"
     xcopy /E "%CD%" "%CD%\..\%currentfolder%.%%a"
)