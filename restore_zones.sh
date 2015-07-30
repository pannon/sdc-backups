#!/bin/sh
# Import ZFS images into fresh pool
# Note: this needs to run at least 3 times as
#       clone origins need to be imported first.
# ZFS dataset images are expected to be in the same folder
# as this script.

for image in $(ls *zfs.gz) ; do 
    uuid=$(echo $image|cut -f1 -d.) && \
    gzcat $image | zfs recv -v zones/${uuid}
done
