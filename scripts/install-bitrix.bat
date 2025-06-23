@echo off
setlocal
cd /d "%~dp0\..\www"

IF EXIST index.php (
    echo Bitrix уже установлен.
    exit /b
)

echo Скачиваем дистрибутив Bitrix...
curl -LO https://www.1c-bitrix.ru/download/bitrixsetup_kernel.tar.gz

echo Распаковываем ядро Bitrix...
tar -xzf bitrixsetup_kernel.tar.gz
del bitrixsetup_kernel.tar.gz

echo Создаем dbconn.php и settings.php...

echo ^<?php > bitrix/php_interface/dbconn.php
echo define("DBType", "mysql"); >> bitrix/php_interface/dbconn.php
echo $DBHost = "mysql"; >> bitrix/php_interface/dbconn.php
echo $DBLogin = "dev_user"; >> bitrix/php_interface/dbconn.php
echo $DBPassword = "dev_pass"; >> bitrix/php_interface/dbconn.php
echo $DBName = "dev_db"; >> bitrix/php_interface/dbconn.php

echo ^<?php >> bitrix/.settings.php
echo return [ >> bitrix/.settings.php
echo 'connections' => [ >> bitrix/.settings.php
echo     'value' => [ >> bitrix/.settings.php
echo         'default' => [ >> bitrix/.settings.php
echo             'host' => 'mysql', >> bitrix/.settings.php
echo             'database' => 'dev_db', >> bitrix/.settings.php
echo             'login' => 'dev_user', >> bitrix/.settings.php
echo             'password' => 'dev_pass', >> bitrix/.settings.php
echo             'className' => '\\Bitrix\\Main\\DB\\MysqlConnection', >> bitrix/.settings.php
echo         ], >> bitrix/.settings.php
echo     ], >> bitrix/.settings.php
echo ], >> bitrix/.settings.php
echo ]; >> bitrix/.settings.php

echo Bitrix успешно установлен!