@echo off
for %%i in ("%~dp0.") do set "current=%%~fi"
@echo %current%

for %%A in (%current%\build\*hex) do (
	@echo Full Path: %%A
	@echo Directory: %%~pA
	@echo File Name: %%~nA
	@echo.
	copy /Y "%%A" "%current%\"
	%current%\hex2dfu\hex2dfu.exe -t "%%~nA.hex" "%%~nA.dfu"
	@echo.
	copy /Y "%%~nA.dfu" "%current%\build\"
	del /Q "%%~nA.hex" "%%~nA.dfu"
)