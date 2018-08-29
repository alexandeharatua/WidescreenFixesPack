set "XNFSTPKTool=%cd%\..\XNFSTPKTool.exe"
set "texconv=%cd%\..\texconv.exe"


REM rmdir /Q /S unpacked
md unpacked
cd ..
cd textures
for /r %%f in (*.dds) do ( %texconv% -pow2 -h 32 -m 1 -o ../NFSUC/unpacked/textures %%f )
cd ..
cd NFSUC
%XNFSTPKTool% GLOBALB.BUN.000002.tpk.bin unpacked
%XNFSTPKTool% HUDTEXRACE.BIN.000001.tpk.bin unpacked
xcopy /S /Q /Y /F "./unpacked/textures/a.dds" "unpacked/1B4F984/A.dds"
xcopy /S /Q /Y /F "./unpacked/textures/b.dds" "unpacked/1B4F984/B.dds"
REM xcopy /S /Q /Y /F "./unpacked/textures/dummy.dds" "unpacked/1B4F984/BUTTON_C.dds"
xcopy /S /Q /Y /F "./unpacked/textures/b.dds" "unpacked/1B4F984/B_FRENCH.dds"
xcopy /S /Q /Y /F "./unpacked/textures/b.dds" "unpacked/1B4F984/ESC.dds"
xcopy /S /Q /Y /F "./unpacked/textures/b.dds" "unpacked/1B4F984/ESC_FRENCH.dds"
REM xcopy /S /Q /Y /F "./unpacked/textures/ls.dds" "unpacked/1B4F984/L3.dds"
xcopy /S /Q /Y /F "./unpacked/textures/lb.dds" "unpacked/1B4F984/LB.dds"
xcopy /S /Q /Y /F "./unpacked/textures/lsdirectional.dds" "unpacked/1B4F984/LEFT_ANALOG.dds"
xcopy /S /Q /Y /F "./unpacked/textures/lt.dds" "unpacked/1B4F984/LT.dds"
xcopy /S /Q /Y /F "./unpacked/textures/rb.dds" "unpacked/1B4F984/RB.dds"
xcopy /S /Q /Y /F "./unpacked/textures/lsdirectional.dds" "unpacked/1B4F984/RIGHT_ANALOG.dds"
xcopy /S /Q /Y /F "./unpacked/textures/rt.dds" "unpacked/1B4F984/RT.dds"
xcopy /S /Q /Y /F "./unpacked/textures/y.dds" "unpacked/1B4F984/X.dds"
REM xcopy /S /Q /Y /F "./unpacked/textures/y.dds" "unpacked/1B4F984/Y.dds"
%XNFSTPKTool% -w unpacked/1B4F984.ini unpacked/temp1.tpk
xcopy /S /Q /Y /F "./unpacked/textures/xdpaddown.dds" "unpacked/2F0D85E/HUD_RACE_NOW_PC.dds"
xcopy /S /Q /Y /F "./unpacked/textures/xdpaddown.dds" "unpacked/2F0D85E/HUD_RACE_NOW_PS3.dds"
xcopy /S /Q /Y /F "./unpacked/textures/xdpaddown.dds" "unpacked/2F0D85E/HUD_RACE_NOW_XENON.dds"
%XNFSTPKTool% -w unpacked/2F0D85E.ini unpacked/temp2.tpk
cd unpacked
copy /b temp1.tpk+temp2.tpk buttons-xbox.tpk
cd ..
xcopy /S /Q /Y /F "unpacked/buttons-xbox.tpk" "../../../data/NFSUndercover.GenericFix/scripts/buttons-xbox.tpk"
rmdir /Q /S unpacked