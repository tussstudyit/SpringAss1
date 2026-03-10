@echo off
REM ===================================
REM Build and Deploy Script for AIPO
REM ===================================

echo.
echo ====================================
echo AIPO User Management - Build & Deploy
echo ====================================
echo.

REM Set variables
set PROJECT_DIR=C:\Users\ADMIN\IdeaProjects\JFSW.L.A101
set TOMCAT_HOME=C:\apache-tomcat-9
set WEBAPPS_DIR=%TOMCAT_HOME%\webapps

echo Step 1: Clean build...
cd /d %PROJECT_DIR%
call mvn clean package -DskipTests

if %ERRORLEVEL% NEQ 0 (
    echo ❌ Build failed!
    pause
    exit /b 1
)

echo.
echo ✅ Build successful!
echo.

REM Check if Tomcat is running
echo Step 2: Checking if Tomcat is running...
tasklist | find /I "catalina" >nul
if %ERRORLEVEL% EQU 0 (
    echo ⚠️ Tomcat is running. Please stop it first!
    echo.
    echo To stop Tomcat, run: %TOMCAT_HOME%\bin\shutdown.bat
    echo.
    pause
    exit /b 1
)

echo ✅ Tomcat is not running.
echo.

REM Remove old files
echo Step 3: Cleaning old files...
if exist "%WEBAPPS_DIR%\aipo-user-management" (
    rmdir /s /q "%WEBAPPS_DIR%\aipo-user-management"
    echo ✅ Removed old aipo-user-management folder
)

if exist "%WEBAPPS_DIR%\aipo-user-management-1.0-SNAPSHOT" (
    rmdir /s /q "%WEBAPPS_DIR%\aipo-user-management-1.0-SNAPSHOT"
    echo ✅ Removed old aipo-user-management-1.0-SNAPSHOT folder
)

if exist "%WEBAPPS_DIR%\aipo-user-management.war" (
    del /q "%WEBAPPS_DIR%\aipo-user-management.war"
    echo ✅ Removed old aipo-user-management.war
)

if exist "%WEBAPPS_DIR%\aipo-user-management-1.0-SNAPSHOT.war" (
    del /q "%WEBAPPS_DIR%\aipo-user-management-1.0-SNAPSHOT.war"
    echo ✅ Removed old aipo-user-management-1.0-SNAPSHOT.war
)

echo.

REM Copy new WAR
echo Step 4: Copying new WAR file...
copy "%PROJECT_DIR%\target\aipo-user-management-1.0-SNAPSHOT.war" "%WEBAPPS_DIR%\"
if %ERRORLEVEL% EQU 0 (
    echo ✅ WAR file copied successfully!
) else (
    echo ❌ Failed to copy WAR file!
    pause
    exit /b 1
)

echo.
echo ====================================
echo ✅ ALL DONE!
echo ====================================
echo.
echo Now:
echo 1. Start Tomcat: %TOMCAT_HOME%\bin\startup.bat
echo 2. Open browser: http://localhost:8080/aipo-user-management-1.0-SNAPSHOT/
echo.
echo Or rename WAR to "aipo-user-management.war" for shorter URL
echo.
pause

