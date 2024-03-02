#!/usr/bin/env bash

set -eu

# Ensure predictable numeric / date formats, etc.
export LC_ALL=C

# Grab the start time.
START="$(date +%s)"

# Backup the k3s DB into a temp file.
sqlite3 /var/lib/rancher/k3s/server/db/state.db "VACUUM INTO '/tmp/k3s.bak'"

# Integrity check the backup.
sqlite3 /tmp/k3s.bak 'PRAGMA integrity_check'

# GZip and upload the backup into
gzip /tmp/k3s.bak
gcloud storage cp /tmp/k3s.bak.gz gs://wiersma-tech-backup/k3s/db/backup-`date +%a-%H`.gz

# Grab the end time
END="$(date +%s)"

echo "# HELP k3s_backup_duration_seconds Backup duration in seconds"
echo "# TYPE k3s_backup_duration_seconds gauge"
echo "k3s_backup_duration_seconds $(($END - $START))"

echo "# HELP k3s_backup_last_run_seconds Last successful backup timestamp in seconds"
echo "# TYPE k3s_backup_last_run_seconds gauge"
echo "k3s_backup_last_run_seconds $END"
