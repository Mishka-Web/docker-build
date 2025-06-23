@echo off
set CMD=%1

IF "%CMD%"=="up" docker-compose up -d
IF "%CMD%"=="down" docker-compose down
IF "%CMD%"=="build" docker-compose build
IF "%CMD%"=="logs" docker-compose logs -f
IF "%CMD%"=="install-wp" call scripts\install-wordpress.bat
IF "%CMD%"=="install-bitrix" call scripts\install-bitrix.bat