#!/bin/ksh
disk=`lspv | grep None | awk '{print $1}'`
for i in $disk
   do
    res=`lquerypv -h /dev/$i | grep ORCLDISK`
   if [[ $res != "" ]]
   then
      echo "disk $i has the ORCLDISK header."
      dd if=/dev/zero of=/dev/$i bs=1024000 count=1
fi
done
