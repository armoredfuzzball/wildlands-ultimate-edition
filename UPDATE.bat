@echo off
if not exist "PortableGit" (
  if not exist "PortableGit-2.54.0-64-bit.7z.exe" (
    echo PortableGit archive not found. Please ensure "PortableGit-2.54.0-64-bit.7z.exe" is in the same directory as this script.
    pause
    exit /b 1
  ) else (
    echo Extracting PortableGit... press OK in dialog.
    "PortableGit-2.54.0-64-bit.7z.exe" x -o "PortableGit" -y >nul
    if errorlevel 1 (
      echo Failed to extract PortableGit. Please check the archive and try again.
      pause
      exit /b 1
    )
    echo PortableGit extracted successfully.
  )
)

if exist "PortableGit-2.54.0-64-bit.7z.exe" (
  del "PortableGit-2.54.0-64-bit.7z.exe"
)
@REM @REM delete everything inside .\PortableGit\ except for bin folder and mingw64 folder
@REM for /d %%i in (.\PortableGit\*) do (
@REM   if /i not "%%~nxi"=="bin" if /i not "%%~nxi"=="mingw64" rd /s /q "%%i"
@REM )
@REM @REM delete everything inside .\PortableGit\mingw64\ except for bin folder and libexec folder
@REM for /d %%i in (.\PortableGit\mingw64\*) do (
@REM   if /i not "%%~nxi"=="bin" if /i not "%%~nxi"=="libexec" rd /s /q "%%i"
@REM )
@REM echo Cleanup of PortableGit directory complete.

if not exist ".git" (
  echo Git repository not found. Initializing...
  .\PortableGit\bin\git.exe init
  .\PortableGit\bin\git.exe remote add origin https://github.com/ArmoredFuzzball/Wildlands-Ultimate-Edition.git
  echo Fetching from remote...
  .\PortableGit\bin\git.exe fetch origin
  echo Checking out main branch...
  .\PortableGit\bin\git.exe checkout -b main origin/main -f
) else (
  echo Available branches:
  .\PortableGit\bin\git.exe branch -r
  set /p branch="Enter the branch to switch to. Do not include origin/ (default: main): "
  if "%branch%"=="" set branch=main
  .\PortableGit\bin\git.exe fetch origin
  .\PortableGit\bin\git.exe checkout %branch% -f
)

echo Update complete!
pause