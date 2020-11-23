/repo/centos7 NFS mount.
/centos7 docker içindeki volume.

base, updates, extras, centosplus centos7 repoları. Bu repolardan biri, ikisini veya hepsini konteyner a parametre olarak geçilerek senkronizasyon işlemi gerçekleşir.

# docker run --network=host -v /repo/centos7/:/centos7 ek/echo:v7 base
# docker run --network=host -v /repo/centos7/:/centos7 ek/echo:v7 base updates centosplus extras
