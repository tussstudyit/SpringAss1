@echo off
REM ===================================
REM Simple One-Click Build & Deploy
REM ===================================

cd C:\Users\ADMIN\IdeaProjects\JFSW.L.A101

echo.
echo ================================
echo  Building AIPO Project...
echo ================================
echo.

call mvn clean package -DskipTests

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✅ Build Successful!
    echo.
    echo WAR file location:
    echo C:\Users\ADMIN\IdeaProjects\JFSW.L.A101\target\aipo-user-management-1.0-SNAPSHOT.war
    echo.
    echo Next steps:
    echo 1. Stop Tomcat
    echo 2. Delete old files from: C:\apache-tomcat-9\webapps\aipo-user-management*
    echo 3. Copy WAR to: C:\apache-tomcat-9\webapps\
    echo 4. Start Tomcat
    echo 5. Access: http://localhost:8080/aipo-user-management-1.0-SNAPSHOT/
    echo.
) else (
    echo.
    echo ❌ Build Failed!
    echo.
)

pause

