
Usage: sdc-s3-backup [ UUID | all | -f filename | help | -h ]

Description:

  Simple script to backup all or selected zones.
  Each zone is recursively snapshoted and sent
  to an SSH gateway zone where it expects to
  upload the snapshot to an S3 compatible object
  store via s3cmd.

  Additionally the headnode config is backed up.

Options:

  UUID   backup a single zone identified by UUID
  all    backup all zones on this headnode
  -f     backup zones listed in file (one UUID per line)
  -h     display this help
  help   same as -h

Requires:

  - SmartOS
  - SSH zone with s3cmd (installed/configured)
  - SSH pubkey auth from headnode to SSH zone
  - s3cmd 1.5.x or higher (pip install s3cmd)
  - configuration file /opt/custom/etc/sdc-s3-backup.conf

Assumptions:

  - this script is installed in /opt/custom/bin/sdc-s3-backup
  - needs to run on headnode
  - SSH pubkey authentication from headnode to SSH zone
  - s3cmd is configured to access the bucket
  - SSH zone/box with s3 access

   [headnode]
       |
     (ssh)
       |
   [SSH zone]
       |
     (s3)
       |
  [s3 storage]
    (LeoFS)

