#!/bin/sh
~/scripts/install-inactive-crontab.sh
~/vhserver stop
sleep 5
~/scripts/backup-snapshot.sh
~/vhserver u
~/vhserver start
sleep 5
~/scripts/install-active-crontab.sh
