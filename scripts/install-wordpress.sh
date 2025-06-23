#!/bin/bash
set -e
cd "$(dirname "$0")/../www"
if [ ! -f "index.php" ]; then
  echo "Installing WordPress..."
  curl -LO https://wordpress.org/latest.tar.gz
  tar -xzf latest.tar.gz
  mv wordpress/* .
  rm -rf wordpress latest.tar.gz
  echo "WordPress installed."
else
  echo "WordPress already present."
fi