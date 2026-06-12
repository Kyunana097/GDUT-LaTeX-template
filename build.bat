@echo off
:: GDUT LaTeX Build Script
:: Double-click to run, or run from CMD

set "TEXFILE=main"
set "XELATEX=D:\texlive\2025\bin\windows\xelatex.exe"

if not exist "%XELATEX%" (
    echo [ERROR] xelatex not found: %XELATEX%
    echo Please check TeX Live installation path.
    pause
    exit /b 1
)

echo Building %TEXFILE%.tex ...
echo.

:: Clean aux files
del /q "%TEXFILE%.aux" "%TEXFILE%.toc" "%TEXFILE%.out" "%TEXFILE%.log" >nul 2>&1

:: Pass 1
echo [1/2] XeLaTeX pass 1...
"%XELATEX%" -interaction=nonstopmode "%TEXFILE%.tex" >nul 2>&1
if %errorlevel% neq 0 (
    echo !! Build failed. Check %TEXFILE%.log
    pause
    exit /b 1
)
echo     OK.

:: Pass 2
echo [2/2] XeLaTeX pass 2...
"%XELATEX%" -interaction=nonstopmode "%TEXFILE%.tex" >nul 2>&1
if %errorlevel% neq 0 (
    echo !! Build failed. Check %TEXFILE%.log
    pause
    exit /b 1
)
echo     OK.

:: Clean aux files
del /q "%TEXFILE%.aux" "%TEXFILE%.toc" "%TEXFILE%.out" "%TEXFILE%.log" >nul 2>&1

echo.
echo === Build success ===
echo Output: %TEXFILE%.pdf
echo.

pause
