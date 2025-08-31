@echo off
color 0a

set _MissionPackOptions=-Z "*.cpp,*.paa,*.fsm,*.sqf,*ogg" -p -$ -N -!

set "_PackTool=C:\SERVER\_BINAR\Mikero\DePboTools\bin\MakePbo.exe"

set "_missionPath=C:\SERVER\mpmissions"

::Mission Pack
"%_PackTool%" -@=Rocket.RRpMap %_MissionPackOptions% "%_missionPath%\Rocket.RRpMap" "%_missionPath%\Rocket.RRpMap.pbo"