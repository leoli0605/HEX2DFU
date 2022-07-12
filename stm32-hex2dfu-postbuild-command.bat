@echo off
:START
if exist HEX2DFU.exe (
    for %%A in (*.hex) do (
        HEX2DFU.exe "%%~nA.hex" -out "%%~nA.dfu"
    )
) else (
    git clone "https://gitlab.com/leoli-tyrafos/stm32-hex2dfu-commandline.git"
    move /y "stm32-hex2dfu-commandline\HEX2DFU.exe" "HEX2DFU.exe"
    rd  /s /q "stm32-hex2dfu-commandline"
    goto START
)