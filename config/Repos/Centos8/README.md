/repo/centos8 NFS mount.
/centos8 docker içindeki volume.

BaseOS, AppStream, extras centos8 repoları. Bu repolardan biri, ikisini veya hepsini konteyner a parametre olarak geçilerek senkronizasyon işlemi gerçekleşir.

# docker run -v --network=host /repo/centos8/:/centos8 ek/echo:v7 BaseOS 
# docker run -v --network=host /repo/centos8/:/centos8 ek/echo:v7 BaseOS AppStream extras
