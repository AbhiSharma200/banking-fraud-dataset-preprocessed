@echo off
title Push Banking Fraud Dataset to GitHub
cls
echo ==========================================================================
echo        BANKING FRAUD DATASET -- GITHUB PUSH SCRIPT
echo ==========================================================================
echo.

set GIT_BIN="C:\Users\hp\.cache\codex-runtimes\codex-primary-runtime\dependencies\native\git\cmd\git.exe"

set /p REPO_URL="Enter your GitHub Repository URL (e.g., https://github.com/Username/repo.git): "
if "%REPO_URL%"=="" (
    echo [ERROR] No repository URL entered. Exiting.
    pause
    exit /b 1
)

echo.
echo [1/3] Setting remote origin...
%GIT_BIN% remote remove origin 2>nul
%GIT_BIN% remote add origin %REPO_URL%

echo [2/3] Setting branch to main...
%GIT_BIN% branch -M main

echo [3/3] Pushing to GitHub (a sign-in browser prompt may appear)...
%GIT_BIN% push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ==========================================================================
    echo [SUCCESS] Dataset repository successfully pushed to GitHub!
    echo ==========================================================================
) else (
    echo.
    echo [ERROR] Git push failed. Please verify your repository URL and permissions.
)

pause
