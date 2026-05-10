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

@REM delete the archive after extraction
if exist "PortableGit-2.54.0-64-bit.7z.exe" (
  del "PortableGit-2.54.0-64-bit.7z.exe"
)
@REM delete everything inside .\PortableGit\ except for bin folder and mingw64 folder
for /d %%i in (.\PortableGit\*) do (
  if /i not "%%~nxi"=="bin" if /i not "%%~nxi"=="mingw64" rd /s /q "%%i"
)
@REM delete everything inside .\PortableGit\mingw64\ except for bin folder and libexec folder
for /d %%i in (.\PortableGit\mingw64\*) do (
  if /i not "%%~nxi"=="bin" if /i not "%%~nxi"=="libexec" rd /s /q "%%i"
)
echo Cleanup of PortableGit directory complete.

if not exist ".git" (
  echo Git repository not found. Initializing...
  .\PortableGit\bin\git.exe init
  .\PortableGit\bin\git.exe remote add origin https://github.com/ArmoredFuzzball/Wildlands-Ultimate-Edition.git
  echo Fetching from remote...
  .\PortableGit\bin\git.exe fetch origin
  echo Checking out main branch...
  .\PortableGit\bin\git.exe checkout -b main origin/main -f
) else (
  echo Updating repository...
  .\PortableGit\bin\git.exe pull origin main
)

echo Update complete!
pause