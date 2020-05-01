cp lofiscifi.liq ../liquidsoap-daemon/script
cd ../liquidsoap-daemon
./daemonize-liquidsoap.sh lofiscifi
sudo systemctl stop lofiscifi-liquidsoap.service
sudo systemctl start lofiscifi-liquidsoap.service
cd ../oldtimeradio