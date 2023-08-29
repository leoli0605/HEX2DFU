@echo off

for /f "tokens=* usebackq" %%a in (`where /f /r "build" "*.dfu"`) do set binFile=%%a
for /f "tokens=* usebackq" %%i IN (`where /f /r "hex2dfu" "DfuSeCommand.exe"`) do set downloader=%%i
if exist %binFile% (
    if exist %downloader% (
        for /f %%i in (%binFile%) do @echo BinFile: %binFile% @ %%~ti
        %downloader% -c --de 0 -d --v --o --fn %binFile%
        @echo.
        @echo Download Finish: %date% %time%
        goto :EOF
    )
)

@echo.
@echo Download Fail: %date% %time%
goto :EOF
