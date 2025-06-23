#!/bin/bash
set -e
cd "$(dirname "$0")/../www"

if [ -f "index.php" ]; then
  echo "Bitrix уже установлен."
  exit 0
fi

echo "Скачиваем дистрибутив Bitrix..."
curl -LO https://www.1c-bitrix.ru/download/bitrixsetup_kernel.tar.gz

echo "Распаковываем..."
tar -xzf bitrixsetup_kernel.tar.gz
rm bitrixsetup_kernel.tar.gz

echo "Создаем dbconn.php и settings.php..."
mkdir -p bitrix/php_interface

cat > bitrix/php_interface/dbconn.php <<EOF
<?php
define("DBType", "mysql");
\$DBHost = "mysql";
\$DBLogin = "dev_user";
\$DBPassword = "dev_pass";
\$DBName = "dev_db";
EOF

cat > bitrix/.settings.php <<EOF
<?php
return [
  'connections' => [
    'value' => [
      'default' => [
        'host' => 'mysql',
        'database' => 'dev_db',
        'login' => 'dev_user',
        'password' => 'dev_pass',
        'className' => '\\Bitrix\\Main\\DB\\MysqlConnection',
      ],
    ],
  ],
];
EOF

echo "Bitrix успешно установлен!"