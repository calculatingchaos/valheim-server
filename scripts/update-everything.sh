#!/bin/sh

echo "This script will:"
echo "- deactivate cron by installing a blank cron config from ~/scripts/cron-configs/inactive.sh"
echo "- shut down the game server"
echo "- backup the server with kopia"
echo "- update lgsm, os dependencies, os updates, game"
echo "- reinstall cron by reinstalling the cron config from ~/scripts/cron-configs/active.sh"
echo "- reboot the server"
echo "BEFORE RUNNING, ENSURE ALL SCRIPTS ARE UPDATED TO POINT TO THE CORRECT SAVE PATH"
printf "%s " "Do you wish to continue? Press enter to continue or CTRL+C to quit."
read ans

echo "[!] sudo necessary to continue"
sudo echo "authorized"

echo "deactivating crontab for now"
~/scripts/install-inactive-crontab.sh

echo "stopping game"
~/vhserver stop
sleep 5

echo "taking snapshot backup"
~/scripts/backup-snapshot.sh

echo "updating os dependencies"
~/scripts/update-deps.sh

echo "updating operating system"
~/scripts/update-os.sh

echo "updating game service"
~/vhserver u

echo "updating LinuxGSM"
~/vhserver ul

echo "[!] server will reboot in 5 seconds (press CTRL+C to cancel); please ensure installation was successful before restart."
sleep 5

echo "reinstalling active crontab"
~/scripts/install-active-crontab.sh

# reboot server
sudo reboot
