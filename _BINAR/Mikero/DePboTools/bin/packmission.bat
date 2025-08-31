@echo off
color 0a

set _MissionPackOptions=-Z "*.cpp,*.paa,*.fsm,*.sqf,*ogg" -p -$ -N -!

set "_PackTool=C:\Program Files (x86)\Mikero\DePboTools\bin\MakePbo.exe"

set "_missionPath=C:\Users\medve\Desktop\TUT BIMARIM VSAKUY HYINY"

::Mission Pack
"%_PackTool%" -@=MEGA_STAFF_BendeR_v5.0.52.69.Altis %_MissionPackOptions% "%_missionPath%\MEGA_STAFF_BendeR_v5.0.52.69.Altis" "%_missionPath%\MEGA_STAFF_BendeR_v5.0.52.69.Altis.pbo"