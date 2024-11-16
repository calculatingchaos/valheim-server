#!/bin/sh
kopia snapshot delete --delete --all-snapshots-for-source ~/.config/unity3d/IronGate/Valheim/worlds_local
echo "PURGED ALL SNAPSHOTS: $(date)"
