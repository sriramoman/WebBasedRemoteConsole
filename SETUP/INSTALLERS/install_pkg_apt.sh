export DEBIAN_FRONTEND=noninteractive;
rm /var/lib/dpkg/lock;
rm /var/lib/apt/lists/lock;
killall -9 apt-get;
killall -9 dpkg;
apt-get update >> Log;
apt-get install -y apache2 >> Log;
apt-get install -y libapache2-mod-python >> Log;
apt-get install -y openssh-server >> Log;
apt-get install -y python-paramiko >> Log;
export DEBIAN_FRONTEND=noninteractive;
apt-get install -y mysql-server >> Log;
apt-get install -y python-mysqldb >> Log;
apt-get install -y libnss3-1d libxss1 libcurl3 >> Log;
cp INSTALLERS/debs/apache2.conf /etc/apache/apache2.conf;
echo "Apache hopefully reconfigured" >> Log;
/etc/init.d/apache2 restart >> Log;
echo "Beginning to correct dependencies" >> Log;
dpkg --configure -a >> Log;
apt-get install -y --fix-broken >> Log;
echo "Dependecies corrected" >> Log;