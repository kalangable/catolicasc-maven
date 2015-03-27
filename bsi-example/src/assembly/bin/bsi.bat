@echo off
 setLocal EnableDelayedExpansion
 set LIBDIR=".\lib"
 set LOG_CONF=.\conf\logging.conf


 set JAVA=java
 set JAVA_OPTS="-Djava.util.logging.config.file=%LOG_CONF%"

 
 set MAIN_CLASS=org.catolicasc.MainLoop
 set CLASSPATH=".\lib
 for %%a in (%LIBDIR%\*.jar) do (
   set CLASSPATH=!CLASSPATH!;%%a
 )
 set CLASSPATH=!CLASSPATH!"
 
 echo ===============================================================================
 echo.
 echo   JAVA: "%JAVA%"
 echo.
 echo   JAVA_OPTS: %JAVA_OPTS%
 echo.
 echo   %JAVA% %JAVA_OPTS% -classpath %CLASSPATH% %MAIN_CLASS%
 echo.
 echo ===============================================================================
 echo.
  
 call %JAVA% %JAVA_OPTS% -classpath "%CLASSPATH%" %MAIN_CLASS%  