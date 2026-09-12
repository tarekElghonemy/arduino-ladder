@echo off
cd /d "C:\Users\pc\AppData\Local\Programs\Python\Python38\Scripts"
echo.
echo ========================================
echo   PyInstaller Builder (onefile only)
echo ========================================
echo.

:: Ask for the Python file
echo Select your Python file...
set /p PYFILE="Drag and drop the .py file here and press Enter: "

:: Remove surrounding quotes if the user dragged the file
set PYFILE=%PYFILE:"=%

:: Extract just the filename without path and without .py extension
for %%F in ("%PYFILE%") do (
    set "EXENAME=%%~nF"
)

:: Fixed output folder in Documents
set "OUTDIR=%USERPROFILE%\Documents\pyapplocations"

:: Create the output folder if it doesn't exist
if not exist "%OUTDIR%" mkdir "%OUTDIR%"

echo.
echo Building "%EXENAME%.exe" (onefile)...
echo Output folder: %OUTDIR%
echo.
echo Please wait...
echo.

pyinstaller.exe --onefile --windowed --name="%EXENAME%" --distpath="%OUTDIR%" --workpath="%OUTDIR%\build" --specpath="%OUTDIR%" "%PYFILE%"

:: Clean up temporary files so only the .exe remains
if exist "%OUTDIR%\build" rd /s /q "%OUTDIR%\build"
if exist "%OUTDIR%\%EXENAME%.spec" del /q "%OUTDIR%\%EXENAME%.spec"

echo.
echo ========================================
echo Done!
echo Your .exe is here: %OUTDIR%\%EXENAME%.exe
echo (only the single .exe file remains)
echo ========================================
pause