@echo off
title Headless Client

::Настройки армы
set level=@RRPHeadless
set port=2302
set mod=@1368860933;@RRPHeadless;@extensions

::Запуск хедлесс клиента
echo Starting headless...
start C:\SERVER\arma3server_x64.exe -client "-mod=%mod%" -profiles=%level% -connect=127.0.0.1:2302 -enableHT -hugepages -maxMem=8000 -malloc=tbb4malloc_bi_x64 -debug -limitFPS=999 
echo Headless starting...