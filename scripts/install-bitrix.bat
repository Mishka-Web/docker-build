@echo off
cd /d "%~dp0\..\www"
IF EXIST index.php (
  echo Bitrix already present.
) ELSE (
  echo Downloading Bitrix setup...
  curl -LO https://www.1c-bitrix.ru/download/scripts/bitrixsetup.php
  echo Bitrix setup script downloaded to www\bitrixsetup.php
)