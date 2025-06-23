#!/bin/bash
set -e
cd "$(dirname "$0")/../www"
if [ ! -f "index.php" ]; then
  echo "Installing Bitrix..."
  curl -LO https://www.1c-bitrix.ru/download/scripts/bitrixsetup.php
  echo "Bitrix setup script downloaded to www/bitrixsetup.php"
else
  echo "Bitrix already present."
fi