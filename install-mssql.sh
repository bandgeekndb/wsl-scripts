sudo su
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

#Download appropriate package for the OS version
#Update when new Ubuntu version is being used

#Ubuntu 18.04
curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

exit

sudo apt-get update
sudo ACCEPT_EULA=Y apt-get install msodbcsql17

#For bcp and sqlcmd
sudo ACCEPT_EULA=Y apt-get install mssql-tools
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc

#For unixODBC development headers (required for PECL to build sqlsrv/pdo_sqlsrv)
sudo apt-get install unixodbc-dev

#PECL build/install drivers
sudo pecl config-set php_ini /etc/php/7.4/fpm/php.ini
sudo pecl install sqlsrv
sudo pecl install pdo_sqlsrv

#Add extensions to PHP 7.4
sudo su
printf "; priority=20\nextension=sqlsrv.so\n" > /etc/php/7.4/mods-available/sqlsrv.ini
printf "; priority=30\nextension=pdo_sqlsrv.so\n" > /etc/php/7.4/mods-available/pdo_sqlsrv.ini
exit

#Enable new extensions
sudo phpenmod -v 7.4 sqlsrv pdo_sqlsrv
