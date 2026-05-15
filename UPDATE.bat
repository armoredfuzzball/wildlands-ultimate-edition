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

if not exist ".git" (
  echo Git repository not found. Initializing...
  .\PortableGit\bin\git.exe init
  .\PortableGit\bin\git.exe remote add origin https://github.com/ArmoredFuzzball/Wildlands-Ultimate-Edition.git
  echo Fetching from remote...
  .\PortableGit\bin\git.exe fetch origin
  echo Checking out release branch...
  .\PortableGit\bin\git.exe checkout -b release origin/release -f
) else (
  echo Available branches:
  .\PortableGit\bin\git.exe branch -r
  set /p branch="Enter the branch to switch to. If you don't know what you're doing, just press Enter. Do not include origin/ (default: release): "
  if "%branch%"=="" set branch=release
  echo Switching to branch: %branch%
  .\PortableGit\bin\git.exe checkout %branch% -f
  .\PortableGit\bin\git.exe reset --hard origin/%branch%
)

echo Update complete!
pause