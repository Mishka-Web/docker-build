@echo off
cd /d "%~dp0\..\www"
IF EXIST index.php (
  echo WordPress already present.
) ELSE (
  echo Downloading WordPress...
  curl -LO https://wordpress.org/latest.zip
  tar -xf latest.zip
  move wordpress\* .
  rmdir /s /q wordpress
  del latest.zip
  echo WordPress installed.
)