@echo off


set NAME=liuhuapiaoyuan/ai-removebg

docker build -t %NAME%:latest .

FOR /F "tokens=1-3 delims=/" %%a in ('date /T') do (
    SET "year=%%a"
    SET "month=%%b"
    SET "day=%%c"
)
SET "randomId=%RANDOM%"

FOR /F "tokens=1" %%d in ("%day%") do SET "day=%%d"

IF 1%month% LSS 20 SET month=0%month%
IF 1%day% LSS 20 SET day=0%day%

SET "datetime=%year%-%month%-%day%-%randomId%"


docker tag %NAME%:latest "%NAME%:%datetime%"
docker push %NAME%:latest
docker push "%NAME%:%datetime%"
 

ENDLOCAL
