@echo off
setlocal EnableDelayedExpansion

:start
cls
echo Password Generator
echo -----------------
set /p length="Enter password length (8-50): "
if %length% lss 8 goto start
if %length% gtr 50 goto start

set chars=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%%^&*()_+-=[]{}|;:,.<>?
set password=

for /L %%i in (1,1,%length%) do (
    set /a rand=!random! %% 92
    for /f %%j in ("!rand!") do set password=!password!!chars:~%%j,1!
)

echo.
echo Generated password: !password!
echo.
pause
goto start
