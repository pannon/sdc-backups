```

Usage: sdc-headnode-backup [ global | UUID | all | -f filename | usb | help | -h ]

Description:

  Simple script to backup all or selected zones.
  Each zone is recursively snapshoted and sent
  to an SSH gateway zone where it expects to
  upload the snapshot to Manta (with mput) or an
  S3 compatible object store via s3cmd.

  Additionally the headnode config is backed up.

Options:

  global   backup global zone bits (/opt /var /etc/zones)
  UUID     backup a single zone identified by UUID
  all      backup everything (global, non-global and usb config)
  -f       backup zones listed in file (one UUID per line)
  usb      backup usb config file
  json     backup zone_uuid.json configuration
  help|-h  display this help

Requires:

  - SmartOS
  - SSH zone with s3cmd (installed/configured)
  - SSH pubkey auth from headnode to SSH zone
  - mput (npm install -g manta)
  - s3cmd 1.5.x or higher (pip install s3cmd)
  - configuration file /opt/custom/etc/sdc-headnode-backup.conf

Assumptions:

  - this script is installed in /opt/custom/bin/sdc-headnode-backup
  - needs to run on headnode
  - SSH pubkey authentication from headnode to SSH zone
  - mput flags are configured in sdc-headnode-backup.conf
  - s3cmd is configured to access the bucket (sdc-headnode-backup.conf)
  - SSH zone/box with Manta or s3 access

         [headnode]
             |
           (ssh)
             |
         [SSH zone]
          /     \
      (s3cmd)  (mput)
        /         \
 [s3 storage]  [Manta storage]
    (LeoFS)

```
