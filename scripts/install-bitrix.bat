@echo off
cd /d "%~dp0\..\www"

IF EXIST index.php (
  echo Bitrix уже установлен.
  exit /b
)

IF NOT EXIST "..\\scripts\\bitrix-setup.tar.gz" (
  echo ERROR: нет архива bitrix-setup.tar.gz в папке scripts\
  echo Скачай его с официального сайта Bitrix
  exit /b
)

echo Распаковываем Bitrix в www\ ...
tar -xzf "..\\scripts\\bitrix-setup.tar.gz" --strip-components=1

echo Создаём dbconn.php...
(
  echo ^<?php
  echo define("DBType", "mysql");
  echo $DBHost = "mysql";
  echo $DBLogin = "dev_user";
  echo $DBPassword = "dev_pass";
  echo $DBName = "dev_db";
) > bitrix\\php_interface\\dbconn.php

echo Bitrix успешно установлен локально!