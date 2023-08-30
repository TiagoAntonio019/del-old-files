# Delete old files
Script to delete old backups files.

## Check
File: backup.sh <br>
MD5 File Checksum: 475fd677e463497da5e7382c79101926

## How does it works?
<img src="https://i.ibb.co/yBzJGDp/Fluxograma.png" alt="Fluxograma" border="0">

## How to schedule a job ?
```bash
crontab -e
0 5 * * * /home/sandbox/backup.sh
```
In this example, the script will be performed every day at 05 AM.
